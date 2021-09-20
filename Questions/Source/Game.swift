//
//  Game.swift
//  Questions
//
//  Created by emil kurbanov on 19.09.2021.

import Foundation
import UIKit


final class Game{
    
    static let shared = Game()
    
    private(set) var infoGames = GameSesson()
    private(set) var records:[Records] {
        didSet {
            save.saveScoreGame(scoreGame: records)}
    }
    
    private let save = GameCaretaker()
    
    
    private init() {
        self.records = self.save.loadScore()
    }
    
    
    
    func addRecord(_ record: Records) {
        records.append(record)
    }
    func deleteRecords() {
        self.records = []
    }
    
    func clearSession() {
        infoGames.clearGameSession()
    }
    

    
}
