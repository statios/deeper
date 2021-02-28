//
//  PhotoCell.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import Foundation
import UIKit
import Kingfisher

final class PhotoCell: UICollectionViewCell {
  private let photoImageView = UIImageView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    photoImageView.do {
      $0.add(to: contentView)
      $0.snp.makeConstraints { (make) in
        make.edges.equalToSuperview()
      }
      $0.contentMode = .scaleAspectFill
      $0.clipsToBounds = true
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(_ item: Photo) {
    photoImageView.kf.setImage(with: URL(string: item.imageURL))
  }
}
