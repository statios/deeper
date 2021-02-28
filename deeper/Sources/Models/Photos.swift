//
//  Photos.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import Foundation

struct Photos {
  struct Request: Codable {
    var query: String
    var sort: String?
    var page: Int?
    var size: Int? = 30
  }
  
  struct Response: Codable {
    var meta: Meta
    var documents: [Photo]
  }
}
