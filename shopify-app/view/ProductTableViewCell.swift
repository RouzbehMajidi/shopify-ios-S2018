//
//  ProductTableViewCell.swift
//  shopify-app
//
//  Created by Rouzbeh on 2017-12-23.
//  Copyright © 2017 Rouzbeh Majidi. All rights reserved.
//

import UIKit
import Alamofire

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
