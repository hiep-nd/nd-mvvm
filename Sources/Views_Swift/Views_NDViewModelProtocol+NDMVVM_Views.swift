//
//  Views_NDViewModelProtocol+NDMVVM_Views.swift
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 23/11/2020.
//

import NDUtils

public extension NDViewModelProtocol {
  @inlinable
  func uiViewControllerDismiss(
    animated: Bool = true, completion: (() -> Void)? = nil
  ) {
    __NDViewModelUIViewControllerDismiss(self, animated, completion)
  }

  @discardableResult
  @inlinable
  func uiViewControllerPopToPreviousViewController(
    _ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil
  ) -> [UIViewController]? {
    return __NDViewModelUIViewControllerPopToPreviousViewController(self, viewController, animated, completion)
  }

  @discardableResult
  @inlinable
  func uiViewControllerPopToPreviousViewModel(
    _ viewModel: NDViewModelProtocol, animated: Bool = true, completion: (() -> Void)? = nil
  ) -> [UIViewController]? {
    return __NDViewModelUIViewControllerPopToPreviousViewModel(self, viewModel, animated, completion)
  }
}
