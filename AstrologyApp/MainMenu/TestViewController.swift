//
//  TestViewController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 29.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(label)
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        
        view.backgroundColor = .white
        navigationItem.title = "Test"
    }
    
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

}
