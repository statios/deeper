//
//  UIViewController+.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/03/01.
//

import UIKit

extension UIViewController {
  func showAlert(
    title: String? = nil,
    message: String? = nil,
    button: String? = "확인",
    handler: ((UIAlertAction) -> Void)? = nil
  ) {
    DispatchQueue.main.async { [weak self] in
      let alertController = UIAlertController(
        title: title,
        message: message,
        preferredStyle: .alert
      )
      let alertAction = UIAlertAction(
        title: button,
        style: .default,
        handler: handler
      )
      alertController.addAction(alertAction)
      self?.present(alertController, animated: true)
    }
  }
}
