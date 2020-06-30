//
//  AboutViewController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 30.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "О приложении"
        
        view.addSubview(label)
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        
    }
    
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "About"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    



}
