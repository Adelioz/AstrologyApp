//
//  SovmestimostSecondViewController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 28.07.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class SovmestimostSecondVC: UIViewController {

    var horo: Sovmest?
    //let vc = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        //vc.horoSendDelegate = self
        // Do any additional setup after loading the view.
    }
    
    let loveLabel = HoroLabel(with: "Любовь")
    let sexLabel = HoroLabel(with: "Секс")
    let famLabel = HoroLabel(with: "Семья и брак")
    let friendLabel = HoroLabel(with: "Дружба")
    let workLabel = HoroLabel(with: "Работа и бизнес")
    
    let loveTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 20)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    let loveView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupView() {
        view.addSubview(loveLabel)
        loveLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        loveLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        loveLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(loveTextView)
        loveTextView.topAnchor.constraint(equalTo: loveLabel.bottomAnchor).isActive = true
        loveTextView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        loveTextView.backgroundColor = .lightGray
        loveTextView.text = horo?.loveTitle
        
        view.addSubview(sexLabel)
        sexLabel.topAnchor.constraint(equalTo: loveTextView.bottomAnchor).isActive = true
        sexLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        sexLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        
    }
    
    

    
}

extension SovmestimostSecondVC {
    
}
