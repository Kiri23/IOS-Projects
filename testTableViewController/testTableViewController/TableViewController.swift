//
//  TableViewController.swift
//  testTableViewController
//
//  Created by Christian Nogueras on 07/30/16.
//  Copyright © 2016 com.christian.nogueras. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var cars = ["Bmw","Toyota","Hyundai","Volvo","chevy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

   

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cars.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) // esto devuleve un UITableviewCell
        
    
        // Configure the cell...
        cell.textLabel?.text = cars[indexPath.row] // indexPath is of type NSIndexPath que contiene el row.
        cell.detailTextLabel?.text = "I like my \(cars[indexPath.row])!!"
        return cell
    }
 

    

}
