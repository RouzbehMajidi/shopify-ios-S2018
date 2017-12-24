//
//  Utils.swift
//  shopify-app
//
//  Created by Rouzbeh on 2017-12-17.
//  Copyright © 2017 Rouzbeh Majidi. All rights reserved.
//

import Foundation
import Alamofire

class Utils {
    
    static let BASE_URL = "https://shopicruit.myshopify.com/admin/products.json?access_token=c32313df0d0ef512ca64d5b336a0d7c6&page="
    
    private static func buildQuery(for page : Int) -> String {
        return BASE_URL + String(page)
    }
    
    static func getProducts(page : Int, completion: @escaping ([Product]) -> Void){
        
        var products = [String : [Product]]()

        Alamofire.request(buildQuery(for: page)).responseJSON { response in
            
            switch response.result {
            case .success:
                if let json = response.data {
                    
                    let jsonDecoder = JSONDecoder()
                    
                    do{
                        try products = jsonDecoder.decode([String : [Product]].self, from: json)
                    }catch let error{
                        print(error)
                    }
                    
                }
                
                completion(products["products"]!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
