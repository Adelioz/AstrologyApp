//
//  Parser.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 28.07.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import Foundation

class Parser {
    static let shared = Parser()
    
    func parsePlanetZodiac(string: [String], pzStruct: inout PlanetZodiac) {
        for i in 0..<string.count {
            
            
            switch string[i] {
            case let str where str.contains("Солнце в знаке"):
                var pzi = PlanetZodiacItem()
                pzi.planet = "Солнце"
                pzi.meaning = string[i + 1]
                switchSignPlanetZodiac(pzi: &pzi, s: str, pzStruct: &pzStruct)
                
            case let str where str.contains("Луна в знаке"):
                var pzi = PlanetZodiacItem()
                pzi.planet = "Луна"
                pzi.meaning = string[i + 1]
                switchSignPlanetZodiac(pzi: &pzi, s: str, pzStruct: &pzStruct)
                
            case let str where str.contains("Меркурий в знаке"):
                var pzi = PlanetZodiacItem()
                pzi.planet = "Меркурий"
                pzi.meaning = string[i + 1]
                switchSignPlanetZodiac(pzi: &pzi, s: str, pzStruct: &pzStruct)
            case let str where str.contains("Венера в знаке"):
                var pzi = PlanetZodiacItem()
                pzi.planet = "Венера"
                pzi.meaning = string[i + 1]
                switchSignPlanetZodiac(pzi: &pzi, s: str, pzStruct: &pzStruct)
                
            case let str where str.contains("Марс в знаке"):
                var pzi = PlanetZodiacItem()
                pzi.planet = "Марс"
                pzi.meaning = string[i + 1]
                switchSignPlanetZodiac(pzi: &pzi, s: str, pzStruct: &pzStruct)
                
            case let str where str.contains("Юпитер в знаке"):
                var pzi = PlanetZodiacItem()
                pzi.planet = "Юпитер"
                pzi.meaning = string[i + 1]
                switchSignPlanetZodiac(pzi: &pzi, s: str, pzStruct: &pzStruct)
                
            case let str where str.contains("Сатурн в знаке"):
                var pzi = PlanetZodiacItem()
                pzi.planet = "Сатурн"
                pzi.meaning = string[i + 1]
                switchSignPlanetZodiac(pzi: &pzi, s: str, pzStruct: &pzStruct)
                
            case let str where str.contains("Уран в знаке"):
                var pzi = PlanetZodiacItem()
                pzi.planet = "Уран"
                pzi.meaning = string[i + 1]
                switchSignPlanetZodiac(pzi: &pzi, s: str, pzStruct: &pzStruct)
                
            case let str where str.contains("Нептун в знаке"):
                var pzi = PlanetZodiacItem()
                pzi.planet = "Нептун"
                pzi.meaning = string[i + 1]
                switchSignPlanetZodiac(pzi: &pzi, s: str, pzStruct: &pzStruct)
                
            case let str where str.contains("Плутон в знаке"):
                var pzi = PlanetZodiacItem()
                pzi.planet = "Плутон"
                pzi.meaning = string[i + 1]
                switchSignPlanetZodiac(pzi: &pzi, s: str, pzStruct: &pzStruct)
                
            default:
                break
            }
            
        }
    }
    func switchSignPlanetZodiac(pzi: inout PlanetZodiacItem, s: String, pzStruct: inout PlanetZodiac) {
        switch s {
        case let str where str.contains("Овна"):   //
            pzi.sign = "Овна"
            let beg = Array(str)
            for i in beg.count - 3 ..< beg.count {
                pzi.degree.append(beg[i])
            }
            pzStruct.items.append(pzi)
        case let str where str.contains("Тельца"):  //
            pzi.sign = "Тельца"
            let beg = Array(str)
            for i in beg.count - 3 ..< beg.count {
                pzi.degree.append(beg[i])
            }
            pzStruct.items.append(pzi)
        case let str where str.contains("Близнецов"):
            pzi.sign = "Близнецов"
            let beg = Array(str)
            for i in beg.count - 3 ..< beg.count {
                pzi.degree.append(beg[i])
            }
            pzStruct.items.append(pzi)
        case let str where str.contains("Рака"):    //
            pzi.sign = "Рака"
            let beg = Array(str)
            for i in beg.count - 3 ..< beg.count {
                pzi.degree.append(beg[i])
            }
            pzStruct.items.append(pzi)
        case let str where str.contains("Льва"):    //
            pzi.sign = "Льва"
            let beg = Array(str)
            for i in beg.count - 3 ..< beg.count {
                pzi.degree.append(beg[i])
            }
            pzStruct.items.append(pzi)
        case let str where str.contains("Девы"):    //
            pzi.sign = "Девы"
            let beg = Array(str)
            for i in beg.count - 3 ..< beg.count {
                pzi.degree.append(beg[i])
            }
            pzStruct.items.append(pzi)
        case let str where str.contains("Весов"):   //
            pzi.sign = "Овен"
            let beg = Array(str)
            for i in beg.count - 3 ..< beg.count {
                pzi.degree.append(beg[i])
            }
            pzStruct.items.append(pzi)
        case let str where str.contains("Скорпиона")://
            pzi.sign = "Скорпиона"
            let beg = Array(str)
            for i in beg.count - 3 ..< beg.count {
                pzi.degree.append(beg[i])
            }
            pzStruct.items.append(pzi)
        case let str where str.contains("Стрельца")://
            pzi.sign = "Стрельца"
            let beg = Array(str)
            for i in beg.count - 3 ..< beg.count {
                pzi.degree.append(beg[i])
            }
            pzStruct.items.append(pzi)
        case let str where str.contains("Козерог"): //
            pzi.sign = "Козерога"
            let beg = Array(str)
            for i in beg.count - 3 ..< beg.count {
                pzi.degree.append(beg[i])
            }
            pzStruct.items.append(pzi)
        case let str where str.contains("Водолея"): //
            pzi.sign = "Водолея"
            let beg = Array(str)
            for i in beg.count - 3 ..< beg.count {
                pzi.degree.append(beg[i])
            }
            pzStruct.items.append(pzi)
        case let str where str.contains("Рыбы"):    //
            pzi.sign = "Рыбы"
            let beg = Array(str)
            for i in beg.count - 3 ..< beg.count {
                pzi.degree.append(beg[i])
            }
            pzStruct.items.append(pzi)
        default:
            break
        }
    }
    
    
    func parserPlanetDom(string: [String], pdStruct: inout PlanetDom) {
        for i in 0..<string.count {
            if string[i].contains("-м Доме") {
                var pd = PlanetDomItem()
                pd.title = string[i]
                pd.meaning = string[i + 1]
                pdStruct.items.append(pd)
            }
        }
    }
    
    
    func parserKarmPokaz(string: [String], kpStruct: inout KarmPokaz) {
        
        var flag = false
        for i in 0..<string.count {
            var kp = KarmPokazItem()
            
            if string[i].contains("Ретроградный") && string[i].count < 50 {
                flag = true
                kp.title = string[i]
                for j in (i + 1)..<string.count {
                    if string[j].contains("Ретроградный") && string[j].count < 50 {
                        flag = false
                    }
                    if flag == true {
                        kp.meaning += " " + string[j]
                    }
                }
                kpStruct.items.append(kp)
                //print(kpStruct)
            }
            
            
            
        }
        
    }
    
    
    func parserLunUzel(string: [String], luStruct: inout LunUzel) {
        
        var flag = false
        for i in 0..<string.count {
            var lu = LunUzelItem()
            
            if string[i].contains("Восходящий узел") && string[i].count < 100 {
                flag = true
                lu.title = string[i]
                for j in (i + 1)..<string.count {
                    if string[j].contains("Восходящий узел") && string[j].count < 100 {
                        flag = false
                    }
                    if flag == true {
                        lu.meaning += " " + string[j]
                    }
                }
                luStruct.items.append(lu)
                //print(kpStruct)
            }
            
            
            
        }
        
    }
    
