//
//  Game.swift
//  Questions
//
//  Created by emil kurbanov on 19.09.2021.

import Foundation
import UIKit


final class Game {
  static let shared = Game()
  
  private(set) var info = GameSession()
  var difficulty: Difficulty = .serial
  private(set) var records: [Record] {
    didSet {
      recordsCaretaker.save(records: self.records) }
  }
  
  private(set) var questions: [Question] {
    didSet {
      questionCaretaker.save(records: self.questions) }
  }
  
  private let recordsCaretaker = RecordsCaretaker()
  private let questionCaretaker = QuestionCaretaker()
  
  private init() {
    self.records = self.recordsCaretaker.retrieveRecords()
    self.questions = self.questionCaretaker.retrieveRecords()
  }
  
  func addRecord(_ record: Record) {
    self.records.append(record)
  }
  
  func addQuestion(_ question: [Question]) {
    self.questions.append(contentsOf: question)
  }
  
  func clearRecords() {
    self.records = []
  }
  
  func clearSession() {
    info.clearSession()
  }
  
  
  
}
