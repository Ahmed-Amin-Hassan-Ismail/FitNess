//
//  ButtonObserver.swift
//  FitNessTests
//
//  Created by Ahmed Amin on 17/02/2022.
//  Copyright © 2022 Razeware. All rights reserved.
//

import Foundation
import XCTest


class ButtonObserver: NSObject {
  var expectation: XCTestExpectation?
  weak var button: UIButton?
  
  func observe(_ button: UIButton,
               expectation: XCTestExpectation) {
    self.button = button
    self.expectation = expectation
    
    button.addObserver(self, forKeyPath: "titleLabel.text", options: [.new], context: nil)
  }
  
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    expectation?.fulfill()
  }
  
  deinit {
    button?.removeObserver(self, forKeyPath: "titleLabel.text")
  }
}
