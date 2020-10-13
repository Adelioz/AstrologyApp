//
//  SignCollectionViewCell.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 08.09.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class SignCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "sign"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        //contentView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        
        addSubview(signView)
        signView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        signView.widthAnchor.constraint(equalToConstant: 65).isActive = true
        signView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        signView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        signView.layer.cornerRadius = 10
        signView.clipsToBounds = true
        
        addSubview(sign)
        sign.centerYAnchor.constraint(equalTo: signView.centerYAnchor).isActive = true
        sign.centerXAnchor.constraint(equalTo: signView.centerXAnchor).isActive = true
        sign.heightAnchor.constraint(equalToConstant: 40).isActive = true
        sign.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        addSubview(label)
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        label.topAnchor.constraint(equalTo: signView.bottomAnchor).isActive = true
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Sign View
    
    let signView: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: "signCollectionCell")
        im.translatesAutoresizingMaskIntoConstraints = false
        im.contentMode = .scaleAspectFill
        im.layer.cornerRadius = 10
        im.alpha = 0.5
        return im
    }()
    
    func setupSignView() {
        
        self.contentView.addSubview(signView)
        signView.frame = self.contentView.bounds
        signView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        signView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        signView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        signView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        
        
    }
    
    var select = false
    
    
    func selectRow(image: UIImage) {
        
//        signView.tintColor = .white
        signView.image = UIImage(named: "signCollectionCellSelected")
        signView.alpha = 1.0
        sign.image = image.tintedWithLinearGradientColors(colorsArr: [#colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1), #colorLiteral(red: 0.568627451, green: 0.5607843137, blue: 0.9294117647, alpha: 1)])
        sign.alpha = 1.0
        //select = true
                
    }
    
    func deselectRow(image: UIImage) {
        
        signView.image = UIImage(named: "signCollectionCell")
        signView.alpha = 0.5
        sign.image = image.tintedWithLinearGradientColors(colorsArr: [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        sign.alpha = 0.75
        //select = false
    }
    
    //MARK: - Sign Image
    
    let sign: UIImageView = {
        let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        im.tintColor = .white
        im.alpha = 0.75
        im.contentMode = .scaleAspectFill
        return im
    }()
    
    func setupSignImage() {
        
        signView.addSubview(sign)
        sign.centerYAnchor.constraint(equalTo: signView.centerYAnchor).isActive = true
        sign.centerXAnchor.constraint(equalTo: signView.centerXAnchor).isActive = true
        sign.heightAnchor.constraint(equalToConstant: 40).isActive = true
        sign.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    //MARK: - Label
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Скорпион"
        label.textAlignment = .center
        label.font = UIFont(name: "Lato-Bold", size: 12)
        label.textColor = .white
        return label
    }()
    
    func setupLabel() {
        addSubview(label)
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 10).isActive = true
        label.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }
    

    
}


