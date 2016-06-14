//
//  ADRCoreData.swift
//  ADRAppleDeveloperRss
//
//  Created by Константин on 13.06.16.
//  Copyright © 2016 Константин. All rights reserved.
//

import UIKit

class ADRCoreData {
// get all news
    func getNews() -> [ADRObjRss] {
        let arrayNewsEntity = NewsEntity.findAll() as! [NewsEntity]
        var arrayNews = [ADRObjRss]()
        for news in arrayNewsEntity {
            let oneNews = ADRObjRss(title: news.title, link: news.link, description: news.descript, date: news.date, text: news.text)
            arrayNews.append(oneNews)
        }
        return arrayNews
    }
// check record in CoreData
    func checkNews(title: String) -> Bool {
        let predicate = NSPredicate(format: "title=%@", title)
        let arrayNews = NewsEntity.findAllWithPredicate(predicate) as! [NewsEntity]
        return arrayNews.count > 0 ? true : false
    }
// create record
    func createNews(objRss: ADRObjRss) {
        let newsEntity = NewsEntity.createEntity() as! NewsEntity
        newsEntity.title = objRss.title
        newsEntity.link = objRss.link
        newsEntity.descript = objRss.description
        newsEntity.date = objRss.date
        newsEntity.text = objRss.text
        NSManagedObjectContext.defaultContext().saveToPersistentStoreAndWait()
    }
}
