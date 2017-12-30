//
//  ProductDetailViewController.swift
//  shopify-app
//
//  Created by Rouzbeh on 2017-12-23.
//  Copyright © 2017 Rouzbeh Majidi. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UITextView!
    @IBOutlet weak var productVendor: UILabel!
    
    var product : Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = product.title
        
        productTitle.text = product.title
        productVendor.text = product.vendor
        productDescription.text = product.body_html
        productPrice.text = "From " + product.getLowestPrice()
        
        Alamofire.request(product.image.source).responseImage { (response) in
            if let image = UIImage(data: response.data!){
                self.imageView.image = image
            }else{
                self.imageView.image = UIImage(named: "shopify-bag")!
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? VariantTableViewController{
            controller.variants = product.variants
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
