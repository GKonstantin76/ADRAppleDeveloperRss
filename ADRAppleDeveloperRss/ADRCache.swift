//
//  ADRCache.swift
//  ADRAppleDeveloperRss
//
//  Created by Константин on 11.06.16.
//  Copyright © 2016 Константин. All rights reserved.
//

class ADRCache {
    let servis = ADRServis()
    let coreData = ADRCoreData()
    
    func getBandNews(completion:(arrayRss: [ADRObjRss], buildDate: String) -> Void) {
        servis.getRss { (objRss, buildDate) in
            if objRss.isEmpty {
                let arRss = self.coreData.getNews()
                completion(arrayRss: arRss, buildDate: buildDate)
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    for newRss in objRss {
                        if !self.coreData.checkNews(newRss.title) {
                            self.coreData.createNews(newRss)
                        }
                    }
                })
                completion(arrayRss: objRss, buildDate: buildDate)
            }
        }
    }
}
