//
//  LineInfoView.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 30.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class LineInfoView: UIView {
    
    convenience init(leftLabelText: String, rightLabelText: String, topLine: Bool) {
        self.init()
        
        let leftLabel = UILabel()
        leftLabel.text = leftLabelText
        leftLabel.font = UIFont.systemFont(ofSize: 15)
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(leftLabel)
        
        let rightLabel = UITextField()
        rightLabel.text = rightLabelText
        rightLabel.font = UIFont.systemFont(ofSize: 15)
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(rightLabel)
        
        let stackView = UIStackView(arrangedSubviews: [leftLabel, rightLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor)])
        
        
        
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
