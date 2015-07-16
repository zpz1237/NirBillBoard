//
//  ExploreATableViewCell.swift
//  NirBillboard
//
//  Created by Nirvana on 7/15/15.
//  Copyright © 2015 NSNirvana. All rights reserved.
//

import UIKit

class ExploreATableViewCell: UITableViewCell {

    @IBOutlet weak var exploreImageView: UIImageView!
    @IBOutlet weak var exploreTitleLabel: UILabel!
    @IBOutlet weak var exploreTypeLabel: UILabel!
    @IBOutlet weak var exploreTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
