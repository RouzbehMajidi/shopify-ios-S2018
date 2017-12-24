//
//  Image.swift
//  shopify-app
//
//  Created by Rouzbeh on 2017-12-20.
//  Copyright © 2017 Rouzbeh Majidi. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

struct Image : Codable {
    
    var source : String
    
    enum CodingKeys: String, CodingKey {
        case source = "src"
    }

    
}
