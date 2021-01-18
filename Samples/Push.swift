//
//  Push.swift
//  Samples
//
//  Created by Nguyen Duc Hiep on 15/12/2020.
//

import NDAutolayoutUtils
import NDMVVM
import NDModificationOperators

class PushViewModel: NDViewModel {
  var identifier = ""
  lazy var back = NDEvent(owner: self) {
    $0.uiViewControllerPopToPreviousViewModel($0)
  }
}

class PushViewController: NDViewController {
  let identifierLabel = UILabel()

  override func manualInit() {
    super.manualInit()

    let backButton = UIButton() • {
      $0.setTitle("Back", for: [])
      $0.setTitleColor(.blue, for: [])
      $0.nd_(events: .touchUpInside) { [weak self] in
        self?.rViewModel?.back.on()
      }
    }

    view.nd_wrap(
      items: [
        "identifier": identifierLabel,
        "back": backButton
      ],
      visualConstraints: [
        "V:[safeArea_top]-16-[identifier]-16-[back]",
        "H:[identifier_center][back_center][safeArea_center]"
      ]
    )
    view.backgroundColor = .white
  }

  override func didSetViewModel(fromOldViewModel oldViewModel: NDViewModelProtocol?) {
    super.didSetViewModel(fromOldViewModel: oldViewModel)
    identifierLabel.text = rViewModel?.identifier
    title = rViewModel?.identifier
  }

  private var rViewModel: PushViewModel? { viewModel as? PushViewModel }
}
