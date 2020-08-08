//
//  NatalModel.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 28.07.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import Foundation

struct NatalModel {
    var ascendZnak = AscendZnak()
    var seredNeba = SeredNeba()
    var planetDom = PlanetDom()
    var planetZodiac = PlanetZodiac()
    var aspectPlanet = AspectPlanet()
    var karmPokaz = KarmPokaz()
    var lunUzel = LunUzel()
    var parsFortun = ParsFortun()
    var tables = Tables()
    
    var chartImages = ChartImages()
    
}


//АСЦЕНДЕНТ
struct AscendZnak {
    var title: String = ""
    var meaning: String = ""
}


//СЕРЕДИНА НЕБА
struct SeredNeba {
    var title: String = ""
    var meaning: String = ""
}


//ПЛАНЕТЫ В ДОМАХ
struct PlanetDom {
    var items = [PlanetDomItem]()
}

struct PlanetDomItem {
    var title: String = ""
    var meaning: String = ""
}


//ПЛАНЕТЫ В ЗНАКАХ ЗОДИАКА
struct PlanetZodiac {
    var items = [PlanetZodiacItem]()
    
}

struct PlanetZodiacItem {
    var planet: String = ""
    var sign: String = ""
    var degree: String = ""
    var meaning: String = ""
}






//АСПЕКТЫ ПЛАНЕТ
struct AspectPlanet {
    var items = [AspectPlanetItem]()
}

struct AspectPlanetItem {
    var title: String = ""
    var links = [AspectPlanetLinkItem]()
}

struct AspectPlanetLinkItem {
    var title: String = ""
    var link: String = ""
    var items = [AspectPlanetText]()
}

struct AspectPlanetText {
    var title: String = ""
    var descr: String = ""
}






//КАРМИЧЕСКИЕ ПОКАЗАТЕЛИ
struct KarmPokaz {
    var items = [KarmPokazItem]()
}

struct KarmPokazItem {
    var title: String = ""
    var meaning: String = ""
}


//ЛУННЫЕ УЗЛЫ
struct LunUzel {
    var items = [LunUzelItem]()
}

struct LunUzelItem {
    var title: String = ""
    var meaning: String = ""
}


//ПАРС ФОРТУНЫ
struct ParsFortun {
    var items = [ParsFortunItem]()
}

struct ParsFortunItem {
    var title: String = ""
    var meaning: String = ""
}



//   ТАБЛИЦЫ

struct Tables {
    var tableOne = TableOne()
    var tableTwo = TableTwo()
    var tableThree = TableThree()
    var tableFour = TableFour()
}

//Таблица1
struct TableOne {
    var items = [TableOneItem]()
}

struct TableOneItem {
    var planet: String = ""
    var dolgota: String = ""
    var pozition: String = ""
}


//Таблица2
struct TableTwo {
    var items = [TableTwoItem]()
}

struct TableTwoItem {
    var doma: String = ""
    var dolgota: String = ""
}


//Таблица3
struct TableThree {
    var items = [TableThreeItem]()
}

struct TableThreeItem {
    var planet: String = ""
    var aspect: String = ""
    var planet2: String = ""
    var orb: String = ""
}


//Таблица4
struct TableFour {
    var items = [TableFourItem]()
}

struct TableFourItem {
    var konfig: String = ""
    var planet = [String]()
}



//КАРТИНКИ
struct ChartImages {
    var wheel: String = ""
    var grid: String = ""
}
