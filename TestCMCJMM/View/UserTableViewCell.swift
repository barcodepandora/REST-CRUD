//
//  UserTableViewCell.swift
//  TestCMCJMM
//
//  Created by Grupo CMC Colombia on 14/08/19.
//  Copyright © 2019 CMC. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelUser: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

