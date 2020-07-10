//
//  SwipeTextField.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 02.07.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class SwipeTextField: UITextField {
    
    convenience init(color: UIColor) {
        self.init()
        
        self.borderStyle = .roundedRect
        self.backgroundColor = color
        self.font = UIFont.boldSystemFont(ofSize: 30)
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
