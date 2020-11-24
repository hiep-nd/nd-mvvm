//
//  Abstracts_NDRefreshableViewModelProtocol+NDMVVM_Abstracts.swift
//  NDMVVM
//
//  Created by Nguyen Duc Hiep on 8/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

extension NDRefreshableViewModelProtocol {
  @inlinable
  public func mimicRefresh() {
    __NDRefreshableViewModelMimicRefresh(self)
  }
}
