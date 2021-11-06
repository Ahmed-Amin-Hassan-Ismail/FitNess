//
//  AppModelTests.swift
//  FitNessTests
//
//  Created by Amin  on 02/11/2021.
//  Copyright © 2021 Razeware. All rights reserved.
//

import XCTest
@testable import FitNess

class AppModelTests: XCTestCase {
  
  var sut: AppModel!
  
  override func setUp() {
    super.setUp()
    self.sut = AppModel()
  }
  
  override func tearDown() {
    self.sut = nil
    super.tearDown()
  }


  func testAppModel_whenInitialized_isInNotStartedState() {
    
    
    let initialState = sut.appState
    XCTAssertEqual(initialState, AppState.notStarted)
  }

  func testAppModel_whenStarted_isInProgressState() {
    // When
    sut.start()
    let observedState = sut.appState
    // Then
    XCTAssertEqual(observedState, AppState.inProgress)
  }
}
