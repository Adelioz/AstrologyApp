//
//  SignChooseCell.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 08.10.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class SignChooseCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup() {
        setupIcon()
        setupLabel()
    }
    
    //MARK: - Sign Icon
    
    let icon: UIImageView = {
        let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    func setupIcon() {
        self.addSubview(icon)
        icon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
        icon.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 35/55).isActive = true
        icon.widthAnchor.constraint(equalTo: icon.heightAnchor).isActive = true
    }
    
    //MARK: - Label
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Lato-Bold", size: 16)
        label.textColor = #colorLiteral(red: 0.5529411765, green: 0.5450980392, blue: 1, alpha: 1)
        label.text = "Текст"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupLabel() {
        self.addSubview(label)
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20).isActive = true
    }

}
