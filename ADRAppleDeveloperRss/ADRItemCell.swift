//
//  ADRItemCell.swift
//  ADRAppleDeveloperRss
//
//  Created by Константин on 11.06.16.
//  Copyright © 2016 Константин. All rights reserved.
//

import UIKit

class ADRItemCell: UITableViewCell {
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblTitle: UILabel!
    func setObjRss(objRss: ADRObjRss) {
        self.lblTitle.text = objRss.title
        self.lblDescription.text = objRss.description
        self.lblDate.text = objRss.date
    }
}
