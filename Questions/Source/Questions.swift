//
//  Questions.swift
//  Questions
//
//  Created by emil kurbanov on 19.09.2021.
//

import Foundation
import UIKit

struct Question: Codable {
  var about: String
  var answers: [String]
  var rightAnswer: String
}
