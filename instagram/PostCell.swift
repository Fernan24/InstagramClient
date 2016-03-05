//
//  PostCell.swift
//  instagram
//
//  Created by Fernando Rodríguez on 3/4/16.
//  Copyright © 2016 Fernando Rodríguez. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostCell: UITableViewCell {

    @IBOutlet weak var postedImageView: PFImageView!
    @IBOutlet weak var captionLabel: UILabel!
    var instaPost: PFObject! {
        didSet {
            self.captionLabel.text = instaPost["caption"] as? String
            self.postedImageView.file = instaPost["media"] as? PFFile
            self.postedImageView.loadInBackground()
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
