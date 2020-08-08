//
//  SwipeTextField.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 02.07.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class SwipeTextField: UITextField {
    
    convenience init(text: String) {
        self.init()
        
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 7
        self.attributedPlaceholder = NSAttributedString(string: text,
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)])
        self.layer.borderWidth = 1
        self.backgroundColor = .clear
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
