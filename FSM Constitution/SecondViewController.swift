import UIKit

class SecondViewController: UIViewController {
    
    var passedVal: String!

    
    @IBOutlet weak var articleView: UIWebView!
    
    @IBAction func closeButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        print("SVC PassedVal is: \(passedVal)")
        
        if let htmlFile = NSBundle.mainBundle().pathForResource(passedVal, ofType: "html") {
            if let htmlData = NSData(contentsOfFile: htmlFile) { let baseURL = NSURL(fileURLWithPath:
                NSBundle.mainBundle().bundlePath)
                articleView.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            }
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == UIWebViewNavigationType.LinkClicked {
            UIApplication.sharedApplication().openURL(request.URL!)
            return false
        }
        return true
    }

}

