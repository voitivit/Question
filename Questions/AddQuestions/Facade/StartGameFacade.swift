//
//  StartGameFacade.swift
//  Questions
//
//  Created by emil kurbanov on 26.09.2021.
//

import Foundation
final class StartGameFacade {
  
  var question = [Question]()

  
  private let question1 = Question(about: "Корень из 100", answers:["5","10","6","10,7"], rightAnswer: "10")
  private let question2 = Question(about: "Под каким названием известна единица с последующими ста нулями?", answers:["Гугол","Мегатрон","Гигабит","Наномоль"], rightAnswer: "Гугол")
  private let question3 = Question(about: "Какой химический элемент составляет более половины массы тела человека?", answers:["Углерод","Кальций","Кислород","Железо"], rightAnswer: "Кислород")
  private let question4 = Question(about: "Какую часть тела также называют «атлант»", answers:["Головной мозг","Шестая пара ребер","Шейный позвонок","Часть плеча"], rightAnswer: "Шейныйа позвонок")
  private let question5 = Question(about: "Какого цвета крайнее правое кольцо в олимпийской символике?", answers:["Красное","Синее","Желтое","Зеленое"], rightAnswer: "Красное")
  
  init() {
    startGame()
  }
  
  func startGame() {
  question.append(question1)
  question.append(question2)
  question.append(question3)
  question.append(question4)
  question.append(question5)
    if !Game.shared.questions.isEmpty {
      question.append(contentsOf: Game.shared.questions)
    }
  
  Game.shared.info.totalQuestions = Double(question.count + 1)
  }
}
