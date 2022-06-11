//
//  StrategyChooser.swift
//  Questions
//
//  Created by emil kurbanov on 26.09.2021.
//

import Foundation
class StrategyChooser {
    var strategy: sequenceStrategyProtocol
    
    init(strategy: sequenceStrategyProtocol) {
        self.strategy = strategy
    }
    
}
