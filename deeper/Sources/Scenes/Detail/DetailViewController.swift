//
//  DetailViewController.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/03/01.
//

import ReactorKit
import UIKit
import RxCocoa
import RxSwift

final class DetailViewController: BaseViewController, View {
  
  override func configure() {
    reactor = DetailViewReactor()
  }
  
  override func setupUI() {
    
  }
  
  func bind(reactor: DetailViewReactor) {
    // Action
    
    // State
    
  }
  
}

