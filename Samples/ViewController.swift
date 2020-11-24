//
//  ViewController.swift
//  Samples
//
//  Created by Nguyen Duc Hiep on 11/9/20.
//

import NDMVVM

class ViewController: UIViewController {
  var listViewController: NDMutableTableViewController?
  let listViewModel = NDMutableListViewModel(itemViewModels: [])

  override func viewDidLoad() {
    super.viewDidLoad()

    listViewController?.register(identifier: "item", class: NDTableViewCell.self)
    nd_connect(viewModel: listViewModel, view: listViewController)
  }

  @IBAction func insert10TouchUpInside() {
    let itemViewModels: [ItemViewModel] = (0...9).map {
      let itemViewModel = ItemViewModel(identifier: "item")
      itemViewModel.text = "\($0)"
      return itemViewModel
    }

    listViewModel.batchUpdates {
      var item = 0
      itemViewModels.forEach {
        listViewModel.insert($0, atItem: item)
        item += 1
      }
    }
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "list" {
      listViewController = segue.destination as? NDMutableTableViewController
    }
  }

  class TableViewCell: NDTableViewCell {
    override func didSetViewModel(fromOldViewModel oldViewModel: NDViewModelProtocol?) {
      super.didSetViewModel(fromOldViewModel: oldViewModel)
      textLabel?.text = (viewModel as? ItemViewModel)?.text
    }
  }

  class ItemViewModel: NDItemViewModel {
    var text = ""
  }
}
