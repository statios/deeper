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
import SnapKit

final class SearchViewController: BaseViewController, View {
  
  private let searchController = UISearchController()
  private let collectionView = BaseCollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewFlowLayout()
  )
  
  override func configure() {
    reactor = SearchViewReactor()
  }
  
  override func setupUI() {
    
    searchController.do {
      $0.obscuresBackgroundDuringPresentation = false
      $0.searchBar.placeholder = "Search photos"
      $0.searchBar.barStyle = .black
    }
    
    navigationItem.do {
      $0.searchController = searchController
    }
    
    collectionView.do {
      $0.add(to: view)
      $0.snp.makeConstraints { (make) in
        make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        make.leading.trailing.equalToSuperview()
        make.bottom.equalTo(view)
      }
      $0.flowLayout?.scrollDirection = .vertical
      $0.flowLayout?.itemSize = .init(
        width: Device.width / 3,
        height: Device.width / 3
      )
      $0.flowLayout?.minimumLineSpacing = 0
      $0.flowLayout?.minimumInteritemSpacing = 0
      $0.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
    }
  }
  
  func bind(reactor: SearchViewReactor) {
    // Action
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
    
    collectionView.rx.willDisplayCell.map { $0.at }
      .map { Reactor.Action.willDisplay($0) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)
    
    
    // State
    reactor.state.compactMap { $0.photos?.documents }
      .observeOn(MainScheduler.asyncInstance)
      .bind(
        to: collectionView.rx.items(
          cellIdentifier: "PhotoCell",
          cellType: PhotoCell.self
        )
      ) { (index, photo, cell) in
        cell.configure(photo)
      }.disposed(by: disposeBag)
  }
  
}
