//
//  RecordsTableViewCell.swift
//  Questions
//
//  Created by emil kurbanov on 26.09.2021.
//

import UIKit

class RecordsTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratioLabel: UILabel!
    override func awakeFromNib() {
          super.awakeFromNib()
          clearCell()
      }

      override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)

          // Configure the view for the selected state
      }
    
    override func prepareForReuse() {
      clearCell()
    }
    
    func clearCell() {
      dateLabel.text = nil
      ratioLabel.text = nil
    }
    
    func configure(date: String?, ratio: Double?) {
      
      if let date = date {
        dateLabel.text = date
      }
      
      if let ratio = ratio {
        ratioLabel.text = String(ratio)
      }
      
    }

    
}
