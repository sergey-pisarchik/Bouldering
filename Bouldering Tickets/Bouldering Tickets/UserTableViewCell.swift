//
//  UserTableViewCell.swift
//  Bouldering Tickets
//
//  Created by Sergey Pisarchik on 9/13/15.
//  Copyright (c) 2015 Sergey Pisarchik. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
