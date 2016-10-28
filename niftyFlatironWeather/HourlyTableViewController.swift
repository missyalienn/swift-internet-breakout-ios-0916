//
//  HourlyTableViewController.swift
//  niftyFlatironWeather
//
//  Created by Missy Allan on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class HourlyTableViewController: UITableViewController {

        let store = WeatherDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return store.hourly.hourlyForecasts.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hourlyCell", for: indexPath)
        let hour = store.hourly.hourlyForecasts[indexPath.row]
        
        cell.textLabel?.text = hour.summary
        cell.detailTextLabel?.text = "\(hour.temperature)"
        
        return cell
    }
    
    
    
}











