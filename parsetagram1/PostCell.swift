//
//  PostCell.swift
//  parsetagram1
//
//  Created by Anastasiya Uraleva on 3/23/19.
//  Copyright © 2019 Anastasiya Uraleva. All rights reserved.
//

import UIKit


class PostCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
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
