//
//  LineTextField.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 02.08.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import Foundation
import UIKit

class LineTextField: UITextField {
    
    convenience init(titleText: String) {
        self.init()
        
        
        
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = titleText
        title.textColor = .white
        title.alpha = 0.5
        title.font = UIFont(name: "Lato-Bold", size: 14)
        self.addSubview(title)
        
        title.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 7).isActive = true
        
        var bottomView = UIView()
        bottomView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = .white
        self.addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 1)
            ])
        
    }
    
    let padding = UIEdgeInsets(top: 10, left: 15, bottom: -5, right: 0)
    
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
