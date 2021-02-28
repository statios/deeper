//
//  DaumSearchService.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import Foundation
import RxSwift
import RxMoya
import Moya
import UIKit

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
    return provider.rx.request(router)
      .filterErrorAndShowAlert()
      .map(T.self)
  }
}

class DaumSearchService: DaumSearchServiceType {
  let provider = NetworkProvider<DaumSearchAPI>()
}

extension PrimitiveSequence where Trait == SingleTrait, Element == Response {
  func filterErrorAndShowAlert() -> Single<Element> {
    return flatMap { response in
      if !(200...299).contains(response.statusCode) {
        do {
          let failure = try JSONDecoder().decode(DaumSearchError.self, from: response.data)
          UIApplication.shared.windows
            .first { $0.isKeyWindow }?
            .rootViewController?
            .showAlert(message: failure.message)
        } catch let error {
          return .error(error)
        }
        return .never()
      }
      return .just(response)
    }
  }
}
