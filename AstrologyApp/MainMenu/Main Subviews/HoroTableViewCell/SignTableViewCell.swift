//
//  SignTableViewCell.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 07.09.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class SignTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupSign() {
        //selectionStyle = .none
        backgroundColor = .clear
        //setupView()
        setupCollectionView()
        
    }
    
    //MARK: - Background View
    
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupView() {
        addSubview(view)
        view.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        view.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        //view.backgroundColor = .green
    }
    
    //MARK: - Collection View
    
    public var collection = SignCollectionView()
    
    func setupCollectionView() {
        addSubview(collection)
        collection.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collection.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
