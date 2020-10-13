//
//  LineButton.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 29.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class LineButton: UIButton {
    
    convenience init(labelText: String, topLine: Bool) {
        self.init()
        
        
        let label = UILabel()
        label.text = labelText
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20)])
        
        
        var bottomView = UIView()
        bottomView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = .lightGray
        self.addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 1)
            ])
        
        if topLine {
            var topView = UIView()
            topView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
            topView.translatesAutoresizingMaskIntoConstraints = false
            topView.backgroundColor = .lightGray
            self.addSubview(topView)
            
            NSLayoutConstraint.activate([
                topView.topAnchor.constraint(equalTo: self.topAnchor),
                topView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                topView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                topView.heightAnchor.constraint(equalToConstant: 1)
                ])
        }

        
    }
    
    
    convenience init(labelText: String) {
        self.init()
        
        let label = UILabel()
        label.text = labelText
        label.font = UIFont(name: "Lato-Bold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(label)
        NSLayoutConstraint.activate([
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
        
        
        var line = UIView()
        line = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .white
        
        self.addSubview(line)
        NSLayoutConstraint.activate([
        line.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 1),
        line.leadingAnchor.constraint(equalTo: label.leadingAnchor),
        line.trailingAnchor.constraint(equalTo: label.trailingAnchor),
        line.heightAnchor.constraint(equalToConstant: 1)
        ])
        
    }
    
}
