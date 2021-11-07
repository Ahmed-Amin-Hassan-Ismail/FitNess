//
//  DataModelTests.swift
//  FitNessTests
//
//  Created by Amin  on 06/11/2021.
//  Copyright © 2021 Razeware. All rights reserved.
//

import XCTest
@testable import FitNess

class DataModelTests: XCTestCase {

  var sut: DataModel!
  
  override func setUp() {
    super.setUp()
    self.sut = DataModel()
  }
  
  override func tearDown() {
    self.sut = nil
    super.tearDown()
  }
  
  
  func testDataModel_whenStarted_goalIsNotReached() {
    // Give
    // When
    // Then
    XCTAssertFalse(sut.goalReached, "goalReached should be false when the model is created")
  }
  
  
  func testDataModel_whenStepsReachGoal_goalIsReached() {
    // Given
    sut.goal = 1000
    // When
    sut.steps = 1000
    // Then
    XCTAssertTrue(sut.goalReached)
    
  }
  
  func testDataModel_whenStarted_userIsNotCaught() {
    // Give
    sut.distance = 1000
    sut.nessie.distance = 100
    // When
    // Then
    XCTAssertFalse(sut.caught)
  }
  
  func testDataModel_whenNessieAheadOfUser_isCaught() {
    // Give
    sut.distance = 100
    sut.nessie.distance = 1000
    // When
    // Then
    XCTAssertTrue(sut.caught)
  }

  func testDataModel_whenUserCaught_CanNotBeReached() {
    // Give
    sut.goal = 1000
    sut.steps = 1000
    // When
    sut.distance = 100
    sut.nessie.distance = 100
    // Then
    XCTAssertFalse(sut.goalReached)
  }
   
}
