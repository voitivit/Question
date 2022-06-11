//
//  QuestionCaretaker.swift
//  Questions
//
//  Created by emil kurbanov on 26.09.2021.
//

import Foundation

final class QuestionCaretaker {
  private let encoder = JSONEncoder()
  private let decoder = JSONDecoder()
  private let key = "question"
  func save(records: [Question]) {
    do {
      let data = try self.encoder.encode(records)
      UserDefaults.standard.set(data, forKey: key) }
    catch {
      print(error) }
  }
  
  func retrieveRecords() -> [Question] {
    guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
    do {
      return try self.decoder.decode([Question].self, from: data)
    } catch {
      print(error)
      return []
    }
  }
  
}
