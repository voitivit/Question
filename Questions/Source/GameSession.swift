//
//  GameSession.swift
//  Questions
//
//  Created by emil kurbanov on 19.09.2021.
//

import Foundation
import UIKit

class GameSession {
  var correctAnswers: Double = 0
  var totalQuestions = Double()
  var currentQuestion: Int = 0
  
  func calcPercent() -> Double {
  (Double(currentQuestion) / totalQuestions) * 100
  }
  
  func calcRatio() -> Double {
  correctAnswers / totalQuestions
  }
  
  func clearSession() {
    correctAnswers = 0
    totalQuestions = 0
    currentQuestion = 0
  }
}

