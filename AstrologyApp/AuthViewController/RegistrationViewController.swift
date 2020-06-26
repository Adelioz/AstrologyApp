//
//  RegistrationViewController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 19.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupGesture()
    }
    
    
    
    
    //MARK: First Layer setup (scrollView + left & right views)
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isPagingEnabled = true
        scroll.bounces = false
        scroll.backgroundColor = .white
        //scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    //MARK: UIViews (first layer)
    let helloView: UIView = {
        let view = UIView()
        //view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let registerView: UIView = {
        let view = UIView()
        //view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupView() {
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.contentSize = CGSize(width: (view.frame.width * 2), height: view.frame.height)
        
        scrollView.addSubview(helloView)
        helloView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        helloView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        helloView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        helloView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        
        scrollView.addSubview(registerView)
        registerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        registerView.leadingAnchor.constraint(equalTo: helloView.trailingAnchor).isActive = true
        registerView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        registerView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true

        setupHelloView()
        setupRegisterView()
        
    }
    
    
    //MARK: helloView setup
    
    let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать!"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let helloNextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func nextPage() {
        scrollView.setContentOffset(CGPoint(x: Int(view.frame.width), y: 0), animated: true)
    }
    
    func setupHelloView() {
        
        helloView.addSubview(helloLabel)
        helloLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        helloLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        helloLabel.topAnchor.constraint(equalTo: helloView.topAnchor, constant: 200).isActive = true
        
        helloView.addSubview(helloNextButton)
        helloNextButton.bottomAnchor.constraint(equalTo: helloView.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        helloNextButton.leadingAnchor.constraint(equalTo: helloView.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        helloNextButton.trailingAnchor.constraint(equalTo: helloView.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        helloNextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        helloNextButton.backgroundColor = .gray

    }
    
    
    //MARK: registerView setup
    
    let registerLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
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
    
    let confirmPassTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .yellow
        tf.placeholder = "Повторите пароль"
        tf.font = UIFont.boldSystemFont(ofSize: 20)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Далее", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        return button
    }()
    
    @objc func registerPressed() {
        AuthService.shared.register(email: loginTextField.text,
                                    password: passTextField.text,
                                    confirmPassword: confirmPassTextField.text!) { (result) in
                                        switch result {
                                            
                                        case .success(let user):
                                            self.showAlert(with: "Успешно!", and: "Вы зарегистрированы", completion: {
                                                self.present(SwipeViewController(currentUser: user), animated: true)
                                            })
                                        case .failure(let error):
                                            self.showAlert(with: "Ошибка", and: error.localizedDescription)
                                        }
        }
    }
    
    let alreadyOnboardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Уже есть аккаунт", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)//boldSystemFont(ofSize: 10)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(alreadyOnboardPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc func alreadyOnboardPressed() {
        present(LoginViewController(), animated: true)
    }
    
    func setupRegisterView() {
        registerView.addSubview(registerLabel)
        registerLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        registerLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        registerLabel.topAnchor.constraint(equalTo: helloView.topAnchor, constant: 100).isActive = true
        
        registerView.addSubview(loginTextField)
        loginTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        loginTextField.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 100).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: 50).isActive = true
        
        registerView.addSubview(passTextField)
        passTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        passTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 30).isActive = true
        passTextField.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: 50).isActive = true
        
        registerView.addSubview(confirmPassTextField)
        confirmPassTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        confirmPassTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        confirmPassTextField.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 30).isActive = true
        confirmPassTextField.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: 50).isActive = true
        
        registerView.addSubview(registerButton)
        registerButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        registerButton.topAnchor.constraint(equalTo: confirmPassTextField.bottomAnchor, constant: 100).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: registerView.centerXAnchor).isActive = true
        
        registerView.addSubview(alreadyOnboardButton)
        alreadyOnboardButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        alreadyOnboardButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        alreadyOnboardButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20).isActive = true
        alreadyOnboardButton.centerXAnchor.constraint(equalTo: registerView.centerXAnchor).isActive = true
    }

    
    
    
    
    
    
}



extension RegistrationViewController: UIGestureRecognizerDelegate {
    
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

extension RegistrationViewController {
    
    func showAlert(with title: String, and message: String, completion: @escaping () -> Void = {}) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            completion()
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
}
