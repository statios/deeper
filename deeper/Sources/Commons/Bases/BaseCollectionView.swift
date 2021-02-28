//
//  BaseCollectionView.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import UIKit

class BaseCollectionView: UICollectionView {
  var flowLayout: UICollectionViewFlowLayout? {
    return collectionViewLayout as? UICollectionViewFlowLayout
  }
}
