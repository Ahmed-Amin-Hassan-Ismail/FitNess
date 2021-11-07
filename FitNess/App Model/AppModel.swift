//
//  DataModel.swift
//  FitNess
//
//  Created by Amin  on 06/11/2021.
//  Copyright © 2021 Razeware. All rights reserved.
//


import Foundation

class AppModel {

  static let instance = AppModel()
  
  let dataModel = DataModel()

  public init() {}
  
  public var appState: AppState = .notStarted
  
  public func start() throws {
    guard self.dataModel.goal != nil else { throw AppError.goalNotSet }
    self.appState = .inProgress
  }
  
  public func pause() {
    appState = .paused
  }
  
  public func restart() {
    appState = .notStarted
    dataModel.restart()
  }
}
