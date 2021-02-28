//
//  AppDelegate+Injection.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import Resolver

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    register { DaumSearchService() }
      .scope(.shared)
      .implements(DaumSearchServiceType.self)
  }
}
