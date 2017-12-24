//
//  MainTableViewController.swift
//  shopify-app
//
//  Created by Rouzbeh on 2017-12-17.
//  Copyright © 2017 Rouzbeh Majidi. All rights reserved.
//

import UIKit
import Alamofire

class MainTableViewController: UITableViewController {
    
    var products = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utils.getProducts(page: 1, completion: {products -> Void in
            self.products = products
            print(products.count)
            self.tableView.reloadData()
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productViewCell", for: indexPath) as! ProductTableViewCell

        // Configure the cell...
        cell.productName.text = product.title
        cell.productDescription.text = product.body_html
        
        Alamofire.request(product.image.src).responseData { (response) in
            cell.productImageView.image = UIImage(data: response.data!)
        }
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell){
            let controller = segue.destination as! ProductDetailViewController
            controller.product = products[indexPath.row]
            controller.image = cell.imageView?.image
        }
    }

}
