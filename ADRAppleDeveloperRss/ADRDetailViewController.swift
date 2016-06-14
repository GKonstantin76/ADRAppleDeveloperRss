//
//  ADRDetailViewController.swift
//  ADRAppleDeveloperRss
//
//  Created by Константин on 12.06.16.
//  Copyright © 2016 Константин. All rights reserved.
//

import UIKit

class ADRDetailViewController: UIViewController {
    var objRss: ADRObjRss?
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = NSURLRequest(URL: NSURL(string: objRss!.link)!)
        self.webView.loadRequest(request)
    }
}
