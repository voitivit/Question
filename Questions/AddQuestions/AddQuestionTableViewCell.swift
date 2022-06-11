//
//  AddQuestionTableViewCell.swift
//  Questions
//
//  Created by emil kurbanov on 26.09.2021.
//

import UIKit
protocol addActionProtocol {
  func addAbout(_ about: String)
  func addAnswers(_ answers: String)
  func addCorrectAnswer(_ answer: String)
}
class AddQuestionTableViewCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet var answersTextFields: [UITextField]!
    @IBOutlet weak var rightAnswerTextField: UITextField!
    
    
    
    var delegate: addActionProtocol!
    override func awakeFromNib() {
      super.awakeFromNib()
      questionTextField.delegate = self
      answersTextFields.forEach({$0.delegate = self})
      rightAnswerTextField.delegate = self
    }
    
    override func prepareForReuse() {
    }
    
    func clearCell() {
      questionTextField.text = nil
      answersTextFields.forEach({$0.text = nil})
      rightAnswerTextField.text = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
      if textField == questionTextField, textField.text != "" {
        delegate.addAbout(textField.text!)
      } else
      if let answer = answersTextFields.first(where: {$0 == textField}), textField.text != "" {
        delegate.addAnswers(answer.text!)
      } else
      if textField == rightAnswerTextField, textField.text != "" {
        delegate.addCorrectAnswer(textField.text!)
      }
    }
    
}
