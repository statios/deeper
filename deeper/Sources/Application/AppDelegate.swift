//
//  AppDelegate.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import UIKit
import Then

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
 
  var window: UIWindow?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds).then {
      $0.rootViewController = UINavigationController(
        rootViewController: SearchViewController()
      )
      $0.makeKeyAndVisible()
    }
    
    return true
  }

}
