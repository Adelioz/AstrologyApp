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
        self.textAlignment = .left
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
        self.textColor = .white
        self.font = UIFont(name: "GothamProNarrow-Bold", size: 40)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
}
