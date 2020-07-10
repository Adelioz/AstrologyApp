//
//  SwipeDatePicker.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 02.07.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class SwipeDatePicker: UIDatePicker {
    
    convenience init(mode: UIDatePicker.Mode) {
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.datePickerMode = mode
        self.locale = Locale(identifier: "ru_RU")
    }
    
}
