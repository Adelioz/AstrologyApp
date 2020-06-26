//
//  MainMenuViewController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 19.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    let logOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("LOG OUT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(logOutPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func logOutPressed() {
        let ac = UIAlertController(title: nil, message: "Вы точно хотите выйти?", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        ac.addAction(UIAlertAction(title: "Выйти", style: .destructive, handler: { (_) in
            do {
                try Auth.auth().signOut()
                UIApplication.shared.keyWindow?.rootViewController = RegistrationViewController()
            } catch {
                print("Ошибка при выходе: \(error.localizedDescription)")
            }
        }))
        present(ac, animated: true)
    }
    
    
    func setup() {
        view.addSubview(logOutButton)
        logOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logOutButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logOutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }

    

}
