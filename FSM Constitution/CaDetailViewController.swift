//
//  CaDetailViewController.swift
//  FSM Constitution
//
//  Created by HS on 2/24/16.
//  Copyright © 2016 HS. All rights reserved.
//

import UIKit

class CaDetailViewController: UIViewController {
    
    @IBOutlet weak var caWebView: UIWebView!
    var caPassedVal: String!
    
    @IBAction func doneButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        print("caPassedVal is: \(caPassedVal)")
        
        if let htmlFile = NSBundle.mainBundle().pathForResource(caPassedVal, ofType: "html") {
            if let htmlData = NSData(contentsOfFile: htmlFile) { let baseURL = NSURL(fileURLWithPath:
                NSBundle.mainBundle().bundlePath)
                caWebView.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
