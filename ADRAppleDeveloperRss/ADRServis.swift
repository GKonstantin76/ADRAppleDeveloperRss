//
//  ADRServis.swift
//  ADRAppleDeveloperRss
//
//  Created by Константин on 10.06.16.
//  Copyright © 2016 Константин. All rights reserved.
//
// work with server rss
import UIKit

enum DataError: String {
    case UnknownWordError = "Word not found"
    case ServerError = "Error server"
}

class ADRServis {
    let session: NSURLSession
    init() {
        self.session = NSURLSession.sharedSession()
    }
    func getRss(completion:(arrayObjRss: [ADRObjRss], buildDate: String) -> Void) {
        let strUrl = "http://developer.apple.com/news/rss/news.rss"
        let url = NSURL(string: strUrl)
        let request = NSURLRequest(URL: url!)
        let task = self.session.dataTaskWithRequest(request){(response, data, error) -> Void in
            if error == nil && data != nil {
                let (arrayItems, buildDate) = self.parse(response!)
                completion(arrayObjRss: arrayItems, buildDate: buildDate)
            } else {
                completion(arrayObjRss: [], buildDate: "")
            }
        }
        task.resume()
    }
// parsing response answer
    func parse(data: NSData) -> ([ADRObjRss], String) {
        var arrayItems = [ADRObjRss]()
        let doc: GDataXMLDocument?
        do {
            doc = try GDataXMLDocument(data: data, options: 0)
        } catch _ {
            doc = nil
        }
        let elem = doc?.rootElement()
        let arrayChannel = elem?.elementsForName("channel")
        let arrayBuildDate = arrayChannel![0].elementsForName("lastBuildDate")
        var lastBuildDate = arrayBuildDate[0].stringValue()
        let arrayPartLastBuildDate = lastBuildDate.componentsSeparatedByString(" ")
        lastBuildDate = "   " + arrayPartLastBuildDate[0] + " " + arrayPartLastBuildDate[1] + " " + arrayPartLastBuildDate[2] + " " + arrayPartLastBuildDate[3]
        let arrayItemsXML = arrayChannel![0].elementsForName("item")
        for item in arrayItemsXML {
            let arrayTitle = item.elementsForName("title")
            let itemTitle = arrayTitle[0].stringValue()
            let arrayLink = item.elementsForName("link")
            let itemLink = arrayLink[0].stringValue()
            let arrayDescription = item.elementsForName("description")
            var itemDescription = arrayDescription[0].stringValue()
            if itemDescription.characters.count > 200 {
                itemDescription = itemDescription.substringToIndex(itemDescription.endIndex.advancedBy(200 - itemDescription.characters.count))
            }
            let arrayDate = item.elementsForName("pubDate")
            let itemDate = arrayDate[0].stringValue()
            let objRss = ADRObjRss(title: itemTitle, link: itemLink, description: itemDescription, date: itemDate, text: "")
            arrayItems.append(objRss)
        }
        return (arrayItems, lastBuildDate)
    }
}
