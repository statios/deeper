//
//  DaumSearchService.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import Foundation
import RxSwift
import RxMoya

protocol DaumSearchServiceType {
  var provider: NetworkProvider<DaumSearchAPI> { get }
  func request<T: Codable>(
    to router: DaumSearchAPI,
    type: T.Type
  ) -> Single<T>
}

extension DaumSearchServiceType {
  func request<T: Codable>(
    to router: DaumSearchAPI,
    type: T.Type
  ) -> Single<T> {
    provider.rx.request(router).map(T.self)
  }
}

class DaumSearchService: DaumSearchServiceType {
  let provider = NetworkProvider<DaumSearchAPI>()
}
