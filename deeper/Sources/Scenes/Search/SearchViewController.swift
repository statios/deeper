//
//  SearchViewController.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import ReactorKit

final class SearchViewController: BaseViewController, View {
  
  override func configure() {
    reactor = SearchViewReactor()
  }
  
  func bind(reactor: SearchViewReactor) {
    
  }
  
}
