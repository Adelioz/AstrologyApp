//
//  HoroscopeSoup.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 22.09.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import Foundation
import SwiftSoup

class HoroscopeSoup {
    
    static let shared = HoroscopeSoup()
    
    func setup(sign: String,completion: @escaping (String) -> Void) {
        
        let url = URLBuilder.shared.buildURL(sign: getSign(sign: sign), period: getPeriod(period: "Завтра"))
        guard let myURL = url else { return }
        
        do {
            
            let myHTMLString = try String(contentsOf: myURL, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(myHTMLString)
            let div: Elements = try doc.getElementsByClass("_1dQ3")
            let span: Elements = try div.select("span")
            
            print(span.count)
            for i in span {
                print(try i.text())
                completion(try i.text())
            }
            
        } catch Exception.Error(type: _, Message: let message) {
            print(message)
        } catch {
            print("error")
        }
        
    }
    
    func getSign(sign: String) -> String {
        switch sign {
        case "Овен":
            return "aries"
        case "Телец":
            return "taurus"
        case "Близнецы":
            return "gemini"
        case "Рак":
            return "cancer"
        case "Лев":
            return "leo"
        case "Дева":
            return "virgo"
        case "Весы":
            return "libra"
        case "Скорпион":
            return "scorpio"
        case "Стрелец":
            return "sagittarius"
        case "Козерог":
            return "capricorn"
        case "Водолей":
            return "aquarius"
        case "Рыбы":
            return "pisces"
        default:
            return ""
        }
    }
    
    func getPeriod(period: String) -> String {
        switch period {
        case "Сегодня":
            return ""
        case "Завтра":
            return "tomorrow"
        case "Неделя":
            return "weekly"
        case "Месяц":
            return "monthly"
        default:
            return ""
        }
    }
    
}
