//
//  MainTableViewController.swift
//  shopify-app
//
//  Created by Rouzbeh on 2017-12-17.
//  Copyright © 2017 Rouzbeh Majidi. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MainTableViewController: UITableViewController {
    
    var products = [Product]()
    
    var filteredProducts = [Product]()
    
    var nextPage = 1
    var hasMoreProducts = true
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Galactify"
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Products"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        loadNext()
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
        
        if isFiltering() {
            return filteredProducts.count
        }else {
            return products.count
        }
    
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var product : Product
        
        if isFiltering() {
            product = filteredProducts[indexPath.row]
        }else {
            product = products[indexPath.row]
        }
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "productViewCell", for: indexPath) as! ProductTableViewCell
        
        if hasMoreProducts && indexPath.row >= getProductCount() - 10 {
            loadNext()
        }

        // Configure the cell...
        cell.productName.text = product.title
        cell.productDescription.text = product.body_html
        
        Alamofire.request(product.image.source).responseImage { (response) in
            if let image = UIImage(data: response.data!){
                cell.productImageView.image = image
            }else{
                cell.productImageView.image = UIImage(named: "shopify-bag")!
            }
        }
        
        return cell
    }
    
    func getProductCount() -> Int{
        if isFiltering(){
            return filteredProducts.count
        }else{
            return products.count
        }
    }
    
    func loadNext(){
        
        Utils.getProducts(page: nextPage, completion: {products -> Void in
            if products.count == 0{
                self.hasMoreProducts = false
            }else{
                self.products += products
                
                if self.isFiltering(){
                    self.filterContent()
                }else{
                   self.tableView.reloadData()
                }

                self.nextPage += 1
            }
        })
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell){
            let controller = segue.destination as! ProductDetailViewController
            controller.product = products[indexPath.row]
        }
    }
    
    
    func isSearchBarEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContent(){
        let searchText = searchController.searchBar.text!
        
        filteredProducts = products.filter({ (product : Product) -> Bool in
            return product.title.lowercased().contains(searchText.lowercased()) || product.tags.lowercased().contains(searchText.lowercased()) ||
                product.vendor.lowercased().contains(searchText.lowercased())
            })
        
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !isSearchBarEmpty()
    }

}

extension MainTableViewController: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContent()
    }
    
}
