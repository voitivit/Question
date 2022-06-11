//
//  GameViewController.swift
//  Questions
//
//  Created by emil kurbanov on 26.09.2021.
//

import  UIKit
protocol GameViewControllerDelegate: AnyObject {
  func didEndGame(right: Double, total: Double)
}


class GameViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answers: [UIButton]!
    private var numberOfQuestion = Observable<Int> (0)
    weak var delegate: GameViewControllerDelegate?
    private var questionFacade = StartGameFacade()
    private var difficultFacade = DifficultySettingsFacade()
    
    private var questionSequence: sequenceStrategyProtocol {
      switch Game.shared.difficulty {
      case .serial:
        let strategy = serialStrategy(question: questionFacade.question)
        return strategy
      case .random:
        let strategy = shuffleStrategy(question: questionFacade.question)
        return strategy
      }
    }
    
    
    override func viewDidLoad() {
      super.viewDidLoad()
      numberOfQuestion.addObserver(self, options: [.new, .initial], closure: { [weak self] (index, _) in
        guard let self = self else { return }
        Game.shared.info.currentQuestion = index + 1
        let formatted = String(format: "%.1f", Game.shared.info.calcPercent())

        self.statusLabel.text = "Вопрос №\(Game.shared.info.currentQuestion) (\(formatted)%)"
      })
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      navigationController?.setNavigationBarHidden(true, animated: animated)
      gamePlay(index: numberOfQuestion.value)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func didPressedAnswer(_ sender: UIButton) {
      if  let  _ = questionFacade.question.first(where: {$0.rightAnswer == sender.titleLabel?.text}) {
        numberOfQuestion.value += 1
        if numberOfQuestion.value < questionFacade.question.count {
          gamePlay(index: numberOfQuestion.value)
        } else {
          gameOver()
        }
      } else {
        gameOver()
      }
    }
  }

  // MARK: - Extensions

  extension GameViewController {
    
    func gamePlay(index: Int) {
      let question = questionSequence.question[index]
      questionLabel.text = question.about
      for (index, element) in  answers.enumerated() {
        element.setTitle(question.answers[index], for: .normal)
      }
    }
    
    func gameOver() {
      let text: String
      if numberOfQuestion.value < questionFacade.question.count {
        text = "Вы ответили на \(numberOfQuestion.value) вопросов"
      } else {
        text = "Вы ответили на все вопросы"
      }
      let alert = UIAlertController(title: "Игра окончена", message: text, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
        self.navigationController?.popToRootViewController(animated: true)
      }))
      self.present(alert, animated: true)
      delegate?.didEndGame(right: Double(numberOfQuestion.value), total: Double(questionFacade.question.count))
      
    }
}
