//
//  SoupHelper.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 28.07.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import Foundation
import SwiftSoup

class SoupHelper {
    
    static let shared = SoupHelper()
    
    func setup(url: URL?, completion: @escaping (Sovmest) -> Void){
        var sovmest = Sovmest()
        let url = url
        guard let myURL = url else { return }
        do {
            
            let myHTMLString = try String(contentsOf: myURL, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(myHTMLString)
            let div: Elements = try doc.select("div")
            let per: Element = try doc.getElementsByClass("_2Dn_").last()!
            sovmest.percent = try per.text()
            
            for i in 0..<div.count {
                
                switch try div[i].text() {
                case SovmestString.loveTitle:
                    sovmest.loveTitle = try div[i + 1].text()
                    print("love")
                case SovmestString.sexTitle:
                    sovmest.sexTitle = try div[i + 1].text()
                    print("sex")
                case SovmestString.famTitle:
                    sovmest.famTitle = try div[i + 1].text()
                    print("family")
                case SovmestString.friendTitle:
                    sovmest.friendTitle = try div[i + 1].text()
                    print("friend")
                case SovmestString.workTitle:
                    sovmest.workTitle = try div[i + 1].text()
                    print("work")
                default:
                    break
                }
                
            }
            completion(sovmest)
            
        } catch Exception.Error(type: _, Message: let message) {
            print(message)
            return
        } catch let error {
            print(error.localizedDescription)
            return
        }
        
    }
    
    
}

