//
//  DetailViewControllerTests.swift
//  deeperTests
//
//  Created by KIHYUN SO on 2021/03/01.
//

import XCTest

@testable import deeper

final class DetailViewControllerTests: XCTestCase {
  
  var view: DetailViewController!
  
  override func setUp() {
    view = DetailViewController()
    view.reactor?.isStubEnabled = true
    view.loadView()
  }
  
  func testState_photo() {
    // Given
    
    // When
    view.reactor?.stub.state.value = DetailViewReactor.State(
      photo: Seed.scrollablePhoto
    )
    
    // Then
    XCTAssert(view.contentView.frame.height >= view.scrollView.frame.height)
  }
}
