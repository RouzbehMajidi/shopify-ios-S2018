//
//  VariantTableViewCell.swift
//  shopify-app
//
//  Created by Rouzbeh on 2017-12-24.
//  Copyright © 2017 Rouzbeh Majidi. All rights reserved.
//

import UIKit

class VariantTableViewCell: UITableViewCell {
    
    @IBOutlet weak var variantName: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
