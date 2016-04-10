//
//  ContitutionalAmendmentsTableViewController.swift
//  FSM Constitution
//
//  Created by HS on 2/24/16.
//  Copyright © 2016 HS. All rights reserved.
//

import UIKit

class ContitutionalAmendmentsTableViewController: UITableViewController {
    var caCellToPass: String!
    
    var ca2001: [String:String] = ["COMMITTEE PROPOSAL NO. 01-01":"Establishes minimum of 4 Supreme Court justices, one per State", "COMMITTEE PROPOSAL NO. 01-02":"Allows for dual citizenship","COMMITTEE PROPOSAL NO. 01-05":"Removes all FSM Supreme Court jurisdiction over ownership of lands & waters","COMMITTEE PROPOSAL NO. 01-07":"Provides for full faith and credit among the States","COMMITTEE PROPOSAL NO. 01-08":"Creates an Office of the Independent Prosecutor","COMMITTEE PROPOSAL NO. 01-09":"Provides for continual annuity for ex-Presidents & Vice Presidents","COMMITTEE PROPOSAL NO. 01-11":"Sets educational standards & establishes fund to meet standards","COMMITTEE PROPOSAL NO. 01-13":"Allows levying value-added taxes (concurrent State/Nat'l power)","COMMITTEE PROPOSAL NO. 01-15":"Increases States' share of tax revenues to not less than 80%","COMMITTEE PROPOSAL NO. 01-16":"Increases number of at-large Congress Members & limits terms","COMMITTEE PROPOSAL NO. 01-21":"Provides for direct election of President & Vice President","COMMITTEE PROPOSAL NO. 01-24":"Establishes procedure for allocating foreign financial assistance","COMMITTEE PROPOSAL NO. 01-25":"Changes voting & votes required to pass bills on 2nd reading","COMMITTEE PROPOSAL NO. 01-26":"Changes voting & votes required to override a Presidential veto"]
    
    
    var ca1990: [String] = ["COMMITTEE PROPOSAL 90-13","COMMITTEE PROPOSAL 90-19","COMMITTEE PROPOSAL 90-23","COMMITTEE PROPOSAL 90-25"]
    var sectionTitle: [String] = ["PROPOSED AMENDMENTS FROM 2001", /* THIRD FSM CONSTITUTIONAL CONVENTION (none passed in referendum):",*/ "AMENDMENTS FROM 1990"]//SECOND CONSTITUTIONAL CONVENTION (adopted by voters in referendum): "]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionTitle.count
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return sectionTitle[0]
        }
        if section == 1 {
            return sectionTitle[1]
        }
        return "TitleHeader"
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return ca2001.count
        }
        
        if section == 1 {
            return ca1990.count
        }
        return 2
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("caCell", forIndexPath: indexPath)
        
        let ca2001Keys = [String](ca2001.keys.sort())
        //let ca2001Vals = [String](ca2001.values.sort())
        
        if indexPath.section == 0 {
        
        cell.textLabel!.text = ca2001Keys[indexPath.row]
        cell.detailTextLabel!.text = ca2001[ca2001Keys[indexPath.row]]
        
        }
        if indexPath.section == 1 {
            cell.textLabel!.text = ca1990[indexPath.row]
            cell.detailTextLabel!.text = ""

        }
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print ("Segue in motion")
        if segue.identifier == "caSegue" {
           
            if let destinationVC = segue.destinationViewController as? UINavigationController {
                let destVC = destinationVC.viewControllers[0] as? CaDetailViewController
                let indexPath = self.tableView.indexPathForSelectedRow
                let currentCell = self.tableView.cellForRowAtIndexPath(indexPath!)
                caCellToPass = currentCell?.textLabel?.text
                print("preparing: \(caCellToPass)")
                
                destVC!.caPassedVal = self.caCellToPass
            }
        }
    
    }
}
