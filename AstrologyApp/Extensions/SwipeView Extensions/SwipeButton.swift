//
//  SwipeButton.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 02.07.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class SwipeButton: UIButton {
    
    convenience init(color: UIColor) {
        self.init()
        
        self.setTitle("", for: .normal)
        self.contentHorizontalAlignment = .center
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = color
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        
        
    }
    
}
