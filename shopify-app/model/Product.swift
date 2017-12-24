//
//  Product.swift
//  shopify-app
//
//  Created by Rouzbeh on 2017-12-17.
//  Copyright © 2017 Rouzbeh Majidi. All rights reserved.
//

import Foundation

struct Product : Codable{
    
    var id : UInt
    var handle : String
    
    var title : String
    var body_html : String
    var vendor : String
    
    var product_type : String
    var tags : String
    
    var image : Image
    
    var options : [Option]
    
    var variants : [Variant]

}

