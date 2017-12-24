//
//  Variant.swift
//  shopify-app
//
//  Created by Rouzbeh on 2017-12-17.
//  Copyright © 2017 Rouzbeh Majidi. All rights reserved.
//

import Foundation

struct Variant : Codable {
    
    var title : String
    var price : String
    var grams : Double
    var inventory_quantity : Int
    
    
    func getFormattedPrice(withCurrency currency: String) -> String{
        return currency + price
    }
    
}
