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
        
        setupBackgroundImage()
        setupTopView()
        setupCheckButton()
//        setupFields()
//        createPicker()

        setupNavigationController()
        
        // Do any addiэtional setup after loading the view.
    }
    
    //MARK: - Background Image
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
//        let menuBtn = UIButton(type: .custom)
//        menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
//        menuBtn.setImage(UIImage(named:"pathBack"), for: .normal)
//        menuBtn.addTarget(self, action: #selector(leftItemTapped), for: .touchUpInside)
//        let menuBarItem = UIBarButtonItem(customView: menuBtn)
//        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 25).isActive = true
//        menuBarItem.customView?.widthAnchor.constraint(equalTo: menuBarItem.customView!.heightAnchor, multiplier: 10/21).isActive = true
//        self.navigationItem.leftBarButtonItem = menuBarItem
//        self.navigationItem.backBarButtonItem = menuBarItem
        
        //navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage(named: "pathBack"), style: .plain, target: nil, action: nil)
        
        //navigationController?.title = "Совместимость по знакам зодиака"
        title = "Совместимость по знакам зодиака"
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.isTranslucent = true
    }
    
    @objc func leftItemTapped() {
        print(#function)
        self.dismiss(animated: true, completion: nil)
    }
    

    //MARK: - Left Sign View
    
    let leftSignView: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(leftButtonCheck), for: .touchUpInside)
        return view
    }()
    
    @objc func leftButtonCheck() {
        print(#function)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            let sign = SignChooseViewController()
            sign.signSendDelegate = self
            sign.isLeft = true
            self.view.addSubview(sign)
        }
    }
    
    func setupLeftSignView() {
        topView.addSubview(leftSignView)
        leftSignView.frame = CGRect(x: 0, y: 0, width: view.frame.width * 163/375, height: view.frame.width * 159/375)
        leftSignView.layer.cornerRadius = 7
        leftSignView.clipsToBounds = true
        leftSignView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 163/375).isActive = true
        leftSignView.heightAnchor.constraint(equalTo: leftSignView.widthAnchor, multiplier: 159/163).isActive = true
        leftSignView.setGradientBackground(colorOne: UIColor(red: 1, green: 1, blue: 1, alpha: 0.1), colorTwo: UIColor(red: 1, green: 1, blue: 1, alpha: 0.05), horizontal: false)
        leftSignView.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
        
        
        setupLeftViewLabels()
    }
    
    //MARK: - Left View Labels
    
    let leftSexLabel: UILabel = {
        let label = UILabel()
        label.text = "Женщина"
        label.font = UIFont(name: "Lato-Regular", size: 13)
        label.textColor = #colorLiteral(red: 0.5529411765, green: 0.5450980392, blue: 1, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let leftSignLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Lato-Bold", size: 15)
        label.textColor = .white
        label.alpha = 0.8
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let leftSignImage: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFill
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    func setupLeftViewLabels() {
        leftSignView.addSubview(leftSexLabel)
        leftSexLabel.topAnchor.constraint(equalTo: leftSignView.topAnchor, constant: 10).isActive = true
        leftSexLabel.centerXAnchor.constraint(equalTo: leftSignView.centerXAnchor).isActive = true
        
        leftSignView.addSubview(leftSignLabel)
        leftSignLabel.bottomAnchor.constraint(equalTo: leftSignView.bottomAnchor, constant: -25).isActive = true
        leftSignLabel.centerXAnchor.constraint(equalTo: leftSignView.centerXAnchor).isActive = true
        
        leftSignView.addSubview(leftSignImage)
        //leftSignImage.image = horo?.leftSign.image.tintedWithLinearGradientColors(colorsArr: [#colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1), #colorLiteral(red: 0.568627451, green: 0.5607843137, blue: 0.9294117647, alpha: 1)])
        leftSignImage.widthAnchor.constraint(equalTo: leftSignView.widthAnchor, multiplier: 61/163).isActive = true
        leftSignImage.heightAnchor.constraint(equalTo: leftSignImage.widthAnchor).isActive = true
        leftSignImage.centerXAnchor.constraint(equalTo: leftSignView.centerXAnchor).isActive = true
        leftSignImage.centerYAnchor.constraint(equalTo: leftSignView.centerYAnchor, constant: -8).isActive = true
    }
    
    
    
    //MARK: - Right Sign View
    
    let rightSignView: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(rightButtonCheck), for: .touchUpInside)
        return view
    }()
    
    @objc func rightButtonCheck() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            let sign = SignChooseViewController()
            sign.signSendDelegate = self
            sign.isLeft = false
            self.view.addSubview(sign)
        }
    }
    
    
    func setupRightSignView() {
        topView.addSubview(rightSignView)
        rightSignView.frame = CGRect(x: 0, y: 0, width: view.frame.width * 163/375, height: view.frame.width * 159/375)
        rightSignView.layer.cornerRadius = 7
        rightSignView.clipsToBounds = true
        rightSignView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 163/375).isActive = true
        rightSignView.heightAnchor.constraint(equalTo: rightSignView.widthAnchor, multiplier: 159/163).isActive = true
        rightSignView.trailingAnchor.constraint(equalTo: topView.trailingAnchor).isActive = true
        rightSignView.setGradientBackground(colorOne: UIColor(red: 1, green: 1, blue: 1, alpha: 0.1), colorTwo: UIColor(red: 1, green: 1, blue: 1, alpha: 0.05), horizontal: false)
        
        setupRightViewLabels()
    }
    
    //MARK: - Right View Labels
    
    let rightSexLabel: UILabel = {
        let label = UILabel()
        label.text = "Мужчина"
        label.font = UIFont(name: "Lato-Regular", size: 13)
        label.textColor = #colorLiteral(red: 0.5529411765, green: 0.5450980392, blue: 1, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rightSignLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Lato-Bold", size: 15)
        label.textColor = .white
        label.alpha = 0.8
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rightSignImage: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFill
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    func setupRightViewLabels() {
        rightSignView.addSubview(rightSexLabel)
        rightSexLabel.topAnchor.constraint(equalTo: rightSignView.topAnchor, constant: 10).isActive = true
        rightSexLabel.centerXAnchor.constraint(equalTo: rightSignView.centerXAnchor).isActive = true
        
        rightSignView.addSubview(rightSignLabel)
        rightSignLabel.bottomAnchor.constraint(equalTo: rightSignView.bottomAnchor, constant: -25).isActive = true
        rightSignLabel.centerXAnchor.constraint(equalTo: rightSignView.centerXAnchor).isActive = true
        
        rightSignView.addSubview(rightSignImage)
        //rightSignImage.image = horo?.rightSign.image.tintedWithLinearGradientColors(colorsArr: [#colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1), #colorLiteral(red: 0.568627451, green: 0.5607843137, blue: 0.9294117647, alpha: 1)])
        //rightSignImage.frame = CGRect(x: 0, y: 0, width: view.frame.width * 61/375, height: view.frame.width * 61/375)
        //rightSignImage.tintColor = .purple
        rightSignImage.widthAnchor.constraint(equalTo: rightSignView.widthAnchor, multiplier: 61/163).isActive = true
        rightSignImage.heightAnchor.constraint(equalTo: rightSignImage.widthAnchor).isActive = true
        rightSignImage.centerXAnchor.constraint(equalTo: rightSignView.centerXAnchor).isActive = true
        rightSignImage.centerYAnchor.constraint(equalTo: rightSignView.centerYAnchor, constant: -8).isActive = true
    }
    
    //MARK: - Stack View
    
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupTopView() {
        view.addSubview(topView)
        topView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 249/812).isActive = true
        topView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 159/375).isActive = true
        topView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 335/375).isActive = true
        
        setupLeftSignView()
        setupRightSignView()
        setupPlusIcon()
    }
    
    //MARK: - Plus Icon
    
    let plusIcon: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: "plus")
        im.alpha = 0.8
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    func setupPlusIcon() {
        topView.addSubview(plusIcon)
        plusIcon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        plusIcon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        plusIcon.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        plusIcon.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
    }
    
    //MARK: - Check Button
    
    let checkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Проверить", for: .normal)
        button.titleLabel?.font = UIFont(name: "Lato-Bold", size: 20)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    @objc func checkButtonTapped() {
        
        view.addSubview(actIndView)
        actIndView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        actIndView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        actIndView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        actIndView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        actIndView.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: actIndView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: actIndView.centerYAnchor).isActive = true
        activityIndicator.startAnimating()
        
        guard let left = leftSignLabel.text, let right = rightSignLabel.text else {
            print("AAAAAAAAA")
            showAlert()
            actIndView.removeFromSuperview()
            return
        }
        
        let url = URLBuilder.shared.buildURL(pair: SignPair(leftSign: getSign(sign: left), rightSign: getSign(sign: right)))
        let signArray = SignCellModel.fetchSign()
        var leftSign = SignCellModel()
        var rightSign = SignCellModel()
        var sovmest = Sovmest()
        for i in signArray {
            if i.name == left {
                leftSign = i
            }
            if i.name == right {
                rightSign = i
            }
        }
        
        
        DispatchQueue.main.async {
            SoupHelper.shared.setup(url: url!) { sovm in
                sovmest = sovm
                sovmest.leftSign = leftSign
                sovmest.rightSign = rightSign
                let secondVC = SovmestimostSecondVC()
                secondVC.horo = sovmest
                self.show(secondVC, sender: self)
                self.actIndView.removeFromSuperview()
                
            }
        }
        
        
    }
    
    func setupCheckButton() {
        view.addSubview(checkButton)
        //checkButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(view.frame.height * 70/812)).isActive = true
        checkButton.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: view.frame.height * 150/812).isActive = true
        checkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        checkButton.frame = CGRect(x: 0, y: 0, width: view.frame.width * 293/375, height: view.frame.height * 56/812)
