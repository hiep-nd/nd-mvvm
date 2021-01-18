//
//  Menu.swift
//  Samples
//
//  Created by Nguyen Duc Hiep on 14/12/2020.
//

import NDAutolayoutUtils
import NDMVVM
import NDModificationOperators

class MenuViewModel: NDViewModel {
  lazy private(set) var listViewModel = NDListViewModel(itemViewModels: [
    TextSelectableViewModel(identifier: "item") • {
      $0.text = "Mutable List (Table)"
      $0.select.addHandler { [weak self] _ in
        (self?.view as? MenuViewController)?.navigationController?
          .pushViewController(MutableListViewController(), animated: true)
      }
    },
    TextSelectableViewModel(identifier: "item") • {
      $0.text = "Push"
      $0.select.addHandler { [weak self] _ in
        UIApplication.shared.delegate?.window??.rootViewController?
          .present(UINavigationController() • {
            $0.modalPresentationStyle = .fullScreen

            $0.viewControllers = [
              PushViewController() • {
                nd_connect(viewModel: PushViewModel() • { $0.identifier = "0" }, view: $0)
              },
              PushViewController() • {
                nd_connect(viewModel: PushViewModel() • { $0.identifier = "1" }, view: $0)
              }
            ]
            $0.isNavigationBarHidden = true
            $0.interactivePopGestureRecognizer?.delegate = nil
          },
          animated: true)
      }
    }
  ])
}

class MenuViewController: NDViewController {
  var listViewController = NDTableViewController() • {
    $0.register(identifier: "item", class: TextTableViewCell.self)
    $0.enableSelectableItems()
  }

  override func manualInit() {
    super.manualInit()

    nd_fill(with: listViewController)
    nd_connect(viewModel: MenuViewModel(), view: self)
    title = "NDMVVM Samples"
  }

  override func didSetViewModel(fromOldViewModel oldViewModel: NDViewModelProtocol?) {
    super.didSetViewModel(fromOldViewModel: oldViewModel)
    nd_connect(viewModel: (viewModel as? MenuViewModel)?.listViewModel, view: listViewController)
  }
}

protocol TextItemViewModelProtocol: NDItemViewModelProtocol {
  var text: String { get }
}

class TextSelectableViewModel: NDSelectableItemViewModel, TextItemViewModelProtocol {
  var text = ""
}

class TextTableViewCell: NDTableViewCell {
  override func didSetViewModel(fromOldViewModel oldViewModel: NDViewModelProtocol?) {
    super.didSetViewModel(fromOldViewModel: oldViewModel)
    textLabel?.text = (viewModel as? TextItemViewModelProtocol)?.text
  }
}
