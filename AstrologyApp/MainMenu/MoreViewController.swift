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
        
        setupBackgroundImage()
        setupTitleLabel()
        setupUserInfoButton()
        
        //view.backgroundColor = .white
        //setupButton()
        //setupBottomView()
    }
    
    
    //MARK: - Background Image
    func setupBackgroundImage() {
        let image = UIImageView()
        image.image = UIImage(named: "main_background")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(image)
        image.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    //MARK: - More Title Label
    
    let moreLabel = SwipeLabel(with: "Еще")
    func setupTitleLabel() {
        view.addSubview(moreLabel)
        moreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height * 50/812).isActive = true
        moreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width * 16/375).isActive = true
    }
    
    //MARK: - User Info Button
    
    let userInfoButton: UIButton = {
        let button = UIButton()
        //button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(userInfoButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func userInfoButtonTapped() {
        print(#function)
        navigationController?.pushViewController(UserInfoViewController(), animated: true)
    }
    
    func setupUserInfoButton() {
        view.addSubview(userInfoButton)
        userInfoButton.frame = CGRect(x: 0, y: 0, width: view.frame.width * 335/375, height: view.frame.width * 134/375)
        userInfoButton.setGradientBackground(colorOne: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.05), colorTwo: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.02), horizontal: false)
        userInfoButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 335/375).isActive = true
        userInfoButton.heightAnchor.constraint(equalTo: userInfoButton.widthAnchor, multiplier: 134/335).isActive = true
        userInfoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userInfoButton.topAnchor.constraint(equalTo: moreLabel.bottomAnchor, constant: 30).isActive = true
        userInfoButton.layer.cornerRadius = 7
        userInfoButton.clipsToBounds = true
        
        setupIconView()
    }
    
    //MARK: - Info Button Views
    
    let iconView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let signIcon: UIImageView = {
        let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        im.contentMode = .scaleAspectFill
        im.image = UIImage(named: "moreTestIcon")
        return im
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Lato-Bold", size: 21)
        label.text = "Александр"
        label.textColor = #colorLiteral(red: 0.5529411765, green: 0.5450980392, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buttonPath: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: "moreButtonPath")
        //im.contentMode = .scaleAspectFill
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    func setupIconView() {
        userInfoButton.addSubview(iconView)
        iconView.frame = CGRect(x: 0, y: 0, width: userInfoButton.frame.height * 97/134, height: userInfoButton.frame.height * 97/134)
        iconView.clipsToBounds = true
        iconView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.05)
        iconView.heightAnchor.constraint(equalTo: userInfoButton.heightAnchor, multiplier: 97/134).isActive = true
        iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor).isActive = true
        iconView.centerYAnchor.constraint(equalTo: userInfoButton.centerYAnchor).isActive = true
        iconView.leadingAnchor.constraint(equalTo: userInfoButton.leadingAnchor, constant: (userInfoButton.frame.height - iconView.frame.height) / 2).isActive = true
        iconView.layer.cornerRadius = iconView.frame.width / 2
        
        iconView.addSubview(signIcon)
        signIcon.centerXAnchor.constraint(equalTo: iconView.centerXAnchor).isActive = true
        signIcon.centerYAnchor.constraint(equalTo: iconView.centerYAnchor).isActive = true
        signIcon.heightAnchor.constraint(equalTo: iconView.heightAnchor, multiplier: 40/97).isActive = true
        signIcon.widthAnchor.constraint(equalTo: iconView.widthAnchor, multiplier: 40/97).isActive = true
        
        userInfoButton.addSubview(nameLabel)
        nameLabel.centerYAnchor.constraint(equalTo: userInfoButton.centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: (userInfoButton.frame.height - iconView.frame.height) / 2).isActive = true
        
        userInfoButton.addSubview(buttonPath)
        buttonPath.centerYAnchor.constraint(equalTo: userInfoButton.centerYAnchor).isActive = true
        buttonPath.trailingAnchor.constraint(equalTo: userInfoButton.trailingAnchor, constant: -(userInfoButton.frame.height - iconView.frame.height) / 2).isActive = true
        buttonPath.heightAnchor.constraint(equalTo: userInfoButton.heightAnchor, multiplier: 21/134).isActive = true
        buttonPath.widthAnchor.constraint(equalTo: buttonPath.heightAnchor, multiplier: 12/21).isActive = true
        
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
