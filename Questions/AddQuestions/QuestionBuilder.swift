//
//  QuestionBuilder.swift
//  Questions
//
//  Created by emil kurbanov on 26.09.2021.
//

import Foundation
final class QuestionBuilder {
  
  private(set) var newQuestions: [Question] = []
  private(set) var about: [String] = []
  private(set) var answers: [[String]] = []
  private(set) var rightAnswer: [String] = []
  private var answersArray: [String] = []

  
  
  func build(_ maxIndex: Int) -> [Question] {
    for i in 0 ... maxIndex {
    newQuestions.append(Question(about: about[i], answers: answers[i], rightAnswer: rightAnswer[i]))
    }
    return newQuestions
  }
  
  func setAbout(_ about: String) {
    self.about.append(about)
  }
  
  func setAnswers(_ answers: String) {
    answersArray.append(answers)
    if answersArray.count == 4 {
    self.answers.append(answersArray)
      answersArray = []
    }
  }
  
  func setRightAnswer(_ rightAnswer: String) {
    self.rightAnswer.append(rightAnswer)
  }
  
}
