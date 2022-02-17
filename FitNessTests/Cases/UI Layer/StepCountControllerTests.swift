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
  
  func testStepCount_whenStartTapped_appInProgress() {
    // Given
    self.givenInProgress()
    // When
    // Then
    XCTAssertEqual(AppModel.instance.appState, .inProgress)
  }
  
  func testStepCount_whenPauseTapped_appInPaused() {
    // Given
    self.givenPaused()
    // When
    // Then
    XCTAssertEqual(AppModel.instance.appState, .paused)
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
  
  func testController_whenCaught_buttonLabelsIsTryAgain() {
    // Given
    givenInProgress()
    let exp = expectation(description: "button title change")
    let observer = buttonObserver()
    observer.observe(sut.startButton, expectation: exp)
    
    // When
    whenCaught()
    
    // Then
    waitForExpectations(timeout: 1)
    let text = sut.startButton.title(for: .normal)
    XCTAssertEqual(text, AppState.caught.nextStateButtonLabel)
    
  }
  
  func testController_whenComplete_buttonLabelIsStartOver() {
    // Given
    givenInProgress()
    let exp = expectation(description: "button title change")
    let observer = buttonObserver()
    observer.observe(sut.startButton, expectation: exp)
    
    // When
    whenCompleted()
    
    // Then
    waitForExpectations(timeout: 1)
    let text = sut.startButton.title(for: .normal)
    XCTAssertEqual(text, AppState.completed.nextStateButtonLabel)
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
  
  private func givenInProgress() {
    self.givenGoalSet()
    sut.startStopPause(nil)
  }
  
  private func givenPaused() {
    self.givenInProgress()
    sut.startStopPause(nil)
  }
  
}
