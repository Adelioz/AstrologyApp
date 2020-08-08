//
//  MoreViewController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 29.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "More"
        setupButton()
        setupBottomView()
    }
    
    let userInfoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(userInfoButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func userInfoButtonTapped() {
        print(#function)
        navigationController?.pushViewController(UserInfoViewController(), animated: true)
    }
    
    let userImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let userLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupButton() {
        view.addSubview(userInfoButton)
        userInfoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        userInfoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        userInfoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        userInfoButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        userInfoButton.backgroundColor = .green
        
        
        userInfoButton.addSubview(userImage)
        userInfoButton.addSubview(userLabel)
        
        userImage.widthAnchor.constraint(equalTo: userInfoButton.heightAnchor, multiplier: 0.7).isActive = true
        userImage.heightAnchor.constraint(equalTo: userInfoButton.heightAnchor, multiplier: 0.7).isActive = true
        userImage.leadingAnchor.constraint(equalTo: userInfoButton.leadingAnchor, constant: 20).isActive = true
        userImage.centerYAnchor.constraint(equalTo: userInfoButton.centerYAnchor).isActive = true
        
        userLabel.centerYAnchor.constraint(equalTo: userInfoButton.centerYAnchor).isActive = true
        userLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 20).isActive = true
        userLabel.trailingAnchor.constraint(equalTo: userInfoButton.trailingAnchor, constant: 30).isActive = true
    }
    
    let aboutButton = LineButton(labelText: "О приложении", topLine: false)
    let supportButton = LineButton(labelText: "Написать в техподдержку", topLine: false)
    
    @objc func aboutButtonPressed() {
        navigationController?.pushViewController(AboutViewController(), animated: true)
    }
    
    @objc func supportButtonPressed() {
        navigationController?.pushViewController(SupportViewController(), animated: true)
    }
    
    func setupBottomView() {
        aboutButton.addTarget(self, action: #selector(aboutButtonPressed), for: .touchUpInside)
        supportButton.addTarget(self, action: #selector(supportButtonPressed), for: .touchUpInside)
        
        let bottomView = UIStackView(arrangedSubviews: [aboutButton, supportButton])
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.distribution = .fillEqually
        bottomView.axis = .vertical
        view.addSubview(bottomView)
        
        
        bottomView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/9).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        
    }
    
    

}
