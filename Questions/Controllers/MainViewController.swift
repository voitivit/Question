//
//  MainViewController.swift
//  Questions
//
//  Created by emil kurbanov on 26.09.2021.
//

import UIKit
class MainViewController: UIViewController {
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var resultsButton: UIButton!
    @IBOutlet weak var addQuestionButton: UIButton!
    
    override func viewDidLoad() {
          super.viewDidLoad()
        playButton.setTitle("Играть", for: .normal)
        resultsButton.setTitle("Результаты", for: .normal)
        addQuestionButton.setTitle("Добавить вопрос", for: .normal)
      }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "newGame" {
        guard let dst = segue.destination as? GameViewController else { return }
        dst.delegate = self
      }
      if segue.identifier == "record" {
        guard let _ = segue.destination as? RecordsTableViewController else { return }
        
      }
    }
  }
  // MARK: - Extensions
  extension MainViewController: GameViewControllerDelegate {
    func didEndGame(right: Double, total: Double) {
      Game.shared.info.correctAnswers = right
      Game.shared.info.totalQuestions = Double(total)
      
      let ratio = Game.shared.info.calcRatio()
      let record = Record(date: Date(), score: ratio)
      Game.shared.addRecord(record)
      Game.shared.clearSession()
    }
    
    
    
}

