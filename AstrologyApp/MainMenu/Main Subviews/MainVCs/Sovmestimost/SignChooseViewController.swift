//
//  SignChooseViewController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 07.10.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import Foundation
import UIKit

protocol SignSendDelegate {
    func setSign(sign: SignCellModel, isLeft: Bool)
}

class SignChooseViewController: UIView {
    
    let signs = SignCellModel.fetchSign()
    var signSendDelegate: SignSendDelegate!
    
    var isLeft = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContainerView()
        setupTopView()
        setupTableView()
        setupGesture()
        
        animateIn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Container View
    
    let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        return view
    }()
    
    func setupContainerView() {
        //self.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        self.frame = UIScreen.main.bounds
        self.addSubview(container)
        
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40).isActive = true
        container.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
    }
    
    //MARK: - Gesture Recognizer View
    
    let topView = UIView()
    
    func setupTopView() {
        self.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        topView.bottomAnchor.constraint(equalTo: container.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    //MARK: - Table View
    
    let tableView = UITableView()
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(SignChooseCell.self, forCellReuseIdentifier: "signChooseCell")
        //tableView.backgroundColor = .white
        
        container.addSubview(label)
        label.topAnchor.constraint(equalTo: container.topAnchor, constant: 28).isActive = true
        label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 28).isActive = true
        
        container.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: label.topAnchor, constant: 50).isActive = true
        //tableView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -(self.safeAreaInsets.bottom + 40)).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 21)
        label.textColor = .black
        label.text = "Выберите знак зодиака"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK: - Animation
    
    @objc func animateOut() {
        
        self.endEditing(true)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
            self.alpha = 0
        }) { (complete) in
            if complete {
                self.removeFromSuperview()
            }
        }
    }
    
    @objc func animateIn() {
        
        self.container.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
        self.alpha = 1
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = .identity
            self.alpha = 1
        })
    }
    
    
    
}



//MARK: - Table View Extension
extension SignChooseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "signChooseCell", for: indexPath) as! SignChooseCell

        cell.setup()
        cell.icon.image = signs[indexPath.row].image.tintedWithLinearGradientColors(colorsArr: [#colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1), #colorLiteral(red: 0.568627451, green: 0.5607843137, blue: 0.9294117647, alpha: 1)])
        cell.label.text = signs[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        signSendDelegate.setSign(sign: signs[indexPath.row], isLeft: isLeft)
        animateOut()
    }
    
    
}


//MARK: - Gesture Recognizer
extension SignChooseViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func setupGesture() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(animateOut))
        swipeDown.delegate = self
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(animateOut))
        tap.delegate = self
        
        topView.addGestureRecognizer(swipeDown)
        topView.addGestureRecognizer(tap)
    }
    
}
