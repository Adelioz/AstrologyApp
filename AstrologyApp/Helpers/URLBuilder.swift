//
//  URLBuilder.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 26.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import Foundation

class URLBuilder {
    
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
    
}
