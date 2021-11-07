//
//  RootViewController+Tests.swift
//  FitNessTests
//
//  Created by Amin  on 07/11/2021.
//  Copyright © 2021 Razeware. All rights reserved.
//

import Foundation
import UIKit
@testable import FitNess

extension RootViewController {
  var stepCounter: StepCountController {
    return children.first { $0 is StepCountController } as! StepCountController
  }
}
