//
//  DifficultySettingsFacade.swift
//  Questions
//
//  Created by emil kurbanov on 26.09.2021.
//

import Foundation
final class DifficultySettingsFacade {
  private var questionFacade = StartGameFacade()
  var questionSequence: sequenceStrategyProtocol {
    switch Game.shared.difficulty {
    case .serial:
      let strategy = serialStrategy(question: questionFacade.question)
      return strategy
    case .random:
      let strategy = shuffleStrategy(question: questionFacade.question)
      return strategy
    }
  }
}
