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
  
  private let scrollView = UIScrollView()
  private let contentView = UIView()
  private let photoImageView = UIImageView()
  private let sourceLabel = UILabel()
  private let updatedLabel = UILabel()
  
  override func configure() {
    reactor = DetailViewReactor()
  }
  
  override func setupUI() {
    view.do {
      $0.backgroundColor = .black
    }
    
    scrollView.do {
      $0.add(to: view)
      $0.snp.makeConstraints { (make) in
        make.leading.bottom.trailing.equalToSuperview()
        make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      }
    }
    
    contentView.do {
      $0.add(to: scrollView)
      $0.snp.makeConstraints { (make) in
        make.top.bottom.equalToSuperview()
        make.width.equalToSuperview()
      }
    }
    
    sourceLabel.do {
      $0.add(to: view)
      $0.snp.makeConstraints { (make) in
        make.leading.equalToSuperview().offset(16)
        make.bottom.equalToSuperview().offset(-24)
      }
      $0.textColor = .white
    }
    
    updatedLabel.do {
      $0.add(to: view)
      $0.snp.makeConstraints { (make) in
        make.leading.equalToSuperview().offset(16)
        make.bottom.equalTo(sourceLabel.snp.top).offset(-8)
      }
      $0.textColor = .white
    }
    
  }
  
  func bind(reactor: DetailViewReactor) {
    // Action
    
    // State
    reactor.state.compactMap { $0.photo }
      .subscribe(onNext: { [weak self] in
        
        guard let `self` = self,
              let url = URL(string: $0.imageURL),
              let data = try? Data(contentsOf: url),
              let image = UIImage(data: data)
        else { return }
        
        let ratio = Device.width / image.size.width
        let height = ratio * image.size.height
        let ratioImage = image.resized(
          to: .init(width: Device.width, height: height)
        )
        self.photoImageView.image = ratioImage
        
        self.photoImageView
          .add(to: self.contentView)
          .snp.makeConstraints({ (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(height)
            make.bottom.equalToSuperview()
          })
        
        self.sourceLabel.text = $0.displaySitename
        self.updatedLabel.text = $0.datetime
      }).disposed(by: disposeBag)
  }
}
