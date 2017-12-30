//
//  VariantTableViewController.swift
//  shopify-app
//
//  Created by Rouzbeh on 2017-12-24.
//  Copyright © 2017 Rouzbeh Majidi. All rights reserved.
//

import UIKit

class VariantTableViewController: UITableViewController {
    
    var variants : [Variant]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return variants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let variant = variants[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "variantViewCell", for: indexPath) as! VariantTableViewCell
        
        cell.variantName.text = variant.title
        cell.priceLabel.text = variant.price

        // Configure the cell...

        return cell
    }
}
