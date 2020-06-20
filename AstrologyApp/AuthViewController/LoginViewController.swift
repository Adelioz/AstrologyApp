//
//  LoginViewController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 20.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupView()
        setupGesture()
    }
    

    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loginTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .yellow
        tf.placeholder = "Введите адрес вашей почты"
        tf.font = UIFont.boldSystemFont(ofSize: 20)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .yellow
        tf.placeholder = "Введите пароль"
        tf.font = UIFont.boldSystemFont(ofSize: 20)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Далее", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        return button
    }()
    
    @objc func loginPressed() {
        
    }
    
    let toRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Перейти к регистрации", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)//boldSystemFont(ofSize: 10)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(toRegisterButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc func toRegisterButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        view.addSubview(loginLabel)
        loginLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        loginLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        view.addSubview(loginTextField)
        loginTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 100).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        view.addSubview(passTextField)
        passTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        passTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 30).isActive = true
        passTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        view.addSubview(loginButton)
        loginButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loginButton.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 100).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(toRegisterButton)
        toRegisterButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        toRegisterButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        toRegisterButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
        toRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}

extension LoginViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func setupGesture() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipe))
        swipeDown.delegate = self
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        view.addGestureRecognizer(swipeDown)
    }
    
    @objc func hideKeyboardOnSwipe() {
        view.endEditing(true)
    }
}

extension LoginViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        hideKeyboardOnSwipe()
    }
}
