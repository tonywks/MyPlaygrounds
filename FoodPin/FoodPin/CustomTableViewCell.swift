//
//  CustomTableViewCell.swift
//  FoodPin
//
//  Created by HsuTony on 2015/8/27.
//  Copyright (c) 2015年 HsuTony. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var locationLabel:UILabel!
    @IBOutlet weak var typeLabel:UILabel!
    @IBOutlet weak var thumbnailImageView:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
