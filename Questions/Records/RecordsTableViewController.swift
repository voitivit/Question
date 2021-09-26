//
//  RecordsTableViewController.swift
//  Questions
//
//  Created by emil kurbanov on 26.09.2021.
//

import UIKit

class RecordsTableViewController: UITableViewController {
  
  let nibIdentifier = "RecordsTableViewCell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let nibFile = UINib(nibName: nibIdentifier, bundle: nil)
    tableView.register(nibFile, forCellReuseIdentifier: nibIdentifier)
    
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Game.shared.records.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: nibIdentifier, for: indexPath) as? RecordsTableViewCell else { return UITableViewCell()}
    
    let date = Game.shared.records[indexPath.row].date
    let ratio = Game.shared.records[indexPath.row].score
    let stringDate = formatter(date: date)
    cell.configure(date: stringDate, ratio: ratio)
    return cell
  }
}

extension RecordsTableViewController {
  func formatter(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "hh:mm:ss dd-MM-yyyy"
    return dateFormatter.string(from: date)
  }
}
