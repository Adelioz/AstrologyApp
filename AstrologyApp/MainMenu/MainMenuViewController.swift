//
//  MainMenuViewController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 29.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackgroundImage()
        setupNavigationController()
        view.backgroundColor = .white
        //navigationItem.title = "Main"
        setupButtonsView()
        
        //setupView()
    }
    
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
    
    //MARK: - Navigation Controller
    
    func setupNavigationController() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
        menuBtn.setImage(UIImage(named:"pathBack"), for: .normal)
        //menuBtn.addTarget(self, action: #selector(leftItemTapped), for: .touchUpInside)
//        let menuBarItem = UIBarButtonItem(customView: menuBtn)
//        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 25).isActive = true
//        menuBarItem.customView?.widthAnchor.constraint(equalTo: menuBarItem.customView!.heightAnchor, multiplier: 10/21).isActive = true
//        navigationItem.backBarButtonItem = menuBarItem
        
        //navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage(named: "pathBack"), style: .plain, target: nil, action: nil)
        //navigationItem.backBarButtonItem?.tintColor = .white
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .white
//        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "pathBack")
//        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "pathBack")
    }

    
    //MARK: - sovmestViewButton
    let sovmestViewButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        view.addTarget(self, action: #selector(showSovmest), for: .touchUpInside)
        return view
    }()
    
    @objc func showSovmest() {
        print(#function)
        let sovmVC = SovmestimostVC()//SovmestimostSecondVC()
//        let navC = UINavigationController(rootViewController: sovmVC)
//        navC.modalTransitionStyle = .crossDissolve
//        navC.modalPresentationStyle = .currentContext
        //self.present(sovmVC, animated: true)
        self.show(sovmVC, sender: nil)
        
    }
    
    let sovmestIconImageView: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: "sovmestButton")
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    let sovmestLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Lato-Bold", size: 14)
        label.text = "Совместимость по знаку зодиака"
        label.textColor = #colorLiteral(red: 0.5529411765, green: 0.5450980392, blue: 1, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let sovmestLineImageView: UIImageView = {
        let im = UIImageView()
        //im.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        im.image = UIImage(named: "sovmestLine")
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    func setupSovmestViewButton() {
        sovmestViewButton.addSubview(sovmestIconImageView)
        sovmestIconImageView.leadingAnchor.constraint(equalTo: sovmestViewButton.leadingAnchor).isActive = true
        sovmestIconImageView.topAnchor.constraint(equalTo: sovmestViewButton.topAnchor).isActive = true
        sovmestIconImageView.widthAnchor.constraint(equalTo: sovmestViewButton.widthAnchor, multiplier: 80/114).isActive = true
        sovmestIconImageView.heightAnchor.constraint(equalTo: sovmestIconImageView.widthAnchor).isActive = true
        
        sovmestViewButton.addSubview(sovmestLabel)
        sovmestLabel.topAnchor.constraint(equalTo: sovmestIconImageView.bottomAnchor).isActive = true
        sovmestLabel.centerXAnchor.constraint(equalTo: sovmestViewButton.centerXAnchor).isActive = true
        sovmestLabel.widthAnchor.constraint(equalTo: sovmestViewButton.widthAnchor).isActive = true
        sovmestLabel.heightAnchor.constraint(equalTo: sovmestViewButton.heightAnchor, multiplier: 34/229).isActive = true
        
        sovmestViewButton.addSubview(sovmestLineImageView)
        sovmestLineImageView.topAnchor.constraint(equalTo: sovmestLabel.bottomAnchor).isActive = true
        sovmestLineImageView.trailingAnchor.constraint(equalTo: sovmestViewButton.trailingAnchor).isActive = true
        sovmestLineImageView.widthAnchor.constraint(equalTo: sovmestViewButton.widthAnchor, multiplier: 49/114).isActive = true
        sovmestLineImageView.heightAnchor.constraint(equalTo: sovmestLineImageView.widthAnchor, multiplier: 98/46).isActive = true
        //sovmestLineImageView.heightAnchor.constraint(equalTo: sovmestViewButton.heightAnchor, multiplier: 101/229).isActive = true
        //46/98
        
    }
    
    
    //MARK: - natalViewButton
    let natalViewButton: UIButton = {
        let view = UIButton()
        //view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let natalIconImageView: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: "natalButton")
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    let natalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Lato-Bold", size: 14)
        label.text = "Рассчет натальной карты"
        label.textColor = #colorLiteral(red: 0.5529411765, green: 0.5450980392, blue: 1, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let natalLineImageView: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: "natalLine")
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    func setupNatalViewButton() {
        natalViewButton.addSubview(natalIconImageView)
        natalIconImageView.leadingAnchor.constraint(equalTo: natalViewButton.leadingAnchor).isActive = true
        natalIconImageView.topAnchor.constraint(equalTo: natalViewButton.topAnchor).isActive = true
        natalIconImageView.heightAnchor.constraint(equalTo: natalViewButton.heightAnchor, multiplier: 80/122).isActive = true
        natalIconImageView.widthAnchor.constraint(equalTo: natalIconImageView.heightAnchor).isActive = true
        
        natalViewButton.addSubview(natalLabel)
        natalLabel.topAnchor.constraint(equalTo: natalIconImageView.bottomAnchor).isActive = true
        natalLabel.leadingAnchor.constraint(equalTo: natalViewButton.leadingAnchor).isActive = true
        natalLabel.bottomAnchor.constraint(equalTo: natalViewButton.bottomAnchor).isActive = true
        natalLabel.widthAnchor.constraint(equalTo: natalViewButton.widthAnchor, multiplier: 118/187).isActive = true
        
        natalViewButton.addSubview(natalLineImageView)
        natalLineImageView.centerYAnchor.constraint(equalTo: natalIconImageView.centerYAnchor).isActive = true
        natalLineImageView.leadingAnchor.constraint(equalTo: natalIconImageView.trailingAnchor, constant: 10).isActive = true
        natalLineImageView.trailingAnchor.constraint(equalTo: natalViewButton.trailingAnchor).isActive = true
        //natalLineImageView.heightAnchor.constraint(equalTo: natalViewButton.heightAnchor, multiplier: 101/229).isActive = true
    }
    
    
    //MARK: - numerViewButton
    
    let numerViewButton: UIButton = {
        let view = UIButton()
        //view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let numerIconImageView: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: "numerButton")
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    let numerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Lato-Bold", size: 14)
        label.text = "Нумерологический прогноз"
        label.textColor = #colorLiteral(red: 0.5529411765, green: 0.5450980392, blue: 1, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let numerLineImageView: UIImageView = {
        let im = UIImageView()
        //im.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        im.image = UIImage(named: "numerLine")
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    func setupNumerViewButton() {
        numerViewButton.addSubview(numerLabel)
        numerLabel.bottomAnchor.constraint(equalTo: numerViewButton.bottomAnchor).isActive = true
        numerLabel.widthAnchor.constraint(equalTo: numerViewButton.widthAnchor).isActive = true
        numerLabel.centerXAnchor.constraint(equalTo: numerViewButton.centerXAnchor).isActive = true
        numerLabel.heightAnchor.constraint(equalTo: numerViewButton.heightAnchor, multiplier: 34/231).isActive = true
        
        numerViewButton.addSubview(numerIconImageView)
        numerIconImageView.bottomAnchor.constraint(equalTo: numerLabel.topAnchor).isActive = true
        numerIconImageView.leadingAnchor.constraint(equalTo: numerViewButton.leadingAnchor).isActive = true
        numerIconImageView.widthAnchor.constraint(equalTo: numerViewButton.widthAnchor, multiplier: 80/130).isActive = true
        numerIconImageView.heightAnchor.constraint(equalTo: numerIconImageView.widthAnchor).isActive = true
        
        numerViewButton.addSubview(numerLineImageView)
        numerLineImageView.topAnchor.constraint(equalTo: numerViewButton.topAnchor).isActive = true
        numerLineImageView.bottomAnchor.constraint(equalTo: numerIconImageView.topAnchor, constant: -10).isActive = true
        numerLineImageView.widthAnchor.constraint(equalTo: numerViewButton.widthAnchor, multiplier: 49/130).isActive = true
        //numerLineImageView.trailingAnchor.constraint(equalTo: numerViewButton.trailingAnchor).isActive = true
        numerLineImageView.trailingAnchor.constraint(equalTo: numerViewButton.trailingAnchor, constant: -10).isActive = true
        
        view.addSubview(numerViewButton)
        numerViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        numerViewButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        numerViewButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 130/375).isActive = true
        numerViewButton.heightAnchor.constraint(equalTo: numerViewButton.widthAnchor, multiplier: 231/130).isActive = true
        //numerViewButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        
    }
    
    
    //MARK: - buttonsView
    
    let buttonsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let characterImage: UIImageView = {
        let im = UIImageView()
        im.image = #imageLiteral(resourceName: "character")
        im.contentMode = UIView.ContentMode.scaleAspectFill
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    func setupButtonsView() {
        setupSovmestViewButton()
        setupNatalViewButton()
        setupNumerViewButton()
        
        buttonsView.addSubview(natalViewButton)
        natalViewButton.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor).isActive = true
        natalViewButton.centerYAnchor.constraint(equalTo: buttonsView.centerYAnchor).isActive = true
        natalViewButton.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 187/392).isActive = true
        natalViewButton.heightAnchor.constraint(equalTo: natalViewButton.widthAnchor, multiplier: 122/187).isActive = true
        
        buttonsView.addSubview(sovmestViewButton)
        sovmestViewButton.topAnchor.constraint(equalTo: buttonsView.topAnchor).isActive = true
        //sovmestViewButton.bottomAnchor.constraint(equalTo: natalViewButton.topAnchor).isActive = true
        sovmestViewButton.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 114/392).isActive = true
        sovmestViewButton.heightAnchor.constraint(equalTo: sovmestViewButton.widthAnchor, multiplier: 229/114).isActive = true
        sovmestViewButton.centerXAnchor.constraint(equalTo: buttonsView.centerXAnchor).isActive = true
        
        buttonsView.addSubview(numerViewButton)
        numerViewButton.bottomAnchor.constraint(equalTo: buttonsView.bottomAnchor).isActive = true
        //numerViewButton.topAnchor.constraint(equalTo: natalViewButton.bottomAnchor).isActive = true
        numerViewButton.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 130/392).isActive = true
        numerViewButton.heightAnchor.constraint(equalTo: numerViewButton.widthAnchor, multiplier: 231/130).isActive = true
        numerViewButton.centerXAnchor.constraint(equalTo: buttonsView.centerXAnchor).isActive = true
        
        buttonsView.addSubview(characterImage)
        characterImage.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor, constant: 30).isActive = true
        characterImage.centerYAnchor.constraint(equalTo: buttonsView.centerYAnchor).isActive = true
        
        
        
        view.addSubview(buttonsView)
        //buttonsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        //buttonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //buttonsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        buttonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        buttonsView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        buttonsView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.9).isActive = true
        buttonsView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
    }
    
    let compButton: UIButton = {
        let button = UIButton()
        button.setTitle("Совместимость по знаку зодиака", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor(red: 96/255, green: 201/255, blue: 251/255, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .center
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 247/255, green: 252/255, blue: 255/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.addTarget(self, action: #selector(showSovmVC), for: .touchUpInside)
        return button
    }()
    
    @objc func showSovmVC() {
        navigationController?.pushViewController(SovmestimostVC(), animated: true)
        
    }
    
    let natalButton: UIButton = {
        let button = UIButton()
        button.setTitle("Расчет натальной карты", for: .normal)
        button.setTitleColor(UIColor(red: 253/255, green: 156/255, blue: 50/255, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .center
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 255/255, green: 249/255, blue: 242/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.addTarget(self, action: #selector(showNatalVC), for: .touchUpInside)
        return button
    }()
    
    @objc func showNatalVC() {
        navigationController?.pushViewController(NatalCardVC(), animated: true)
    }
    
    let numberButton: UIButton = {
        let button = UIButton()
        button.setTitle("Нумерологический прогноз", for: .normal)
        button.setTitleColor(UIColor(red: 96/255, green: 97/255, blue: 212/255, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .center
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 253/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.lightGray.cgColor
        //button.addTarget(self, action: #selector(showGeoVC), for: .touchUpInside)
        return button
    }()
    
    func setupView() {
        let buttonsStackView = UIStackView(arrangedSubviews: [compButton, natalButton, numberButton])
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.axis = .vertical
        buttonsStackView.spacing = 20
        
        view.addSubview(buttonsStackView)
        buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        buttonsStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        buttonsStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
                
        
    }
    
}