    func parserParsFortun(string: [String], pfStruct: inout ParsFortun) {
        var flag = false
        for i in 0..<string.count {
            var pf = ParsFortunItem()
            
            if string[i].count < 100 && string[i].contains("Парс Фортуны в") {
                flag = true
                pf.title = string[i]
                for j in (i + 1)..<string.count {
                    if string[j].count < 100 && string[j].contains("Парс Фортуны в") {
                        flag = false
                    }
                    if flag == true {
                        let m = string[j].replacingOccurrences(of: " Дополнительное описание.", with: "")
                        pf.meaning += " " + m
                    }
                }
                pfStruct.items.append(pf)
                //print(kpStruct)
            }
            
            
            
        }
    }
    
    func parserAspectPlanet(string: [String], stringLinks: [String], apStruct: inout AspectPlanet) {
        var flag = false
        for i in 0..<string.count {
            var ap = AspectPlanetItem()
            
            if string[i].contains("Аспекты ") {
                flag = true
                ap.title = string[i]
                for j in i+1..<string.count {
                    if string[j].contains("Аспекты ") {
                        flag = false
                    }
                    if flag == true {
                        var apl = AspectPlanetLinkItem()
                        apl.title = string[j]
                        for s in 0..<stringLinks.count {
                            if apl.title == stringLinks[s] {
                                apl.link = stringLinks[s + 1]
                            }
                        }
                        ap.links.append(apl)
                    }
                }
                apStruct.items.append(ap)
                
            }
        }
        
        
    }
    
    
    func parserAspectPlanetTexts(string: [String], apliStruct: inout AspectPlanetLinkItem) {
        var flag = false
        for i in 0..<string.count {
            var apt = AspectPlanetText()
            
            if string[i].count < 100 && string[i].count > 2 {
                flag = true
                apt.title = string[i]
                for j in (i + 1) ..< string.count {
                    if string[j].count < 100 && string[j].count > 2 {
                        flag = false
                    }
                    if flag == true {
                        var m = string[j].replacingOccurrences(of: " Дополнительное описание.", with: "")
                        m = m.replacingOccurrences(of: " Читать далее...", with: "")
                        apt.descr += " " + m
                    }
                }
            }
            
            if apt.title != "" {
                apliStruct.items.append(apt)
            }
            
        }
    }
    
    
    
    
    func parserTableOne(string: [String], toStruct: inout TableOne) {
        for i in stride(from: 0, to: string.count, by: 3) {
            var to = TableOneItem()
            to.planet = string[i]
            to.dolgota = string[i + 1]
            to.pozition = string[i + 2]
            toStruct.items.append(to)
        }
    }
    func parserTableTwo(string: [String], ttStruct: inout TableTwo) {
        for i in stride(from: 0, to: string.count, by: 2) {
            var tt = TableTwoItem()
            tt.doma = string[i]
            tt.dolgota = string[i + 1]
            ttStruct.items.append(tt)
        }
    }
    func parserTableThree(string: [String], ttStruct: inout TableThree) {
        for i in stride(from: 0, to: string.count, by: 4) {
            var tt = TableThreeItem()
            tt.planet = string[i]
            tt.aspect = string[i + 1]
            tt.planet2 = string[i + 2]
            tt.orb = string[i + 3]
            ttStruct.items.append(tt)
        }
    }
    func parserTableFour(string: [String], tfStruct: inout TableFour) {
        for i in stride(from: 0, to: string.count, by: 2) {
            var tf = TableFourItem()
            tf.konfig = string[i]
            let m = string[i + 1].split(separator: " ")
            for j in m {
                if j.count > 2 {
                    tf.planet.append(String(j))
                }
            }
            tfStruct.items.append(tf)
        }
    }
    
    
    
    
    
}
