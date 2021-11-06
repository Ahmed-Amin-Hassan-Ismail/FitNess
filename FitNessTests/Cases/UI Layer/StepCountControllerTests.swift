//
//  StepCountControllerTests.swift
//  FitNessTests
//
//  Created by Amin  on 06/11/2021.
//  Copyright © 2021 Razeware. All rights reserved.
//

import XCTest
@testable import FitNess

class StepCountControllerTests: XCTestCase {
  
  var sut: StepCountController!

  override func setUp() {
    super.setUp()
    self.sut = StepCountController()
  }
  
  override func tearDown() {
    self.sut = nil
    super.tearDown()
    
  }
  
  func testStepCountController_whenCreated_buttonLabelStart() {
    // when
    sut.viewDidLoad()
    // then
    let text = sut.startButton.title(for: .normal)
    XCTAssertEqual(text, AppState.notStarted.nextStateButtonLabel)
  }
  
  func testSetpCountController_whenStartTapped_appIsInProgress() {
    //when
    self.whenStartStopButtonTapped()
    //then
    let state = AppModel.instance.appState
    XCTAssertEqual(state, AppState.inProgress)
  }
  
  func testStepCountController_whenStartTapped_buttonLabelPause() {
    //when
    self.whenStartStopButtonTapped()
    //then
    let text = sut.startButton.title(for: .normal)
    XCTAssertEqual(text, AppState.inProgress.nextStateButtonLabel)
  }
  
}


//MARK:- Helper Methods
extension StepCountControllerTests {
  
  private func whenStartStopButtonTapped() {
    sut.startStopPause(nil)
  }
  
}
