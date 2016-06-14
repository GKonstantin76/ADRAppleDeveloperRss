//
//  ADRObjRss.swift
//  ADRAppleDeveloperRss
//
//  Created by Константин on 10.06.16.
//  Copyright © 2016 Константин. All rights reserved.
//

import UIKit

class ADRObjRss {
    let title: String
    let link: String
    let description: String
    let date: String
    let text: String
    init(title: String, link: String, description: String, date: String, text: String) {
        self.title = title
        self.link = link
        self.description = description
        self.date = date
        self.text = text
    }
}
