//
//  PdfViewController.swift
//  FSM Constitution
//
//  Created by HS on 2/24/16.
//  Copyright © 2016 HS. All rights reserved.
//

import UIKit

class PdfViewController: UIViewController {
    
    @IBOutlet weak var pdfWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pdfPath = NSBundle.mainBundle().pathForResource("Micronesian_Constitutional_Convention_-1975-Vol-1-1", ofType: "pdf")
        let url = NSURL.fileURLWithPath(pdfPath!)
        self.pdfWebView.loadRequest(NSURLRequest(URL: url))
        
        
        
        
        
        
        
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
