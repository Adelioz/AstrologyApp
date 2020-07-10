//
//  SwipeLabelExtension.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 02.07.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class SwipeLabel: UILabel {
    
    convenience init(with text: String) {
        self.init()
        
        self.text = text
        self.textAlignment = .center
        self.font = UIFont.boldSystemFont(ofSize: 30)
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
