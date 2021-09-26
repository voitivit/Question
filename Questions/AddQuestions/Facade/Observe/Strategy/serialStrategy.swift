//
//  serialStrategy.swift
//  Questions
//
//  Created by emil kurbanov on 26.09.2021.
//

import Foundation
final class serialStrategy: sequenceStrategyProtocol {
  var question: [Question]
  
  init(question: [Question]) {
    self.question = question
  }
  
  func shuffleQuestions() {
  }
  
  
}
