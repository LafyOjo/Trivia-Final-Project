//
//  TableViewCell.swift
//  Trivia
//
//  Created by Hamzah Azam on 26/05/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    @IBOutlet weak var step1: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
