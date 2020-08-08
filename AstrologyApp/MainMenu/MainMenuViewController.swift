//
//  MainMenuViewController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 29.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        view.addSubview(label)
//        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        label.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
//        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        
        view.backgroundColor = .white
        navigationItem.title = "Main"
        setupView()
    }
    

    let label: UILabel = {
        let label = UILabel()
        label.text = "Main"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let compButton: UIButton = {
        let button = UIButton()
        button.setTitle("Совместимость по знаку зодиака", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor(red: 96/255, green: 201/255, blue: 251/255, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .center
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 247/255, green: 252/255, blue: 255/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.addTarget(self, action: #selector(showSovmVC), for: .touchUpInside)
        return button
    }()
    
    @objc func showSovmVC() {
        navigationController?.pushViewController(SovmestimostVC(), animated: true)
        
    }
    
    let natalButton: UIButton = {
        let button = UIButton()
        button.setTitle("Расчет натальной карты", for: .normal)
        button.setTitleColor(UIColor(red: 253/255, green: 156/255, blue: 50/255, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .center
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 255/255, green: 249/255, blue: 242/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.addTarget(self, action: #selector(showNatalVC), for: .touchUpInside)
        return button
    }()
    
    @objc func showNatalVC() {
        navigationController?.pushViewController(NatalCardVC(), animated: true)
    }
    
    let numberButton: UIButton = {
        let button = UIButton()
        button.setTitle("Нумерологический прогноз", for: .normal)
        button.setTitleColor(UIColor(red: 96/255, green: 97/255, blue: 212/255, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .center
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 253/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.lightGray.cgColor
        //button.addTarget(self, action: #selector(showGeoVC), for: .touchUpInside)
        return button
    }()
    
    func setupView() {
        let buttonsStackView = UIStackView(arrangedSubviews: [compButton, natalButton, numberButton])
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.axis = .vertical
        buttonsStackView.spacing = 20
        
        view.addSubview(buttonsStackView)
        buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        buttonsStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        buttonsStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
                
        
    }
    
}
