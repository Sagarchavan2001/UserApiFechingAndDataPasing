//
//  userTableViewCell.swift
//  machintest19Jan
//
//  Created by STC on 19/01/24.
//

import UIKit

class userTableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstName: UILabel!
    
    
    @IBOutlet weak var lastnameLAbel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
