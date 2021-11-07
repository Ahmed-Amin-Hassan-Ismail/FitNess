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
  
  func testAppModel_whenStarted_throwsError() {
    XCTAssertThrowsError(try sut.start())
  }
  
  func testAppModel_whenStarted_doesNotThrowError() {
    // Give
    self.givenGoalSet()
    // Then
    XCTAssertNoThrow(try sut.start())
  }

  func testAppModel_whenStarted_isInProgressState() {
    //Give
    self.givenGoalSet()
    // When
    try? sut.start()
    let observedState = sut.appState
    // Then
    XCTAssertEqual(observedState, AppState.inProgress)
  }
  
  func testAppModel_whenReset_isNotStartedState() {
    // Gien
    givenInProgress()
    // When
    sut.restart()
    // Then
    XCTAssertEqual(sut.appState, .notStarted)
    
  }
  
}

//MARK:- Helper Methods
extension AppModelTests {
  
  private func givenGoalSet() {
    sut.dataModel.goal = 1000
  }
  
  private func givenInProgress() {
    givenGoalSet()
    try! sut.start()
  }
}
