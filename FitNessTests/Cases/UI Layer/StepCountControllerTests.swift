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
    let rootViewController = loadRootViewController()
    self.sut = rootViewController.stepCounter
  }
  
  override func tearDown() {
    AppModel.instance.dataModel.goal = nil
    AppModel.instance.restart()
    sut.updateUI()
    super.tearDown()
    
  }
  
  func testStepCountController_whenCreated_buttonLabelStart() {
    // then
    let text = sut.startButton.title(for: .normal)
    XCTAssertEqual(text, AppState.notStarted.nextStateButtonLabel)
  }
  
  func testSetpCountController_whenStartTapped_appIsInProgress() {
    //Give
    self.givenGoalSet()
    //when
    self.whenStartStopButtonTapped()
    //then
    let state = AppModel.instance.appState
    XCTAssertEqual(state, AppState.inProgress)
  }
  
  func testStepCountController_whenStartTapped_buttonLabelPause() {
    //Give
    self.givenGoalSet()
    //when
    self.whenStartStopButtonTapped()
    //then
    let text = sut.startButton.title(for: .normal)
    XCTAssertEqual(text, AppState.inProgress.nextStateButtonLabel)
  }
  
  func testStepCountController_whenGoalUpdate_updatesNewState() {
    // Given
    // When
    sut.updateGoal(newGoal: 50)
    // Then
    XCTAssertEqual(AppModel.instance.dataModel.goal, 50)
  }
  
  // MARK:- Chase View
  func testChaseView_whenLoaded_isNotStarted() {
    // When
    let chaseView = sut.chaseView
    // Then
    XCTAssertEqual(chaseView?.state, AppState.notStarted)
  }
  
  func testChaseView_whenInProgress_viewInProgress() {
    // Given
    self.givenInProgress()
    // When
    let chaseView = sut.chaseView
    // Then
    XCTAssertEqual(chaseView?.state, AppState.inProgress)
  }
  
}


//MARK:- Helper Methods
extension StepCountControllerTests {
  
  private func whenStartStopButtonTapped() {
    sut.startStopPause(nil)
  }
  
  private func givenGoalSet() {
    AppModel.instance.dataModel.goal = 1000
  }
  
  func givenInProgress() {
    givenGoalSet()
    sut.startStopPause(nil)
  }
  
}
