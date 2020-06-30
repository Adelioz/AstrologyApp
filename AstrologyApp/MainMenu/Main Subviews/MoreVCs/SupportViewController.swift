//
//  SupportViewController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 30.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class SupportViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "Написать в техподдержку"
        
        setupTextView()
        
    }
    
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .lightGray
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    func setupTextView() {
        view.addSubview(textView)
        textView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        textView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
    }
    
    



}
