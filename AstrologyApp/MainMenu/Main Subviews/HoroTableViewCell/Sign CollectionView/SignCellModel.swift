//
//  SignCellModel.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 11.09.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import Foundation
import UIKit

struct SignCellModel {
    var name: String = ""
    var image: UIImage = UIImage()
    
    static func fetchSign() -> [SignCellModel] {
        let oven = SignCellModel(name: "Овен", image: UIImage(named: "oven")!)
        let telec = SignCellModel(name: "Телец", image: UIImage(named: "telec")!)
        let bliznec = SignCellModel(name: "Близнецы", image: UIImage(named: "bliznec")!)
        let rak = SignCellModel(name: "Рак", image: UIImage(named: "rak")!)
        let lev = SignCellModel(name: "Лев", image: UIImage(named: "lev")!)
        let deva = SignCellModel(name: "Дева", image: UIImage(named: "deva")!)
        let vesy = SignCellModel(name: "Весы", image: UIImage(named: "vesy")!)
        let scorpion = SignCellModel(name: "Скорпион", image: UIImage(named: "scorpion")!)
        let strelec = SignCellModel(name: "Стрелец", image: UIImage(named: "strelec")!)
        let kozerog = SignCellModel(name: "Козерог", image: UIImage(named: "kozerog")!)
        let vodoley = SignCellModel(name: "Водолей", image: UIImage(named: "vodoley")!)
        let ryby = SignCellModel(name: "Рыбы", image: UIImage(named: "ryby")!)
        
        return [oven, telec, bliznec, rak, lev, deva, vesy, scorpion, strelec, kozerog, vodoley, ryby]
    }
}
