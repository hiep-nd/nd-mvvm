//
//  ViewModels_Privates_NDMutableListViewModelHelper.h
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 6/29/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef __cplusplus

#import <NDLog/NDLog.h>

#import <list>
#import <vector>

NS_ASSUME_NONNULL_BEGIN

class NDMutableListViewModelHelper {
  typedef NSInteger Item;

  struct Section {
    static Item const kOriginalLocationInvalid = -1;
    Item location;
    Item originalLocation;
    inline static bool Less(const Item& lv, const Section& rv) {
      return lv < rv.location;
    }
  };

  typedef std::vector<Section> Sections;
  typedef std::list<Section> SectionList;

 public:
  inline void BeginUpdates() {
    _batchUpdating = YES;
    _items.assign(1, {0, 0});
  }

  inline BOOL IsBatchUpdating() { return _batchUpdating; }

  // MARK: - EndUpdates
 public:
  inline void EndUpdates(NSMutableArray* _Nullable* _Nonnull deleteds,
                         NSMutableArray* _Nullable* _Nonnull updateds,
                         NSMutableArray* _Nullable* _Nonnull inserteds) {
    *deleteds = [[NSMutableArray alloc] init];
    *updateds = [[NSMutableArray alloc] init];
    *inserteds = [[NSMutableArray alloc] init];

    for (auto it = _items.begin(), begin = _items.begin(), end = _items.end();
         it != end; it++) {
      if (it->originalLocation !=
          Section::kOriginalLocationInvalid) {  // Is orginals?
        if (it == begin) {
          FillWithOriginal(it, 0, *deleteds);
        } else {
          auto prev = it - 1;
          if (prev->originalLocation != Section::kOriginalLocationInvalid) {
            FillWithOriginal(it, prev->location - prev->originalLocation,
                             *deleteds);
          }
        }
        continue;
      }

      // new
      auto next = it + 1;
      auto prevDelta =
          (it == begin) ? 0 : ((it - 1)->location - (it - 1)->originalLocation);
      auto originalLead = it->location - prevDelta;
      auto originalSize = next->originalLocation - originalLead;
      auto size = next->location - it->location;

      AddItems(*updateds, originalLead, std::min(originalSize, size));
      if (originalSize > size) {
        AddItems(*deleteds, originalLead + size, originalSize - size);
      }
      if (size > originalSize) {
        AddItems(*inserteds, it->location + originalSize, size - originalSize);
      }
    }

    _items.clear();
    _batchUpdating = NO;
  }

 private:
  static inline void FillWithOriginal(const Sections::iterator& it,
                                      Item prevDelta,
                                      NSMutableArray* deleteds) {
    auto delta = it->location - it->originalLocation;
    if (delta > prevDelta) {
      NDCAssert(NO, @"Internal logic error.");
      return;
    }

    AddItems(deleteds, it->location - prevDelta, prevDelta - delta);
  }

  static inline void AddItems(NSMutableArray* container,
                              Item start,
                              Item count) {
    for (auto i = start, end = i + count; i != end; i++) {
      [container addObject:@(i)];
    }
  }

  /// Delete item.
  /// @param item Must >= 0.
 public:
  inline void Delete(const Item& item) { Modify<-1>(item); }

  /// Update item.
  /// @param item Must >= 0.
  inline void Update(const Item& item) { Modify<0>(item); }

  /// Insert item.
  /// @param item Must >= 0.
  inline void Insert(const Item& item) { Modify<1>(item); }

