//
//  DataModel.swift
//  FitNess
//
//  Created by Amin  on 06/11/2021.
//  Copyright © 2021 Razeware. All rights reserved.
//


import Foundation
import UIKit

@IBDesignable class ChaseView: UIView {

  let nessieView = UIImageView()
  let runnerView = UIImageView()

  var state: AppState = .notStarted {
    didSet {
      nessieView.image = state.nessieImage
      runnerView.image = state.runnerImage
    }
  }

  private func commonSetup() {
    addSubview(nessieView)
    addSubview(runnerView)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonSetup()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    commonSetup()
  }

  override func prepareForInterfaceBuilder() {
    let bundle = Bundle(for: ChaseView.self)
    nessieView.image = UIImage(named: "Nessie", in: bundle, compatibleWith: nil)
    runnerView.image = UIImage(named: "Runner", in: bundle, compatibleWith: nil)
  }
}

extension AppState {
  var nessieImage: UIImage {
    let imageName: String
    switch self {
    case .notStarted:
      imageName = "NessieSleeping"
    case .inProgress:
      imageName = "Nessie"
    case .paused:
      imageName = "NessieSleeping"
    case .completed:
      imageName = "NessieLost"
    case .caught:
      imageName = "NessieWon"
    }
    return UIImage(named: imageName)!
  }

  var runnerImage: UIImage {
    let imageName: String
    switch self {
    case .notStarted:
      imageName = "RunnerPaused"
    case .inProgress:
      imageName = "Runner"
    case .paused:
      imageName = "RunnerPaused"
    case .completed:
      imageName = "RunnerWon"
    case .caught:
      imageName = "RunnerEaten"
    }
    return UIImage(named: imageName)!
  }
}
