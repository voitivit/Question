//
//  RecordsCaretaker.swift
//  Questions
//
//  Created by emil kurbanov on 26.09.2021.
//

import Foundation
final class RecordsCaretaker {
  private let encoder = JSONEncoder()
  private let decoder = JSONDecoder()
  private let key = "records"
  func save(records: [Record]) {
    do {
      let data = try self.encoder.encode(records)
      UserDefaults.standard.set(data, forKey: key) }
    catch {
      print(error) }
  }
  
  func retrieveRecords() -> [Record] {
    guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
    do {
      return try self.decoder.decode([Record].self, from: data)
    } catch {
      print(error)
      return []
    }
  }
  
}
