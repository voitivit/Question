//
//  AddQuestionViewController.swift
//  Questions
//
//  Created by emil kurbanov on 26.09.2021.
//

import UIKit
    class AddQuestionViewController: UIViewController {
        @IBOutlet weak var addQuestionTable: UITableView!
        @IBOutlet weak var addQuestionsButton: UIButton!
        private let nibIdentifier = "AddQuestionTableViewCell"
        private var questionCounter = Game.shared.questions.count
        var builder = QuestionBuilder()
        private var isButtonPressed = false {
          didSet {
            let maxIndex = (questionCounter -  Game.shared.questions.count - 1)
            let questions = builder.build(maxIndex)
            Game.shared.addQuestion(questions)
            isButtonPressed = false
          }
        }
        
        override func viewDidLoad() {
          super.viewDidLoad()
          addQuestionTable.dataSource = self
          addQuestionTable.delegate = self
          let nibFile = UINib(nibName: nibIdentifier, bundle: nil)
          addQuestionTable.register(nibFile, forCellReuseIdentifier: nibIdentifier)
          questionCounter = Game.shared.questions.count
          let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
          view.addGestureRecognizer(tapGesture)
          addQuestionsButton.alpha = 0
        }
        
        @IBAction func isButtonPressed(_ sender: Any) {
            isButtonPressed = true
            addQuestionsButton.alpha = 0
        }
        
        @IBAction func didPressAddButton(_ sender: Any) {
            questionCounter += 1
            addQuestionsButton.alpha = 1
            addQuestionTable.reloadData()
        }
    
    }
extension AddQuestionViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return questionCounter
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: nibIdentifier, for: indexPath) as? AddQuestionTableViewCell else { return UITableViewCell() }
    cell.delegate = self
    
    if !Game.shared.questions.isEmpty, indexPath.row < Game.shared.questions.count {
      let usersQuestions = Game.shared.questions[indexPath.row]
      cell.questionTextField.text = usersQuestions.about
      cell.rightAnswerTextField.text = usersQuestions.rightAnswer
      for (index, item) in usersQuestions.answers.enumerated() {
        cell.answersTextFields[index].text = item
      }
    }
    return cell
  }
}

extension AddQuestionViewController: addActionProtocol {
  func addAnswers(_ answers: String) {
    builder.setAnswers(answers)
  }
  
  func addCorrectAnswer(_ answer: String) {
    builder.setRightAnswer(answer)
  }
  
  func addAbout(_ about: String) {
    builder.setAbout(about)
  }
}
