//
//  UserTableViewCell.swift
//  MonitTest
//
//  Created by Dino Ali on 11/08/19.
//  Copyright © 2019 Dino Ali. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var users: UserModel? {
        didSet {
            nameLabel.text = users?.name
            usernameLabel.text = users?.username
            emailLabel.text = users?.email
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
