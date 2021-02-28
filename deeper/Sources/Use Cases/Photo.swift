//
//  Photo.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import Foundation

struct Photo: Codable {
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
