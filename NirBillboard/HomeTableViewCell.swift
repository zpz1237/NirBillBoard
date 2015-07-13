//
//  HomeTableViewCell.swift
//  NirBillboard
//
//  Created by Nirvana on 7/12/15.
//  Copyright © 2015 NSNirvana. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var chosenImage: UIImageView!
    @IBOutlet weak var detailTitleLabel: UILabel!    
    @IBOutlet weak var timeDescribe: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
