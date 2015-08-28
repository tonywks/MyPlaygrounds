//
//  RestaurantTableTableViewController.swift
//  FoodPin
//
//  Created by HsuTony on 2015/8/27.
//  Copyright (c) 2015年 HsuTony. All rights reserved.
//

import UIKit

class RestaurantTableTableViewController: UITableViewController {

    var restaurantNames = ["Cafe Deadend","Homei","Teakha","Cade Loisl","Petite Oyster","For Kee Restaurant",
        "Po's Atelier","Bourke Street Bakery","Haigh's Chocolate","Palomino Espresso","Upstate","Traif",
        "Graham Avenue Meats And Deli","Waffle & Wolf","Five Leaves","Cafe Lore",
        "Confessional","Barrafina","Donostia","Royal Oak","CASK Pub and Kitchen"]
    
    var restaurantImages = ["1","2","3","4","5","1","2","3","4","5","1","2","3","4","5","1","2","3","4","5","1"]
    
    var restaurantIsVisited = [Bool](count:21,repeatedValue:false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return restaurantNames.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifyCell = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifyCell, forIndexPath: indexPath) as! CustomTableViewCell

        cell.nameLabel?.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView?.image = UIImage(named:restaurantImages[indexPath.row])
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
//        cell.thumbnailImageView.layer.cornerRadius = 15.0
        cell.thumbnailImageView.clipsToBounds = true
        
        if restaurantIsVisited[indexPath.row]{
            cell.accessoryType = .Checkmark
        }
        else{
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "cancel", style: .Cancel, handler: nil)
        
        let callActionHandler = {
            (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry,the call feature is no available yet.", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call"+"123-000-\(indexPath.row)", style: .Default, handler: callActionHandler)
        
        let isVisitAction = UIAlertAction(title: "I've been here", style: .Default, handler: {
            (action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .Checkmark
            self.restaurantIsVisited[indexPath.row] = true
        })
    
        optionMenu.addAction(isVisitAction)
        optionMenu.addAction(callAction)
        optionMenu.addAction(cancelAction)
        self.presentViewController(optionMenu, animated: true, completion: nil)
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete{
            self.restaurantNames.removeAtIndex(indexPath.row)
            self.restaurantImages.removeAtIndex(indexPath.row)
            self.restaurantIsVisited.removeAtIndex(indexPath.row)
            self.restaurantImages.removeAtIndex(indexPath.row)
//            self.tableView.reloadData()
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
//        println("Total item:\(self.restaurantNames.count)")
//        for name in restaurantNames{
//            println(name)
//        }
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        var shareAction = UITableViewRowAction(style: .Default, title: "Share", handler: {
            (action:UITableViewRowAction!,indexPath:NSIndexPath!) -> Void in
            let shareMenu = UIAlertController(title: nil, message: "share using", preferredStyle: .ActionSheet)
            let twitterAction = UIAlertAction(title: "twitter", style: .Default, handler: nil)
            let facebookAction = UIAlertAction(title: "facebook", style: .Default, handler: nil)
            let emailAction = UIAlertAction(title: "email", style: .Default, handler: nil)
            
        })
    }
    

    

}
