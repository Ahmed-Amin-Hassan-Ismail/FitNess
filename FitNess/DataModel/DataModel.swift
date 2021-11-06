//
//  DataModel.swift
//  FitNess
//
//  Created by Amin  on 06/11/2021.
//  Copyright © 2021 Razeware. All rights reserved.
//

import Foundation

class DataModel {
  
  var goal: Int?
  var steps: Int = 0
  
  var goalReached: Bool {
    if let goal = self.goal,
       steps >= self.steps {
      return true
    }
    return false
  }
  
}
