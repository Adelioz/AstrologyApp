//
//  NatalCardVC.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 28.07.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit
import SwiftSoup

class NatalCardVC: UIViewController {

    let builder = URLBuilder()

    
    var natalModel = NatalModel()
    
    var ascend = AscendZnak()
    var sered = SeredNeba()
    var planetDom = PlanetDom()
    var planetZod = PlanetZodiac()
    var karmPokaz = KarmPokaz()
    var lunUzel = LunUzel()
    var parsFortun = ParsFortun()
    
    var tables = Tables()
    var tableOne = TableOne()
    var tableTwo = TableTwo()
    var tableThree = TableThree()
    var tableFour = TableFour()
    
    var aspectPlanet = AspectPlanet()
    
    var chartImages = ChartImages()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let results = setup()
        guard let res = results else { print("KNPDbIK"); return }
        parsElements(res: res)
        buildNatalModel()
        print(natalModel.chartImages.wheel)
        //print(natalModel)
        
        
        
    }
    
    
    func setup() -> ParsRaw? {
        
        var rawData = ParsRaw()
        
        let myURLString = builder.buildURL()
        guard let myURL = myURLString else { print("xui"); return nil }
        
        do {
            let myHTMLString = try String(contentsOf: myURL, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(myHTMLString)
            let center: Elements = try doc.select("center")
            let table: Elements = try center.select("table")
            let tbody: Elements = try table.select("tbody")
            let tr: Elements = try tbody.select("tr")
            let td: Elements = try tr.select("td")
            
            
            let font: Elements = try doc.select("font")
            let h3: Elements = try font.select("h3")
            let p: Elements = try font.select("p")
            //let p2: Elements = try doc.children()
            let div: Element = try doc.getElementById("post-6177")!
            let ch: Elements = div.children()
            
            let wheelIm: Element = try div.getElementById("r660")!
            let wheelImChild: Elements = wheelIm.children()
            let wheelSrc: String = try wheelImChild[0].attr("src")
            //print(wheelSrc)
            
            let gridIm: Element = try div.getElementById("r705")!
            let gridImChild: Elements = gridIm.children()
            let gridSrc: String = try gridImChild[0].attr("src")
            //print(gridSrc)
            
            
            let block: Elements = try doc.getElementsByClass("block")
            let a: Elements = try block.select("a")
            
            var aspectPlanetLinksArray = [String]()
            for i in 0..<a.count {
                aspectPlanetLinksArray.append(try a[i].text())
                aspectPlanetLinksArray.append(try a[i].attr("href"))
            }
            
            
            
            var linkArray = [String]()
            for i in a {
                linkArray.append(try i.attr("href"))
            }
            
            
            var tableArray = [String]()
            for i in td {
                if try i.text() != "" && i.text() != " " {
                    tableArray.append(try i.text())
                    //print(try i .text())
                }
            }
            
            //1
            var tableOneArray = [String]()
            for i in 0..<tableArray.count {
                
                if tableArray[i] == "Планеты" && tableArray[i + 1] == "Долгота" && tableArray[i + 2] == "Позиция Дома" {
                    for j in i+3..<tableArray.count {
                        if tableArray[j] == "Развернуть/Свернуть" {
                            break
                        }
                        
                        var m = Array(tableArray[j])
                        if m.count > 0 {
                            while m[0] == " " || m[0] == " " {
                                m.removeFirst()
                            }
                            
                            if m.count > 3 && m[1] == " " {
                                m.removeFirst()
                                m.removeFirst()
                            }
                            
                            if m.count > 3 && m[m.count - 2] == " " {
                                m.removeLast()
                                m.removeLast()
                            }
                            //.replacingOccurrences(of: "     ", with: "")
                            tableOneArray.append(String(m))
                        }
                    }
                }
                
            }
            
            //2
            var tableTwoArray = [String]()
            for i in 0..<tableArray.count {
                if tableArray[i] == "Дома" && tableArray[i + 1] == "Долгота" {
                    for j in i+2..<tableArray.count {
                        if tableArray[j] == "Развернуть/Свернуть" {
                            break
                        }
                        
                        var m = Array(tableArray[j])
                        if m.count > 3 && m[1] == " " {
                            m.removeFirst()
                            m.removeFirst()
                        }
                        
                        if m.count > 3 && m[m.count - 2] == " " {
                            m.removeLast()
                            m.removeLast()
                        }
                        
                        //print(String(m))
                        tableTwoArray.append(String(m))
                    }
                }
            }
            
            //3
            var tableThreeArray = [String]()
            for i in 0..<tableArray.count {
                if tableArray[i] == "Планеты" && tableArray[i + 1] == "Аспекты" && tableArray[i + 2] == "Планеты" && tableArray[i + 3] == "Орб" {
                    for j in i+4..<tableArray.count {
                        if tableArray[j] == "Развернуть/Свернуть" {
                            break
                        }
                        
                        var m = Array(tableArray[j])
                        if m.count > 3 && m[1] == " " {
                            m.removeFirst()
                            m.removeFirst()
                        }
                        
                        if m.count > 3 && m[m.count - 2] == " " {
                            m.removeLast()
                            m.removeLast()
                        }
                        
                        //print(String(m))
                        tableThreeArray.append(String(m))
                    }
                }
            }
            
            //4
            var tableFourArray = [String]()
            for i in 0..<tableArray.count {
                if tableArray[i] == "Конфигурации" && tableArray[i + 1] == "Планеты" {
                    for j in i+2..<tableArray.count {
                        if tableArray[j] == "Развернуть/Свернуть" {
                            break
                        }
                        
                        var m = Array(tableArray[j])
                        //                        if m.count > 3 && m[1] == " " {
                        //                            m.removeFirst()
                        //                            m.removeFirst()
                        //                        }
                        
                        if m.count > 3 && m[m.count - 2] == " " {
                            m.removeLast()
                            m.removeLast()
                        }
                        
                        //print(String(m))
                        tableFourArray.append(String(m))
                    }
                }
            }
            
            var aspectPlanetArray = [String]()
            for i in 0..<ch.count {
                if try ch[i].text() == "АСПЕКТЫ ПЛАНЕТ" {
                    for j in i+1..<ch.count {
                        if try ch[j].text() == "КАРМИЧЕСКИЕ ПОКАЗАТЕЛИ" {
                            break
                        }
                        if try ch[j].text() != "" && ch[j].text().count < 50 {
                            aspectPlanetArray.append(try ch[j].text())
                        }
                    }
                }
            }
            
            
            var karmPokazArray = [String]()
            for i in 0..<ch.count {
                if try ch[i].text() == "Ретроградные планеты" {
                    for j in i..<ch.count {
                        
                        if try ch[j].text().contains("Лунные узлы") {
                            break
                        }
                        
                        if try ch[j].text() != "" {
                            karmPokazArray.append(try ch[j].text())
                        }
                        
                        
                    }
                }
            }
            
            var lunUzelArray = [String]()
            for i in 0..<ch.count {
                if try ch[i].text() == titleText.lunUzelTitle {
                    for j in (i+1)..<ch.count {
                        if try ch[j].text() == "< Парс Фортуны" {
                            break
                        }
                        if try ch[j].text() != "" {
                            lunUzelArray.append(try ch[j].text())
                        }
                    }
                }
            }
            
            var parsFortunArray = [String]()
            for i in 0..<ch.count {
                if try ch[i].text() == titleText.parsFortun {
                    for j in (i+1)..<ch.count {
                        if try ch[j].text() == "ПРОДОЛЖЕНИЕ" {
                            break
                        }
                        if try ch[j].text().count < 100 && ch[j].text().contains("Парс Фортуны в") {
                            
                        }
                        if try ch[j].text() != "" {
                            parsFortunArray.append(try ch[j].text())
                        }
                    }
                }
            }
            
            
            
            
            for f in font {
                let ch = f.children()
                if ch.count > 0 {
                    if try ch[0].text().contains("- Управитель") {
                        for i in ch {
                            var charArr = Array(try i.text())
                            if charArr[1] == " " {
                                charArr.removeFirst()
                                charArr.removeFirst()
                                ascend.title = String(charArr)
                            } else {
                                let m = try i.text().replacingOccurrences(of: " Читать далее...", with: "")
                                ascend.meaning += m                            }
                        }
                    }
                }
            }
            
            for f in font {
                let ch = f.children()
                if ch.count > 0 {
                    if try ch[0].text().contains("Середина неба в знаке") {
                        sered.title = try ch[0].text()
                        for i in 1 ..< ch.count {
                            let m = try ch[i].text().replacingOccurrences(of: " Читать далее...", with: "")
                            sered.meaning += m
                        }
                    }
                }
            }
            
            var planetZodArray = [String]()
            
            for f in font {
                
                let p = try f.select("p").array()
                if p.count > 0 {
                    if try p[0].text() == titleText.planetZodiacTitle
                    {
                        //print(f.children())
                        let child = f.children()
                        for ch in child {
                            if try ch.text() != "" && !(ch.text().hasPrefix("Солнце:")) && !ch.text().hasPrefix("Луна:") && !ch.text().hasPrefix(titleText.planetZodiacTitle)
                            {
                                planetZodArray.append(try ch.text())
                                
                            }
                        }
                    }
                }
            }
            
            var planetDomArray = [String]()
            
            for f in font {
                let p = try f.select("p").array()
                if p.count > 0 {
                    if try p[0].text() == titleText.planetDomTitle
                    {
                        let child = f.children()
                        for ch in child {
                            if try ch.text() != "" && !(ch.text().hasPrefix(titleText.planetDomTitle)) && !ch.text().hasPrefix(titleText.planetDomTitle2) && !ch.text().hasPrefix(titleText.planetDomTitle3)
                            {
                                let m = try ch.text().replacingOccurrences(of: " Читать далее... Дополнительное описание.", with: "")
                                let m2 = m.replacingOccurrences(of: " Читать далее...", with: "")
                                var char = Array(m2)
                                if char[1] == " " {
                                    char.removeFirst()
                                    char.removeFirst()
                                }
                                let str = String(char)
                                planetDomArray.append(str)
                            }
                        }
                    }
                }
                
            }
            
            
            var pArray = [String]()
            for p in p {
                pArray.append(try p.text())
                //print(try p.text())
            }
            var hArray = [String]()
            for h in h3 {
                let hText = String(try h.text().dropFirst(2))
                hArray.append(hText)
                //print(hText)
                
            }
            //let b: Elements = try center.select("b")
            
            rawData.p = pArray
            rawData.h = hArray
            rawData.planetZodiac = planetZodArray
            rawData.planetDom = planetDomArray
            rawData.karmPokaz = karmPokazArray
            rawData.lunUzel = lunUzelArray
            rawData.parsFortun = parsFortunArray
            
            rawData.tableOneArray = tableOneArray
            rawData.tableTwoArray = tableTwoArray
            rawData.tableThreeArray = tableThreeArray
            rawData.tableFourArray = tableFourArray
            
            rawData.aspectPlanetArray = aspectPlanetArray
            rawData.aspectPlanetLinksArray = aspectPlanetLinksArray
            
            rawData.wheelString = wheelSrc
            rawData.gridString = gridSrc
            return rawData
            
        } catch Exception.Error(type: _, Message: let message) {
            print(message)
            return nil
        } catch {
            print("error")
            return nil
        }
        
        
    }
    
    func setupAspectPlanet(apStruct: inout AspectPlanet) {
        for i in 0..<apStruct.items.count {
            for j in 0..<apStruct.items[i].links.count {
                let UrlString = apStruct.items[i].links[j].link//j.link
                var array = [String]()
                guard let url = URL(string: UrlString) else { print("pipyao"); return }
                do {
                    let myHTMLString = try String(contentsOf: url, encoding: .utf8)
                    let doc: Document = try SwiftSoup.parse(myHTMLString)
                    let div: Element = try doc.getElementsByClass("entry-content article").first()!
                    let ch: Elements = div.children()
                    //print(ch.count)
                    for i in ch {
                        if try i.text().contains("Поделись с друзьями. +5 к КАРМЕ.") {
                            break
                        }
                        if try i.text() != "" && !i.text().contains("Автор: "){
                            array.append(try i.text())
                            //print(try i.text())
                        }
                        
                        
                    }
                } catch Exception.Error(type: _, Message: let message) {
                    print(message)
                } catch {
                    print(error)
                }
                
                Parser.shared.parserAspectPlanetTexts(string: array, apliStruct: &apStruct.items[i].links[j])
            }
        }
        
    }
    
    func parsElements(res: ParsRaw) {
        Parser.shared.parserPlanetDom(string: res.planetDom, pdStruct: &planetDom)
        Parser.shared.parsePlanetZodiac(string: res.planetZodiac, pzStruct: &planetZod)
        Parser.shared.parserKarmPokaz(string: res.karmPokaz, kpStruct: &karmPokaz)
        Parser.shared.parserLunUzel(string: res.lunUzel, luStruct: &lunUzel)
        Parser.shared.parserParsFortun(string: res.parsFortun, pfStruct: &parsFortun)
        Parser.shared.parserTableOne(string: res.tableOneArray, toStruct: &tableOne)
        Parser.shared.parserTableTwo(string: res.tableTwoArray, ttStruct: &tableTwo)
        Parser.shared.parserTableThree(string: res.tableThreeArray, ttStruct: &tableThree)
        Parser.shared.parserTableFour(string: res.tableFourArray, tfStruct: &tableFour)
        Parser.shared.parserAspectPlanet(string: res.aspectPlanetArray, stringLinks: res.aspectPlanetLinksArray, apStruct: &aspectPlanet)
        setupAspectPlanet(apStruct: &aspectPlanet)
        
        chartImages.wheel = res.wheelString
        chartImages.grid = res.gridString
    }
    
    func buildNatalModel() {
        let tables = Tables(tableOne: tableOne,
                            tableTwo: tableTwo,
                            tableThree: tableThree,
                            tableFour: tableFour)
        
        let natalModel = NatalModel(ascendZnak: ascend,
                                    seredNeba: sered,
                                    planetDom: planetDom,
                                    planetZodiac: planetZod,
                                    aspectPlanet: aspectPlanet,
                                    karmPokaz: karmPokaz,
                                    lunUzel: lunUzel,
                                    parsFortun: parsFortun,
                                    tables: tables,
                                    chartImages: chartImages)
        self.natalModel = natalModel
    }

}
