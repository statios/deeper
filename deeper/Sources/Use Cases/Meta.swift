//
//  Meta.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import Foundation

struct Meta: Codable {
  var totalCount: Int
  var pageableCount: Int
  var isEnd: Bool
  
  enum CodingKeys: String, CodingKey {
    case totalCount = "total_count"
    case pageableCount = "pageable_count"
    case isEnd = "is_end"
  }
}
