//
//  BaseViewController.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import RxSwift
import UIKit

class BaseViewController: UIViewController {
  
  // MARK: Properties
  
  var disposeBag = DisposeBag()
  
  // MARK: Init
  
  init() {
    super.init(nibName: nil, bundle: nil)
    Log.verbose(String(describing: Self.self))
    configure()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    Log.verbose(String(describing: Self.self))
    configure()
  }
  
  deinit {
    Log.verbose(String(describing: Self.self))
  }
  
  // MARK: Life Cycles
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  // MARK: Overriding Methods
  
  @objc dynamic func configure() {
    
  }
  
  @objc dynamic func setupUI() {
    
  }
  
}
