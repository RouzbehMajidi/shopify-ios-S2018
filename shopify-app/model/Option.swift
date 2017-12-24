//
//  Option.swift
//  shopify-app
//
//  Created by Rouzbeh on 2017-12-20.
//  Copyright © 2017 Rouzbeh Majidi. All rights reserved.
//

import Foundation

struct Option : Codable {
    
    var name : String
    var values : [String]
    
    init(){
        name = ""
        values = [String]()
    }
    
}
