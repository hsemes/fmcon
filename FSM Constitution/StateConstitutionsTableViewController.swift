import UIKit

class StateConstitutionsTableViewController: UITableViewController{
    
    var valueToPass: String!
    
    var states: [String] = ["CHUUK","KOSRAE","POHNPEI","YAP"]
    
    var subSectionTitle: [String] = ["Constitution","Proposed Amendments"]
    
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
        return states.count
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0: return states[section]
        case 1: return states[section]
        case 2: return states[section]
        case 3: return states[section]
        default: return "STATES"
            
        }
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subSectionTitle.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("articleCell", forIndexPath: indexPath)
        
        //let ca2001Keys = [String](ca2001.keys.sort())
        //let ca2001Vals = [String](ca2001.values.sort())
    
        cell.textLabel!.text = subSectionTitle[indexPath.row]
            //cell.detailTextLabel!.text = ca2001[ca2001Keys[indexPath.row]]

        /*
        if indexPath.section == 0 {
            
            cell.textLabel!.text = ca2001Keys[indexPath.row]
            cell.detailTextLabel!.text = ca2001[ca2001Keys[indexPath.row]]
        //cell.textLabel!.text = states[indexPath.row]
        
        
        cell.textLabel!.text = //articleRomans[indexPath.row]
        cell.detailTextLabel!.text =  //articles[articleRomans[indexPath.row]]
        */
        
        return cell
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        print ("Seciton: \(section)")
        print ("Row: \(row)")
        
        let cellIndexPath = tableView.indexPathForSelectedRow!
        let cell = tableView.cellForRowAtIndexPath(cellIndexPath)
        valueToPass = cell?.textLabel?.text
        
        
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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "articleSegue" {
            if let destinationVC = segue.destinationViewController as? UINavigationController {
                //print("passed segue second if")
                let destVC = destinationVC.viewControllers[0] as? SecondViewController
                let indexPath = self.tableView.indexPathForSelectedRow
                let currentCell = self.tableView.cellForRowAtIndexPath(indexPath!)
                valueToPass = currentCell?.textLabel?.text
                print("preparing: \(valueToPass)")

                destVC!.passedVal = self.valueToPass

            }
            
        }
    }
}