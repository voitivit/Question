//
//  sequenceStrategyProtocol.swift
//  Questions
//
//  Created by emil kurbanov on 26.09.2021.
//

import Foundation
protocol sequenceStrategyProtocol: AnyObject {
  var question: [Question] { get set }
  func shuffleQuestions()
}
