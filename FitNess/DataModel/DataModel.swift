//
//  DataModel.swift
//  FitNess
//
//  Created by Amin  on 06/11/2021.
//  Copyright © 2021 Razeware. All rights reserved.
//

import Foundation

class DataModel {
  
  //MARK:- Goal
  var goal: Int?
  var steps: Int = 0
  
  //MARK:- Nessie
  let nessie = Nessie()
  var distance: Double = 0.0
  var caught: Bool {
    return self.distance > 0 && nessie.distance >= self.distance
  }
  
  var goalReached: Bool {
    if let _ = self.goal,
       steps >= self.steps,
       !caught {
      return true
    }
    return false
  }
  
  func restart() {
    self.goal = nil
    self.steps = 0
    self.distance = 0
    self.nessie.distance = 0
  }
  
}

