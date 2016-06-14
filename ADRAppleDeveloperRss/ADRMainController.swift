//
//  ADRMainController.swift
//  ADRAppleDeveloperRss
//
//  Created by Константин on 10.06.16.
//  Copyright © 2016 Константин. All rights reserved.
//

import UIKit

class ADRMainController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var arrayRss = [ADRObjRss]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var lblBuildDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        let rss = ADRCache()
        rss.getBandNews { (arrayRss, lastBuildDate) in
            self.arrayRss = arrayRss
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
                self.lblBuildDate.text = lastBuildDate
            })
        }
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 170
    }

     // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayRss.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ident = "identItem"
        let cell = tableView.dequeueReusableCellWithIdentifier(ident) as! ADRItemCell
        cell.setObjRss(self.arrayRss[indexPath.row])
        return cell
    }
    
     // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            let detailVC = segue.destinationViewController as! ADRDetailViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow
            let objRss = self.arrayRss[(selectedIndexPath?.row)!]
            detailVC.objRss = objRss
        }
    }

}

