//
//  HoroTableViewCell.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 05.09.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

protocol GrowingCellProtocol: class {
    func updateHeightOfRow(_ cell: HoroTableViewCell, textView: UITextView)
}

class HoroTableViewCell: UITableViewCell {

    weak var cellDelegate: GrowingCellProtocol?
    
    let gradientLayer = CAGradientLayer()
    
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: self.layer)
        gradientLayer.frame = view.bounds
        
        let colorSet = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1),
                        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.05)]
        let location = [0.0, 1.0]
        
        view.addGradient(with: gradientLayer, colorSet: colorSet, locations: location)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        textView.delegate = self
    }
    
    func setup(frameWidth: CGFloat) {
        selectionStyle = .none
        backgroundColor = .clear
        
        setupView(frameWidth: frameWidth)
        setupIcon()
        setupLabel()
        setupTextView()
    }
    
    //MARK: - Background View
    
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
    
    func setupView(frameWidth: CGFloat) {
        self.addSubview(view)
        view.frame = CGRect(x: 0, y: 0, width: frameWidth, height: 4)
        view.clipsToBounds = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        view.widthAnchor.constraint(equalToConstant: frameWidth).isActive = true
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //view.setGradientBackground(colorOne: UIColor(red: 1, green: 1, blue: 1, alpha: 0.1), colorTwo: UIColor(red: 1, green: 1, blue: 1, alpha: 0.05), horizontal: false)
    }
    
    //MARK: - Icon View
    
    let icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .green
        return image
    }()
    
    func setupIcon() {
        view.addSubview(icon)
        icon.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        icon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    //MARK: - Label
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Lato-Bold", size: 18)
        label.textColor = #colorLiteral(red: 0.5529411765, green: 0.5450980392, blue: 1, alpha: 1)
        label.text = "Любовь"
        return label
    }()
    
    func setupLabel() {
        view.addSubview(label)
        //label.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10).isActive = true
        label.bottomAnchor.constraint(equalTo: icon.bottomAnchor).isActive = true
    }
    
    //MARK: - Text View
    
    let textView: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont(name: "Lato-Regular", size: 14)
        text.textColor = .white
        text.backgroundColor = .clear
        text.isEditable = false
        text.isScrollEnabled = false
        text.text = "Загрузка..."
        return text
    }()
    
    func setupTextView() {
        view.addSubview(textView)
        textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        //textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        textView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 284/335).isActive = true
        textView.leadingAnchor.constraint(equalTo: label.leadingAnchor).isActive = true
        //textView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1)
//        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HoroTableViewCell: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if let delegate = cellDelegate {
            delegate.updateHeightOfRow(self, textView: textView)
        }
    }
}
