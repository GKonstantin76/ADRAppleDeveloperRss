//
//  NewsEntity+CoreDataProperties.swift
//  ADRAppleDeveloperRss
//
//  Created by Константин on 14.06.16.
//  Copyright © 2016 Константин. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension NewsEntity {

    @NSManaged var date: String
    @NSManaged var descript: String
    @NSManaged var link: String
    @NSManaged var text: String
    @NSManaged var title: String

}
