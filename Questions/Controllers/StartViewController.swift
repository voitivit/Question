//
//  GameViewController.swift
//  Questions
//
//  Created by emil kurbanov on 19.09.2021.
//

import Foundation
import UIKit

class StartViewController: UIViewController{

    @IBOutlet weak var startGame: UIButton!
    @IBOutlet weak var score: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame.setTitle("Начать игру", for: .normal)
        score.setTitle("Количество побед", for: .normal)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGame" {
            guard let segueVC = segue.destination as? GameViewController else {return}
            
            segueVC.delegate = self
        }
        if segue.identifier == "scoreGame" {
            guard let _ = segue.destination as? TableViewControllerScore else {return}
        }
    }

 //   @IBAction func unwindSegue(unwind: UIStoryboard) {}

}
// MARK: - Extensions
extension StartViewController: GameViewControllerDelegate {
  func totalScore(right: Double, score: Double) {
    Game.shared.infoGames.correctAnswer = right
    Game.shared.infoGames.totalQuestion = score
    let ratio = Game.shared.infoGames.calcPercent()
    let record = Records(score: ratio)
    Game.shared.addRecord(record)
    Game.shared.clearSession()
  }
  
 
}
