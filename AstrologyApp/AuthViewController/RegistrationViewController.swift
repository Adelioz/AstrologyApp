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
        //view.backgroundColor = .red
        setupBackgroundImage()
        setupView()
        setupGesture()
        scrollView.delegate = self
        
        
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
    
    //MARK: First Layer setup (scrollView + left & right views)
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isPagingEnabled = true
        scroll.bounces = false
        scroll.backgroundColor = .clear
        //scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    //MARK: UIViews (first layer)
    let helloView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
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
        label.text = "Astrology Master"
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = .white
        label.font = UIFont(name: "LilitaOne", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    let helloText: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Lato-Regular", size: 18)
        label.text = "Узнайте много нового с помощью наших гороскопов, анализов совместимости, нумерологии и астрологического теста"
        label.textColor = .white
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.textAlignment = .left
        //label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let characterImage: UIImageView = {
        let im = UIImageView()
        im.image = #imageLiteral(resourceName: "character")
        im.contentMode = UIView.ContentMode.scaleAspectFill
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    let helloNextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Приступить", for: .normal)
        button.titleLabel?.font = UIFont(name: "Lato-Bold", size: 20)
        button.setTitleColor(.white, for: .normal)
        button.setGradientBackground(colorOne: .red, colorTwo: .gray)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func nextPage() {
        scrollView.setContentOffset(CGPoint(x: Int(view.frame.width), y: 0), animated: true)
    }
    
    func setupHelloView() {
        
        helloView.addSubview(helloLabel)
        helloLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        helloLabel.leadingAnchor.constraint(equalTo: helloView.leadingAnchor, constant: view.frame.width * 40/375).isActive = true
        helloLabel.trailingAnchor.constraint(equalTo: helloView.trailingAnchor, constant: -(view.frame.width * 58/375)).isActive = true
        helloLabel.topAnchor.constraint(equalTo: helloView.topAnchor, constant: view.frame.height * 100/812).isActive = true

        helloView.addSubview(helloText)
        helloText.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 25).isActive = true
        helloText.widthAnchor.constraint(equalTo: helloView.widthAnchor, multiplier: 295/375).isActive = true
        helloText.heightAnchor.constraint(equalTo: helloLabel.heightAnchor, multiplier: 80/40).isActive = true
        helloText.centerXAnchor.constraint(equalTo: helloView.centerXAnchor).isActive = true
        //helloText.backgroundColor = .red
        
        
        
        helloView.addSubview(helloNextButton)
        helloNextButton.bottomAnchor.constraint(equalTo: helloView.safeAreaLayoutGuide.bottomAnchor, constant: -(view.frame.height * 70/812)).isActive = true
        helloNextButton.centerXAnchor.constraint(equalTo: helloView.centerXAnchor).isActive = true
        helloNextButton.frame = CGRect(x: 0, y: 0, width: view.frame.width - 60 , height: view.frame.height * 56/812)
        helloNextButton.leadingAnchor.constraint(equalTo: helloView.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        helloNextButton.trailingAnchor.constraint(equalTo: helloView.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        helloNextButton.heightAnchor.constraint(equalToConstant: view.frame.height * 56/812).isActive = true
        print(view.frame)
        helloNextButton.setGradientBackground(colorOne: #colorLiteral(red: 0.568627451, green: 0.5607843137, blue: 0.9294117647, alpha: 1), colorTwo: #colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1))
        helloNextButton.layer.cornerRadius = helloNextButton.frame.size.height / 2
        helloNextButton.clipsToBounds = true
        
        

        helloView.addSubview(characterImage)


        //characterImage.heightAnchor.constraint(lessThanOrEqualTo: helloView.heightAnchor, multiplier: 280/812).isActive = true
        characterImage.centerXAnchor.constraint(equalTo: helloView.centerXAnchor).isActive = true
        characterImage.topAnchor.constraint(equalTo: helloText.bottomAnchor, constant: view.frame.height * 65/812).isActive = true//70).isActive = true
        characterImage.widthAnchor.constraint(equalTo: characterImage.heightAnchor, multiplier: 212/274).isActive = true
        characterImage.bottomAnchor.constraint(equalTo: helloNextButton.topAnchor, constant: -(view.frame.height * 70/812)).isActive = true//-80).isActive = true

    }
    
    
    //MARK: registerView setup
    //поле емейл оформить как вью с вложенными лейблом текстфилдом и полоской снизу
    //тест оформить как структуру и при каждом прохождении сравнивать результаты пользователя с эталоном
    
    let registerLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
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
    
    let confirmPassTextField: LineTextField = {
        let tf = LineTextField(titleText: "Повторите пароль")
        tf.backgroundColor = .clear
        //tf.placeholder = "Повторите пароль"
        tf.font = UIFont(name: "Lato-Bold", size: 14)
        tf.textColor = .white
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Зарегистрироваться", for: .normal)
        button.titleLabel?.font = UIFont(name: "Lato-Bold", size: 20)
        button.setTitleColor(.white, for: .normal)
        button.setGradientBackground(colorOne: .red, colorTwo: .gray)
        button.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func registerPressed() {
        AuthService.shared.register(email: loginTextField.text,
                                    password: passTextField.text,
                                    confirmPassword: confirmPassTextField.text!) { (result) in
                                        switch result {
                                            
                                        case .success(let user):
                                            self.showAlert(with: "Успешно!", and: "Вы зарегистрированы", completion: {
                                                let swipeVC = SwipeViewController(currentUser: user)
                                                swipeVC.modalTransitionStyle = .crossDissolve
                                                swipeVC.modalPresentationStyle = .overCurrentContext
                                                
                                                self.present(swipeVC, animated: true)
                                            })
                                        case .failure(let error):
                                            self.showAlert(with: "Ошибка", and: error.localizedDescription)
                                        }
        }
    }
    
    let alreadyOnboardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Уже есть аккаунт", for: .normal)
        button.titleLabel?.font = UIFont(name: "Lato-Bold", size: 11)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(alreadyOnboardPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc func alreadyOnboardPressed() {
        present(LoginViewController(), animated: true)
    }
    
    func setupRegisterView() {
//        registerView.addSubview(registerLabel)
//        registerLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        registerLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
//        registerLabel.topAnchor.constraint(equalTo: helloView.topAnchor, constant: 100).isActive = true
        
        registerView.addSubview(backgroundView)
        backgroundView.centerXAnchor.constraint(equalTo: registerView.centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: registerView.centerYAnchor, constant: 50).isActive = true
        backgroundView.heightAnchor.constraint(equalTo: registerView.heightAnchor, multiplier: 500/812).isActive = true
        backgroundView.widthAnchor.constraint(equalTo: registerView.widthAnchor, multiplier: 335/375).isActive = true
        
        let textFieldsStackView = UIStackView(arrangedSubviews: [loginTextField, passTextField, confirmPassTextField])
        textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        textFieldsStackView.axis = .vertical
        textFieldsStackView.distribution = .fillEqually
        textFieldsStackView.spacing = 30
        
        backgroundView.addSubview(textFieldsStackView)
        textFieldsStackView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 270/335).isActive = true
        textFieldsStackView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 220/430).isActive = true
        textFieldsStackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        textFieldsStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 30).isActive = true
        
        
        
        registerView.addSubview(registerLabel)
        registerLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        registerLabel.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: view.frame.width * 40/375).isActive = true
        registerLabel.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -(view.frame.width * 58/375)).isActive = true
        registerLabel.topAnchor.constraint(equalTo: registerView.topAnchor, constant: view.frame.height * 100/812).isActive = true
        
        backgroundView.addSubview(registerButton)
        registerButton.frame = CGRect(x: 0, y: 0, width: view.frame.width * 293/375, height: view.frame.height * 56/812)
        registerButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: view.frame.height * 56/812).isActive = true
        registerButton.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 293/335).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -30).isActive = true
        registerButton.setGradientBackground(colorOne: #colorLiteral(red: 0.568627451, green: 0.5607843137, blue: 0.9294117647, alpha: 1), colorTwo: #colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1))
        registerButton.layer.cornerRadius = registerButton.frame.height / 2
        registerButton.clipsToBounds = true
        
        backgroundView.addSubview(alreadyOnboardButton)
        alreadyOnboardButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        alreadyOnboardButton.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: 20).isActive = true
        alreadyOnboardButton.trailingAnchor.constraint(equalTo: textFieldsStackView.trailingAnchor).isActive = true
    }

    
    
    
    
    
    
}



extension RegistrationViewController: UIGestureRecognizerDelegate, UIScrollViewDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        hideKeyboardOnSwipe()
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
