//
//  TextFieldInfo.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 02.07.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class TextFieldInfo: UITextField {
    convenience init(font: UIFont) {
        self.init()
        
        self.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
}

