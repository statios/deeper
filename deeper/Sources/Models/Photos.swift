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
    var size: Int?
  }
  
  struct Response {
    var meta: DaumMetaData
    var documents: [DaumPhoto]
  }
}

struct DaumMetaData: Codable {
  var totalCount: Int
  var pageableCount: Int
  var isEnd: Bool
  
  enum CodingKeys: String, CodingKey {
    case totalCount = "total_count"
    case pageableCount = "pageable_count"
    case isEnd = "is_end"
  }
}

struct DaumPhoto: Codable {
  var collection: String
  var thumbnailURL: String
  var imageURL: String
  var width: Int
  var height: Int
  var displaySitename: String
  var documentURL: String
  var datetime: String
  
  enum CodingKeys: String, CodingKey {
    case collection
    case thumbnailURL = "thumbnail_url"
    case imageURL = "image_url"
    case width
    case height
    case displaySitename = "display_sitename"
    case documentURL = "doc_url"
    case datetime
  }
}
