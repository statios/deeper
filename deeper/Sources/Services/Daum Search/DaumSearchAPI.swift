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
      return .requestParameters(
        parameters: [
          "query": request.query,
          "page": request.page as Any,
          "size": request.size as Any
        ],
        encoding: URLEncoding.default
      )
    }
  }
  
  var headers: [String : String]? {
    var header: [String: String] = [:]
    if let path = Bundle.main.path(forResource: "Key", ofType: "plist") {
      if let dict = NSDictionary(contentsOfFile: path) {
        let token = dict["KAKAO_API_KEY"] as? String
        header["Authorization"] = "KakaoAK " + (token ?? "")
      }
    }
    return header
  }
}
