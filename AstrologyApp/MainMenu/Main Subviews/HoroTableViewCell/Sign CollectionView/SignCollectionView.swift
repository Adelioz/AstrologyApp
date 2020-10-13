//
//  SignCollectionView.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 10.09.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

protocol UpdateHoroDelegate {
    func updateHoro(indexPath: IndexPath)
}

class SignCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cells = SignCellModel.fetchSign()

    var updateHoroDelegate: UpdateHoroDelegate!
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 65, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 35, bottom: 20, right: 20)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.showsHorizontalScrollIndicator = false
        
        delegate = self
        dataSource = self
        
        register(SignCollectionViewCell.self, forCellWithReuseIdentifier: SignCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: SignCollectionViewCell.reuseId, for: indexPath) as! SignCollectionViewCell
        
                
        cell.backgroundColor = .clear
        cell.label.text = cells[indexPath.row].name
        cell.sign.image = cells[indexPath.row].image
        if cell.isSelected {
            cell.selectRow(image: cells[indexPath.row].image)
        } else {
            cell.deselectRow(image: cells[indexPath.row].image)
        }

        
        return cell 
    }
    
    
}

extension SignCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SignCollectionViewCell {
            cell.selectRow(image: cells[indexPath.row].image)
            updateHoroDelegate.updateHoro(indexPath: indexPath)
            cell.select = true
            print(indexPath.row)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SignCollectionViewCell {
            cell.deselectRow(image: cells[indexPath.row].image)
            cell.select = false
        }
    }
}
