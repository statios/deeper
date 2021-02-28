//
//  NetworkLoggerPlugin.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import Foundation
import Moya

final class NetworkLoggerPlugin: PluginType {
  func willSend(_ request: RequestType, target: TargetType) {
    #if DEBUG
    let query = request.request?.url?.query ?? "nil"
    Log.info("Request")
    Log.info("Query: \(query)")
    Log.info("Target: \(target)")
    #endif
  }
  
  func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
    #if DEBUG
    switch result {
    case .success(let response):
      let request = response.request
      let query = request?.url?.query ?? "nil"
      Log.debug("Response: success")
      Log.debug("Query: \(query)")
      Log.debug("Target: \(target)")
      Log.debug(String(decoding: response.data, as: UTF8.self))
      
    case .failure(let error):
      let statusCode = error.errorCode
      let reason = error.failureReason ?? error.errorDescription ?? "unknown error"
      Log.warning("Response: failure")
      Log.warning("Target: \(target)")
      Log.warning("Status Code: \(statusCode)")
      Log.warning("Error Reason: \(reason)")
    }
    #endif
  }
}
