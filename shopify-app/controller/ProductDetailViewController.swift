//
//  ProductDetailViewController.swift
//  shopify-app
//
//  Created by Rouzbeh on 2017-12-23.
//  Copyright © 2017 Rouzbeh Majidi. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    
    var product : Product!
    var image : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productTitle.text = product.title
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
