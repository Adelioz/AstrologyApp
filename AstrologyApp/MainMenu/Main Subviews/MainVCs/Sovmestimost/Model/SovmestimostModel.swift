//
//  SovmestimostModel.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 28.07.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import Foundation

struct SovmestString {
    static let loveTitle = "Любовь"
    static let sexTitle = "Секс"
    static let famTitle = "Семья и брак"
    static let friendTitle = "Дружба"
    static let workTitle = "Работа и бизнес"
}

struct Sovmest {
    var loveTitle = ""
    var sexTitle = ""
    var famTitle = ""
    var friendTitle = ""
    var workTitle = ""
    
    var percent = ""
}

struct SignPair {
    var leftSign: String
    var rightSign: String
}