//        checkButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
//        checkButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: view.frame.height * 56/812).isActive = true
        checkButton.widthAnchor.constraint(equalToConstant: view.frame.width * 293/375).isActive = true
        checkButton.setGradientBackground(colorOne: #colorLiteral(red: 0.568627451, green: 0.5607843137, blue: 0.9294117647, alpha: 0.5), colorTwo: #colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 0.5), horizontal: true)
        checkButton.layer.cornerRadius = checkButton.frame.size.height / 2
        checkButton.clipsToBounds = true
    }

    
    //MARK: - Activity Indicator
    
    let actIndView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        return view
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let actInd = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        //actInd.hidesWhenStopped = true
        actInd.style = UIActivityIndicatorView.Style.whiteLarge
        actInd.translatesAutoresizingMaskIntoConstraints = false
        return actInd
    }()
    
    func showActivityIndicatory() {
        
        
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        actInd.center = view.center
        actInd.hidesWhenStopped = true
        actInd.style =
            UIActivityIndicatorView.Style.whiteLarge
        view.addSubview(actInd)
        print("animating")
        actInd.startAnimating()
    }
    

}

extension SovmestimostVC {
    func showAlert() {
        let alert = UIAlertController(title: "Внимание!", message: "Заполните все поля", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        
        present(alert, animated: true)
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

extension SovmestimostVC: SignSendDelegate {
    func setSign(sign: SignCellModel, isLeft: Bool) {
        if isLeft {
            leftSignLabel.text = sign.name
            leftSignImage.image = sign.image.tintedWithLinearGradientColors(colorsArr: [#colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1), #colorLiteral(red: 0.568627451, green: 0.5607843137, blue: 0.9294117647, alpha: 1)])
        } else {
            rightSignLabel.text = sign.name
            rightSignImage.image = sign.image.tintedWithLinearGradientColors(colorsArr: [#colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1), #colorLiteral(red: 0.568627451, green: 0.5607843137, blue: 0.9294117647, alpha: 1)])
        }
    }
}
