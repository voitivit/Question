//
//  localRecording.swift
//  Questions
//
//  Created by emil kurbanov on 19.09.2021.
//

import Foundation
// называем общий тип для Data
typealias Memento = Data

class GameCaretaker {
       private let decoder = JSONDecoder()
       private let encoder = JSONEncoder()
       private let key = "game"
    
    func saveScoreGame(scoreGame: [Records]) {
   
        do { let data:Memento = try encoder.encode(scoreGame)
        UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error)
        }
        
    }
    func loadScore() -> [Records] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return  try self.decoder.decode([Records].self, from: data)
        } catch  {
            print(error)
            return []
        }
}
}
