//
//  PieCell.swift
//  Thrifty
//
//  Created by Roslyn Lu on 6/19/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit

class PieCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var colorBlock: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
