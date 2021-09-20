//
//  TableViewCellScore.swift
//  Questions
//
//  Created by emil kurbanov on 19.09.2021.
//

import UIKit

class TableViewCellScore: UITableViewCell {

    @IBOutlet weak var scoreLableCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(score: Double?) {
        if let score = score {
            scoreLableCell.text = String(score)
        }
    }
    
    
}
