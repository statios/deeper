//
//  UIView+.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import UIKit

extension UIView {
  @discardableResult
  func add(to: UIView) -> UIView {
    to.addSubview(self)
    return self
  }
}
