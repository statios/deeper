//
//  DaumSearchAPI.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import Foundation
import Moya

enum DaumSearchAPI {
  case photos(Photos.Request)
}

extension DaumSearchAPI: TargetType {
  var baseURL: URL {
    return URL(string: "https://dapi.kakao.com/v2/search")!
  }
  
  var path: String {
    return "/image"
  }
  
  var method: Moya.Method {
    switch self {
    case .photos: return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .photos(let request):
      return .requestJSONEncodable(request)
    }
  }
  
  var headers: [String : String]? {
    return [:]
  }
}
