//
//  UserInfoViewController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 30.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit
import Firebase

class UserInfoViewController: UIViewController {

    let userF = UserSettings.shared.getProfile()!
    let currentUser = Auth.auth().currentUser
    let datePicker = SwipeDatePicker(mode: .date)
    let timePicker = SwipeDatePicker(mode: .time)
    var muser: MUser?
    var geoPoint: GeoPoint?
    
    override func loadView() {
        super.loadView()
        
        
        print(geoPoint)
        //geoPoint = muser?.geo
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        getUserFromFirestore()
        view.backgroundColor = .white
        navigationItem.title = "Настройка профиля"
        setupImage()
        setupStackView()
        navigationBarButtonSetup()
        
        
    }
    
    let doneButton = UIBarButtonItem()
    func navigationBarButtonSetup() {
        doneButton.isEnabled = false
        doneButton.title = "Save"
        doneButton.action = #selector(saveInfo)
        doneButton.style = .plain
        doneButton.target = self
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func getUserFromFirestore() {
        FirestoreService.shared.getUserData(user: currentUser!) { (result) in
            switch result {
                
            case .success(let muser):
                self.muser = muser
                self.geoPoint = muser.geo
                self.doneButton.isEnabled = true
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @objc func saveInfo() {
        print(#function)
        showAlert(with: "Внимание!", and: "Данные можно изменить только один раз, убедтесь в правильности заполненных полей") {
            guard let current = self.currentUser else { return }
            FirestoreService.shared.saveProfileWith(uid: current.uid, email: current.email!, name: self.nameTF.text, birthPlace: self.placeTF.titleLabel?.text, birthTimestamp: self.formFromPickersToTimestamp(date: self.datePicker.date, time: self.timePicker.date), geo: self.geoPoint, isEdited: true) { (result) in
                switch result {
                    
                case .success(let user):
                    print("ДАННЫЕ СОХРАНЕНЫ")
                    self.textFieldsNotEnabled()
                    UserSettings.shared.saveProfile(name: user.name, birthPlace: user.birthPlace, birthTimestamp: user.birthTimestamp, sex: user.sex, mail: user.email, isEdited: user.isEdited)
                case .failure(_):
                    print("ОШИБКА ПРИ СОХРАНЕНИИ")
                }
            }
        }
        
        
        
    }
    

    let userImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "user"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    func setupImage() {
        view.addSubview(userImage)
        userImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        userImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        userImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    let nameCell = LineInfoView(leftLabelText: "Имя", topLine: true)
    let dateCell = LineInfoView(leftLabelText: "Дата рождения", topLine: false)
    let timeCell = LineInfoView(leftLabelText: "Время рождения", topLine: false)
    let sexCell = LineInfoView(leftLabelText: "Пол", topLine: false)
    let placeCell = LineInfoView(leftLabelText: "Город", topLine: false)
    
    let nameTF = TextFieldInfo(font: UIFont.systemFont(ofSize: 15))
    let dateTF = TextFieldInfo(font: UIFont.systemFont(ofSize: 15))
    let timeTF = TextFieldInfo(font: UIFont.systemFont(ofSize: 15))
    let sexTF = TextFieldInfo(font: UIFont.systemFont(ofSize: 15))
    //let placeTF = TextFieldInfo(font: UIFont.systemFont(ofSize: 15))
    let placeTF = UIButton()
    
    
    
    func setupInfoCells() {
        nameCell.addSubview(nameTF)
        nameTF.trailingAnchor.constraint(equalTo: nameCell.trailingAnchor).isActive = true
        nameTF.heightAnchor.constraint(equalTo: nameCell.heightAnchor).isActive = true
        nameTF.widthAnchor.constraint(equalTo: nameCell.widthAnchor, multiplier: 0.5).isActive = true
        nameTF.text = userF.name
        
        dateCell.addSubview(dateTF)
        dateTF.trailingAnchor.constraint(equalTo: dateCell.trailingAnchor).isActive = true
        dateTF.heightAnchor.constraint(equalTo: dateCell.heightAnchor).isActive = true
        dateTF.widthAnchor.constraint(equalTo: dateCell.widthAnchor, multiplier: 0.5).isActive = true
        dateTF.text = getDate(timestamp: userF.birthTimestamp)
        
        timeCell.addSubview(timeTF)
        timeTF.trailingAnchor.constraint(equalTo: timeCell.trailingAnchor).isActive = true
        timeTF.heightAnchor.constraint(equalTo: timeCell.heightAnchor).isActive = true
        timeTF.widthAnchor.constraint(equalTo: timeCell.widthAnchor, multiplier: 0.5).isActive = true
        timeTF.text = getTime(timestamp: userF.birthTimestamp)
        
        sexCell.addSubview(sexTF)
        sexTF.trailingAnchor.constraint(equalTo: sexCell.trailingAnchor).isActive = true
        sexTF.heightAnchor.constraint(equalTo: sexCell.heightAnchor).isActive = true
        sexTF.widthAnchor.constraint(equalTo: sexCell.widthAnchor, multiplier: 0.5).isActive = true
        sexTF.text = userF.sex
        
        placeCell.addSubview(placeTF)
        placeTF.trailingAnchor.constraint(equalTo: placeCell.trailingAnchor).isActive = true
        placeTF.heightAnchor.constraint(equalTo: placeCell.heightAnchor).isActive = true
        placeTF.widthAnchor.constraint(equalTo: placeCell.widthAnchor, multiplier: 0.5).isActive = true
        //placeTF.text = userF.birthPlace
        placeTF.setTitle(userF.birthPlace, for: .normal)
        placeTF.setTitleColor(.black, for: .normal)
        placeTF.contentHorizontalAlignment = .left
        placeTF.addTarget(self, action: #selector(showGeoVC), for: .touchUpInside)
        placeTF.translatesAutoresizingMaskIntoConstraints = false
        
        
        setupDatePickers()
    }
    
    @objc func showGeoVC() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            let geo = PlaceChooseViewController()
            geo.geoSendDelegate = self
            self.view.addSubview(geo)
        }
    }
    
    func setupDatePickers() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(toolBarButtonPressed))
        toolBar.setItems([doneButton], animated: true)
        dateTF.inputAccessoryView = toolBar
        timeTF.inputAccessoryView = toolBar
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        timePicker.addTarget(self, action: #selector(timeChanged), for: .valueChanged)
        
        dateTF.inputView = datePicker
        timeTF.inputView = timePicker
    }
    
    @objc func toolBarButtonPressed() {
        view.endEditing(true)
    }
    
    @objc func dateChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateTF.text = dateFormatter.string(from: datePicker.date)
    }
    @objc func timeChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        timeTF.text = dateFormatter.string(from: timePicker.date)
    }
    
    
    func setupStackView() {
        
        setupInfoCells()
        
        let stackView = UIStackView(arrangedSubviews: [nameCell, dateCell, timeCell, sexCell, placeCell])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        stackView.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 50).isActive = true
        if userF.isEdited {
            textFieldsNotEnabled()
        }
    }
    
    func textFieldsNotEnabled() {
        nameTF.isEnabled = false
        nameTF.textColor = .gray
        
        dateTF.isEnabled = false
        dateTF.textColor = .gray
        
        placeTF.isEnabled = false
        placeTF.setTitleColor(.gray, for: .normal)
    }
    

}

extension UserInfoViewController: GeoPointSendDelegate {
    func setGeo(city: String, geo: GeoPoint) {
        geoPoint = geo
        placeTF.setTitle(city, for: .normal)
    }
    
    
}

extension UserInfoViewController {
    func getDate(timestamp: String) -> String {
        guard let time = Double(timestamp) else { return "" }
        let date = Date(timeIntervalSince1970: time)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
    
    func getTime(timestamp: String) -> String {
        guard let time = Double(timestamp) else { return "" }
        let date = Date(timeIntervalSince1970: time)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"

        let strDate = dateFormatter.string(from: date)
        return strDate
    }
}

extension UserInfoViewController {
    func showAlert(with title: String, and message: String, completion: @escaping () -> Void = {}) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            completion()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}


