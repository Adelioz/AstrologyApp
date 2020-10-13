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

        setupBackgroundImage()
        setupView()
        setupGesture()
    }
    
    func setupBackgroundImage() {
        let image = UIImageView()
        image.image = UIImage(named: "authorization_background")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(image)
        image.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    

    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.textAlignment = .left
        label.font = UIFont(name: "GothamProNarrow-Bold", size: 40)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        view.layer.cornerRadius = 7
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let loginTextField: LineTextField = {
        let tf = LineTextField(titleText: "E-mail")
        tf.backgroundColor = .clear
        tf.font = UIFont(name: "Lato-Bold", size: 14)
        tf.textColor = .white
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passTextField: LineTextField = {
        let tf = LineTextField(titleText: "Пароль")
        tf.backgroundColor = .clear
        tf.font = UIFont(name: "Lato-Bold", size: 14)
        tf.textColor = .white
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Вход", for: .normal)
        button.titleLabel?.font = UIFont(name: "Lato-Bold", size: 20)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func loginPressed() {
        AuthService.shared.login(email: loginTextField.text,
                                 password: passTextField.text) { (result) in
                                    switch result {
                                        
                                    case .success(let user):
                                        self.showAlert(with: "Успешно!", and: "Вы авторизированы", completion: {
                                            FirestoreService.shared.getUserData(user: user, completion: { (result) in
                                                switch result {
                                                    
                                                case .success(let muser):
                                                    UserSettings.shared.saveProfile(name: muser.name,
                                                                                    birthPlace: muser.birthPlace,
                                                                                    birthTimestamp: muser.birthTimestamp,
                                                                                    sex: muser.sex,
                                                                                    mail: muser.email,
                                                                                    isEdited: muser.isEdited)
                                                    let mainTBC = MainTabBarController()
                                                    mainTBC.modalTransitionStyle = .crossDissolve
                                                    mainTBC.modalPresentationStyle = .overCurrentContext
                                                    self.present(mainTBC, animated: true)
                                                case .failure(_):
                                                    let swipeVC = SwipeViewController(currentUser: user)
                                                    swipeVC.modalTransitionStyle = .crossDissolve
                                                    swipeVC.modalPresentationStyle = .overCurrentContext
                                                    self.present(swipeVC, animated: true)
                                                }
                                            })
                                            
                                        })
                                    case .failure(let error):
                                        self.showAlert(with: "Ошибка", and: error.localizedDescription)
                                    }
        }
    }
    
    let toRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Перейти к регистрации", for: .normal)
        button.titleLabel?.font = UIFont(name: "Lato-Bold", size: 11)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(toRegisterButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func toRegisterButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        
        view.addSubview(backgroundView)
        backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 400/812).isActive = true
        backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 335/375).isActive = true
        
        let textFieldsStackView = UIStackView(arrangedSubviews: [loginTextField, passTextField])
        textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        textFieldsStackView.axis = .vertical
        textFieldsStackView.distribution = .fillEqually
        textFieldsStackView.spacing = 30
        
        backgroundView.addSubview(textFieldsStackView)
        textFieldsStackView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 270/335).isActive = true
        textFieldsStackView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 150/399).isActive = true
        textFieldsStackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        textFieldsStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: view.frame.height * 68/812).isActive = true
        //textFieldsStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 100).isActive = true
        
        view.addSubview(loginLabel)
        loginLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width * 40/375).isActive = true
        loginLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width * 58/375)).isActive = true
        loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 100/812).isActive = true
        
//        view.addSubview(loginTextField)
//        loginTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        loginTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
//        loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 100).isActive = true
//        loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
//
//        view.addSubview(passTextField)
//        passTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        passTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
//        passTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 30).isActive = true
//        passTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 0, y: 0, width: view.frame.width * 293/375, height: view.frame.height * 56/812)
        loginButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: view.frame.height * 56/812).isActive = true
        print("kjnckwn     \(60 / view.frame.height)")
        print("jncekjnek   \(view.frame.height) efkenfekj    \(view.layer)")
        loginButton.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 293/335).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -30).isActive = true
        loginButton.setGradientBackground(colorOne: #colorLiteral(red: 0.568627451, green: 0.5607843137, blue: 0.9294117647, alpha: 1), colorTwo: #colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1), horizontal: true)
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        loginButton.clipsToBounds = true
        
        view.addSubview(toRegisterButton)
        toRegisterButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        toRegisterButton.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: 20).isActive = true
        toRegisterButton.trailingAnchor.constraint(equalTo: textFieldsStackView.trailingAnchor).isActive = true
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

extension LoginViewController {
    func showAlert(with title: String, and message: String, completion: @escaping () -> Void = {}) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            completion()
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
