//
//  LineInfoView.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 30.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class LineInfoView: UIView {
    
    convenience init(leftLabelText: String, topLine: Bool) {
        self.init()
        
        let leftLabel = UILabel()
        leftLabel.text = leftLabelText
        leftLabel.font = UIFont.systemFont(ofSize: 15)
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(leftLabel)
        
        NSLayoutConstraint.activate([
            leftLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            leftLabel.heightAnchor.constraint(equalTo: self.heightAnchor),
            leftLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)])

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
    
}
