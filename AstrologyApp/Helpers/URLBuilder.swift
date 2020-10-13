//
//  URLBuilder.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 26.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import Foundation

class URLBuilder {
    
    static let shared = URLBuilder()
    
    let apiKey = "AIzaSyCFNt_GYR-nABsN7Ng9LoGR-O0mVq_VT-g"
    
    func buildURL(city: String) -> URL? {
        
       
        var urlComp = URLComponents()
        
        urlComp.scheme = "https"
        urlComp.host = "maps.googleapis.com"
        urlComp.path = "/maps/api/place/autocomplete/json"
        urlComp.queryItems = [URLQueryItem(name: "input", value: city), URLQueryItem(name: "types", value: "(cities)"), URLQueryItem(name: "language", value: "ru"), URLQueryItem(name: "key", value: apiKey)]
        
        return urlComp.url
        
        
    }
    
    func buildGetURL(city: String) -> URL? {
        
        
        var urlComp = URLComponents()
        
        urlComp.scheme = "https"
        urlComp.host = "maps.googleapis.com"
        urlComp.path = "/maps/api/place/textsearch/json"
        urlComp.queryItems = [URLQueryItem(name: "query", value: city), URLQueryItem(name: "key", value: apiKey)]
        
        return urlComp.url
    }
    
    
    //SOVMESTIMOST
    func buildURL(pair: SignPair) -> URL? {
        
        let u = "zhenshhina-\(pair.leftSign)-muzhchina-\(pair.rightSign)"
        var urlComp = URLComponents()
        
        urlComp.scheme = "https"
        urlComp.host = "horoscopes.rambler.ru"
        urlComp.path = "/sovmestimost-znakov-zodiaka/\(u)/"
        
        return urlComp.url
    }
    
    //NATAL CARD
    func buildURL() -> URL? {
        
        var urlComp = URLComponents()
        urlComp.scheme = "https"
        urlComp.host = "geocult.ru"
        urlComp.path = "/natalnaya-karta-onlayn-raschet"
        urlComp.queryItems = [URLQueryItem(name: "fn", value: "Адель"),
                              URLQueryItem(name: "fd", value: "17"),
                              URLQueryItem(name: "fm", value: "9"),
                              URLQueryItem(name: "fy", value: "1999"),
                              URLQueryItem(name: "fh", value: "7"),
                              URLQueryItem(name: "fmn", value: "43"),
                              URLQueryItem(name: "c2", value: ""),
                              URLQueryItem(name: "c1", value: "Казань"),
                              URLQueryItem(name: "tm", value: "3"),
                              URLQueryItem(name: "lt", value: "55.7887"),
                              URLQueryItem(name: "ln", value: "49.1221"),
                              URLQueryItem(name: "hs", value: "p"),
                              URLQueryItem(name: "sb", value: "1")]
        return(urlComp.url)
        
    }
    
    //MARK: - Horoscope
    
    func buildURL(sign: String, period: String) -> URL? {
        
        var u = "/\(sign)/"
        if period != "" {
            u += "\(period)/"
        }
        
        var urlComp = URLComponents()
        
        urlComp.scheme = "https"
        urlComp.host = "horoscopes.rambler.ru"
        urlComp.path = "\(u)"
        
        return urlComp.url
    }
    
}
