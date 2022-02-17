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
  
  public let dataModel = DataModel()
  public var appState: AppState = .notStarted {
    didSet {
      stateChangedCallback?(self)
    }
  }

  public var stateChangedCallback: ((AppModel) -> Void)?

  public init() {}
  
 
  
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
