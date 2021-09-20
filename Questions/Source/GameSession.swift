//
//  GameSession.swift
//  Questions
//
//  Created by emil kurbanov on 19.09.2021.
//

import Foundation
import UIKit

class GameSesson {
    var correctAnswer: Double = 0
    var totalQuestion =  Double()

    func calcPercent() -> Double {
        // Считаем процент правильно отвеченных вопросов
        (correctAnswer/totalQuestion)*100
    }
    func clearGameSession() {
        correctAnswer = 0
        totalQuestion = 0
    }
}

