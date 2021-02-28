//
//  SearchViewController.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import ReactorKit
import UIKit

final class SearchViewController: BaseViewController, View {
  
  lazy var searchController = UISearchController().then {
    $0.obscuresBackgroundDuringPresentation = false
    $0.searchBar.placeholder = "Search photos"
    $0.searchBar.barStyle = .black
  }
  
  override func configure() {
    reactor = SearchViewReactor()
  }
  
  override func setupUI() {
    navigationItem.do {
      $0.searchController = searchController
    }
  }
  
  func bind(reactor: SearchViewReactor) {
    
  }
  
}
