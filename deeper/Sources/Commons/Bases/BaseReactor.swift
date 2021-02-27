//
//  BaseReactor.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import Foundation

class BaseReactor {
  
  init() {
    Log.verbose(String(describing: Self.self))
  }
  
  deinit {
    Log.verbose(String(describing: Self.self))
  }
  
}
