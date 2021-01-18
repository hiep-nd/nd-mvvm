//
//  MutableList.swift
//  Samples
//
//  Created by Nguyen Duc Hiep on 11/9/20.
//

import NDMVVM
import NDModificationOperators

class MutableListViewModel: NDViewModel {
  let listViewModel = NDMutableListViewModel(itemViewModels: [])
}

class MutableListViewController: NDViewController {
  let listViewController = NDMutableTableViewController() • {
    $0.register(identifier: "item", class: TextTableViewCell.self)
  }

  override func manualInit() {
    super.manualInit()
    nd_fill(with: listViewController)

    nd_connect(viewModel: MutableListViewModel(), view: self)

    title = "Mutable List"
  }

  override func didSetViewModel(fromOldViewModel oldViewModel: NDViewModelProtocol?) {
    super.didSetViewModel(fromOldViewModel: oldViewModel)
    nd_connect(viewModel: (viewModel as? MutableListViewModel)?.listViewModel, view: listViewController)
  }

//  @IBAction func insert10TouchUpInside() {
//    let itemViewModels: [ItemViewModel] = (0...9).map {
//      let itemViewModel = ItemViewModel(identifier: "item")
//      itemViewModel.text = "\($0)"
//      return itemViewModel
//    }
//
//    listViewModel.batchUpdates {
//      var item = 0
//      itemViewModels.forEach {
//        listViewModel.insert($0, atItem: item)
//        item += 1
//      }
//    }
//  }
}
