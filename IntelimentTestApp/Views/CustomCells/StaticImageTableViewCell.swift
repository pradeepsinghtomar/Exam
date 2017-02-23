//
//  StaticImageTableViewCell.swift
//  IntelimentTestApp
//
//  Created by Pradeep Singh on 23/02/17.
//  Copyright © 2017 Pradeep Singh. All rights reserved.
//

import UIKit

/*
 I've added seperate custom table view cell because If we want to have different functions or features with each type of cell, we can add those in the seperate class.
 */

class StaticImageTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
