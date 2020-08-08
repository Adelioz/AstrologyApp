//
//  SovmestimostViewController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 27.07.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class SovmestimostVC: UIViewController {
    
    let signs = ["Овен",
                 "Телец",
                 "Близнецы",
                 "Рак",
                 "Лев",
                 "Дева",
                 "Весы",
                 "Скорпион",
                 "Стрелец",
                 "Козерог",
                 "Водолей",
                 "Рыбы"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFields()
        createPicker()
        view.backgroundColor = .white
        // Do any addiэtional setup after loading the view.
    }
    
    
    let leftLabel: UILabel = {
        let label = UILabel()
        label.text = "Мужчина"
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let leftField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .green
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let rightLabel: UILabel = {
        let label = UILabel()
        label.text = "Женщина"
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let rightField: UITextField = {
        let tf = UITextField()
        //tf.backgroundColor = .green
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    @objc func buttonTapped() {
        print(#function)
        let url = URLBuilder.shared.buildURL(pair: SignPair(leftSign: getSign(sign: leftField.text!), rightSign: getSign(sign: rightField.text!)))
        SoupHelper.shared.setup(url: url!) { sovm in
            let secondVC = SovmestimostSecondVC()
            secondVC.horo = sovm
            self.present(secondVC, animated: true)
            //            print(sovm.famTitle)
            //            print("loh")
        }
        
        
    }
    
    
    func setupFields() {
        let leftStack = UIStackView(arrangedSubviews: [leftLabel, leftField])
        leftStack.translatesAutoresizingMaskIntoConstraints = false
        leftStack.axis = .vertical
        leftStack.distribution = .fillEqually
        let rightStack = UIStackView(arrangedSubviews: [rightLabel, rightField])
        rightStack.translatesAutoresizingMaskIntoConstraints = false
        rightStack.axis = .vertical
        rightStack.distribution = .fillEqually
        rightStack.backgroundColor = .gray
        
        let stack = UIStackView(arrangedSubviews: [leftStack, rightStack])
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        
        
        view.addSubview(stack)
        stack.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        view.addSubview(button)
        button.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -30).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    let leftPicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    let rightPicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    
    
    
    func createPicker() {
        leftPicker.delegate = self
        rightPicker.delegate = self
        
        leftField.inputView = leftPicker
        rightField.inputView = rightPicker
    }
    
    

}

extension SovmestimostVC {
    func getSign(sign: String) -> String {
        switch sign {
        case "Овен":
            return "oven"
        case "Телец":
            return "telec"
        case "Близнецы":
            return "bliznecy"
        case "Рак":
            return "rak"
        case "Лев":
            return "lev"
        case "Дева":
            return "deva"
        case "Весы":
            return "vesy"
        case "Скорпион":
            return "skorpion"
        case "Стрелец":
            return "strelec"
        case "Козерог":
            return "kozerog"
        case "Водолей":
            return "vodolej"
        case "Рыбы":
            return "ryby"
        default:
            return ""
        }
    }
}

extension SovmestimostVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return signs.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return signs[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == leftPicker {
            leftField.text = signs[row]
        } else {
            rightField.text = signs[row]
        }
    }
}
