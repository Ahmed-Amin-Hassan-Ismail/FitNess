//
//  ViewControllers.swift
//  FitNessTests
//
//  Created by Amin  on 07/11/2021.
//  Copyright © 2021 Razeware. All rights reserved.
//

import Foundation
import UIKit
@testable import FitNess

func loadRootViewController() -> RootViewController {
  
  let window = UIApplication.shared.windows.first!
  return window.rootViewController as! RootViewController
}