 private:
  /// Op == -1 -> Delete
  /// Op == 0 -> Update
  /// Op == 1 -> Insert
  template <Item op>
  inline void Modify(const Item& item) {
    // Find the container section
    auto next =
        std::upper_bound(_items.begin(), _items.end(), item, Section::Less) -
        _items.begin();
    auto index = next - 1;

    if (_items[index].originalLocation ==
        Section::kOriginalLocationInvalid) {  // Is section new?
      if (op == 0) {                          // Is updating?
        // Do nothing.
        return;
      }

      if (op == 1) {  // Is inserting?
        // Move all next sections 1
        Increase<op>(next);
        return;
      }
    }

    SectionList tmp;
    auto prev = index - 1, head = index, trail = index;

    if (index >= 1) {  // Is there prev?
      // Push pre to temp list
      head = prev;
      tmp.push_back(_items[prev]);
    }

    if (_items[index].location != item) {  // Is there head element?
      // Push head sub section to temp list
      tmp.push_back(_items[index]);
    }

    if (op != -1) {  // Is updating or inserting (not deleting)?
      // Push single new element section to temp list
      tmp.push_back({item, Section::kOriginalLocationInvalid});
    }

    if (next != _items.size()) {                  // Is there next?
      if ((_items[next].location - 1) != item) {  // Is there trail element?
        // Push trail sub section to temp list
        PushTrailSubSection<op>(item, _items[index], tmp);
      }

      // Push next to temp list
      trail = next;
      _items[next].location = _items[next].location + op;
      tmp.push_back(_items[next]);
    } else {  // There is trail element
      PushTrailSubSection<op>(item, _items[index], tmp);
    }

    Minimize(tmp);
    Replace<op>(head, trail, tmp);
  }

  template <Item op>
  inline void PushTrailSubSection(const Item& item,
                                  const Section& section,
                                  SectionList& list) {
    if (op == -1) {  // Is deleting?
      if (section.originalLocation ==
          Section::kOriginalLocationInvalid) {  // Is new?
        list.push_back({item, Section::kOriginalLocationInvalid});
      } else {  // Originals
        list.push_back(
            {item, item - (section.location - section.originalLocation) + 1});
      }
      return;
    }

    // Updating or inserting
    list.push_back(
        {item + 1,
         item + 1 - (section.location - section.originalLocation) - op});
  }

  inline void Minimize(SectionList& list) {
    auto i = list.begin();
    while (i != list.end()) {
      // Check empty
      auto j = i;
      j++;
      while (j != list.end() && j->location == i->location)
        j++;
      j--;
      if (i != j) {
        i = list.erase(i, j);
      }

      // Check duplicate
      auto first = i;
      first++;
      auto last = first;
      if (i->originalLocation == Section::kOriginalLocationInvalid) {
        while (last != list.end() &&
               last->originalLocation == Section::kOriginalLocationInvalid)
          last++;
        i = list.erase(first, last);
      } else {
        auto delta = i->location - i->originalLocation;
        while (last != list.end() &&
               last->originalLocation != Section::kOriginalLocationInvalid &&
               (last->location - last->originalLocation) == delta)
          last++;
        i = list.erase(first, last);
      }
    }
  }

  template <Item increament>
  inline void Replace(const Sections::size_type& head,
                      const Sections::size_type& trail,
                      const SectionList& list) {
    auto oldSize = trail - head + 1;
    if (list.size() > oldSize) {
      _items.resize(_items.size() + list.size() - oldSize);
      auto delta = list.size() - oldSize;
      for (auto i = _items.size() - 1, j = i - delta; j != trail; i--, j--) {
        _items[i].location = _items[j].location + increament;
        _items[i].originalLocation = _items[j].originalLocation;
      }
    } else if (list.size() < oldSize) {
      auto delta = oldSize - list.size();
      for (auto j = trail + 1, i = j - delta, size = _items.size(); j != size;
           i++, j++) {
        _items[i].location = _items[j].location + increament;
        _items[i].originalLocation = _items[j].originalLocation;
      }
      _items.resize(_items.size() + list.size() - oldSize);
    } else {
      Increase<increament>(trail + 1);
    }

    auto i = head;
    for (auto li = list.begin(), end = list.end(); li != end; li++, i++) {
      _items[i] = *li;
    }
  }

  template <Item increament>
  inline void Increase(const Sections::size_type& head) {
    for (auto i = head, size = _items.size(); i != size; i++) {
      _items[i].location += increament;
    }
  }

 private:
  BOOL _batchUpdating = false;
  Sections _items;

  // MARK: - For testing
  friend std::string ToString(const Section&);
  friend Section ToSection(const std::string& str);
  friend std::string ToString(const NDMutableListViewModelHelper&);
  friend NDMutableListViewModelHelper ToNDMutableListViewModelHelper(
      const std::string&);
};

NS_ASSUME_NONNULL_END

#endif
