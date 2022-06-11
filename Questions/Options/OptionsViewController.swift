//
//  OptionsViewController.swift
//  Questions
//
//  Created by emil kurbanov on 26.09.2021.
//

import UIKit
class OptionsViewController: UIViewController {
    
    @IBOutlet weak var randomSegmentControl: UISegmentedControl!
    private var selectedDifficulty: Difficulty {
    switch self.randomSegmentControl.selectedSegmentIndex {
    case 0:
    return .serial
    case 1:
    return .random
    default:
    return .serial }
    }
    
    override func viewDidLoad() {
          super.viewDidLoad()
      self.randomSegmentControl.selectedSegmentIndex = Game.shared.difficulty.rawValue
      }
    
    override func viewDidDisappear(_ animated: Bool) {
      super.viewDidDisappear(animated)
      Game.shared.difficulty = selectedDifficulty
    }

}
