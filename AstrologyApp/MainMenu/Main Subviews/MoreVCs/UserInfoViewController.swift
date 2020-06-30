//
//  UserInfoViewController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 30.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "Настройка профиля"
        
        setupImage()
        setupStackView()
        // Do any additional setup after loading the view.
    }
    

    let userImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "user"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    func setupImage() {
        view.addSubview(userImage)
        userImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        userImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        userImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    let nameCell = LineInfoView(leftLabelText: "Имя", rightLabelText: "Адель", topLine: true)
    let dateCell = LineInfoView(leftLabelText: "Дата рождения", rightLabelText: "17.09.99", topLine: false)
    let timeCell = LineInfoView(leftLabelText: "Время рождения", rightLabelText: "12.00", topLine: false)
    let sexCell = LineInfoView(leftLabelText: "Пол", rightLabelText: "Мужской", topLine: false)
    let placeCell = LineInfoView(leftLabelText: "Город", rightLabelText: "Казань", topLine: false)
    
    func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [nameCell, dateCell, timeCell, sexCell, placeCell])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        stackView.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 50).isActive = true
        
    }
    

}
