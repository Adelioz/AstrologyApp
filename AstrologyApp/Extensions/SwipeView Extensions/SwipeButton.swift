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
        self.contentHorizontalAlignment = .left
        self.setAttributedTitle(NSAttributedString(string: "Ваш год рождения",
                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5),
                                                           NSAttributedString.Key.font: UIFont(name: "Lato-Bold", size: 16)]), for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.layer.cornerRadius = 7
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1.5
        
        self.layer.borderColor = UIColor.lightGray.cgColor
        
        
    }
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        return contentRect.inset(by: padding)
    }
    
}
