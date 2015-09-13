//
//  UserTableViewController.swift
//  Bouldering Tickets
//
//  Created by Sergey Pisarchik on 9/13/15.
//  Copyright (c) 2015 Sergey Pisarchik. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var users = [UserInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //LoadSmpleUsers
        loadSampleUsers()
    }
    
    func loadSampleUsers(){
        let image1 = UIImage(named: "Sample1")
        let user1 = UserInfo(firstName: "Петров", secondName: "Василий", fathersName: "Анатольевич", phone: "+375 29 666 00 01", mail: "petrov_vasiliy_anatol@credo-dialogue.com", enterSource: "друзья", discount: "", note: "Подозрительный барыга - много конфликтует", photo: image1)
        
        let image2 = UIImage(named: "NoPhoto")
        let user2 = UserInfo(firstName: "нет", secondName: "нет", fathersName: "нет", phone: "", mail: "", enterSource: "", discount: "", note: "", photo: image2)
        
        users += [user1, user2]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "UserTableViewCell"
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UserTableViewCell
        
        cell.nameLabel.text = user.firstName + " " + user.secondName
        cell.phoneLabel.text = user.phone
        cell.mailLabel.text = user.mail
        cell.photoImageView.image = user.photo

        // Configure the cell...

        return cell
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? ViewController, user = sourceViewController.user {
            // Add a new meal.
            let newIndexPath = NSIndexPath(forRow: users.count, inSection: 0)
            users.append(user)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
