//
//  GameViewController.swift
//  Questions
//
//  Created by emil kurbanov on 19.09.2021.
//

import Foundation
import UIKit
protocol GameViewControllerDelegate: AnyObject {
    func totalScore(right: Double, score: Double)
}


class GameViewController: UIViewController {
  
   
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var buttonQuestion: [UIButton]!
    private var numberQuestion: Int = 0
   weak var delegate: GameViewControllerDelegate?
    private var question = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        startThisGame(index: numberQuestion)
      }

      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          navigationController?.setNavigationBarHidden(false, animated: animated)
      }

    
    
    
    @IBAction func pressButton (_ sender: UIButton) {
        if sender.titleLabel?.text == question[numberQuestion].theAnswers {
            numberQuestion += 1
            if numberQuestion < question.count {
                startThisGame(index: numberQuestion)
            } else {
            finalGame()
            }
            
        } else {
            finalGame()
        }
    }
    
    
}


extension GameViewController {
    func startGame() {
        let question1 = Question(question: "Столица Бразилии", answers: ["Рио", "Рио Де Жанейро", "Лондон", "Бразилиа"], theAnswers: "Бразилиа")
        let question2 = Question(question: "Дата основания города Москва?", answers: ["1147", "2009", "954", "1677"], theAnswers: "1147")
        let question3 = Question(question: "Чему равен корень из 100?", answers: ["90", "10", "5", "9"], theAnswers: "10")
        let question4 = Question(question: "8 умножить на 8, равно?", answers: ["64", "81", "16", "9" ], theAnswers: "64")
        
        question.append(question1)
        question.append(question2)
        question.append(question3)
        question.append(question4)
    }
    
    
    func startThisGame(index: Int) {
        let question = question[index]
        questionLabel.text = question.question
        for (index, element) in buttonQuestion.enumerated() {
            element.setTitle(question.answers[index], for: .normal)
        }
    }
        func finalGame() {
            let text:String
            if numberQuestion < question.count {
                text = "Вы правильно ответили на \(numberQuestion)  вопросов"
            } else {
                text = "Поздравляем, вы ответили на все вопросы!"
            }
            let alert = UIAlertController(title: "Игра окончена", message: text, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Закончить игру!", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            //Надо обернуть в Double
            delegate?.totalScore(right: Double(numberQuestion), score: Double(question.count))
            
        }
        
    }
    

