//
//  SearchViewController.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import ReactorKit
import UIKit
import RxCocoa
import RxSwift

final class SearchViewController: BaseViewController, View {
  
  private let searchController = UISearchController().then {
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
    
    searchController.searchBar.rx.text.orEmpty
      .map { Reactor.Action.searchText($0) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)
    
    Observable.merge(
      searchController.searchBar.rx.text
        .debounce(.milliseconds(1000), scheduler: MainScheduler.instance)
        .map { _ in },
      searchController.searchBar.rx.searchButtonClicked.map { _ in }
    )
    .map { Reactor.Action.search }
    .bind(to: reactor.action)
    .disposed(by: disposeBag)
    
    
  }
  
}
