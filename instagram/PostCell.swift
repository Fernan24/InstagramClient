//
//  PostCell.swift
//  instagram
//
//  Created by Fernando Rodríguez on 3/4/16.
//  Copyright © 2016 Fernando Rodríguez. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postedImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
