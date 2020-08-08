//
//  SwipeViewController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 16.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


class SwipeViewController: UIViewController, UIScrollViewDelegate, UIPickerViewDelegate {
    
    

    private let currentUser: User
    private var geoPoint: GeoPoint?// = nil
    let geoVC = PlaceChooseViewController()
    
    
    init(currentUser: User) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackgroundImage()
        scrollView.delegate = self
        view.backgroundColor = .white
        setupAllViews()
        setupGesture()
        geoVC.geoSendDelegate = self
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
    
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isPagingEnabled = true
        scroll.bounces = false
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    func setupAllViews() {
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.contentSize = CGSize(width: (view.frame.width * 4), height: view.frame.height)
        
        setupViews()
        setupBottomControl()
    }
    
    let nameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let placeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dateView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let timeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupViews() {
        scrollView.addSubview(nameView)
        scrollView.addSubview(placeView)
        scrollView.addSubview(dateView)
        scrollView.addSubview(timeView)
        
        nameView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        nameView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        placeView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        placeView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        placeView.leadingAnchor.constraint(equalTo: nameView.trailingAnchor).isActive = true
        
        dateView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        dateView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        dateView.leadingAnchor.constraint(equalTo: placeView.trailingAnchor).isActive = true
        
        timeView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        timeView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        timeView.leadingAnchor.constraint(equalTo: dateView.trailingAnchor).isActive = true
        
        
        setupNameView()
        setupPlaceView()
        setupDateView()
        setupTimeView()
    }
    
    let nameLabel = SwipeLabel(with: "Как вас зовут?")
    let nameTF = SwipeTextField(text: "Введите Ваше имя")
    
    func setupNameView() {
        nameView.addSubview(nameLabel)
        nameLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: view.frame.width * 40/375).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: -(view.frame.width * 58/375)).isActive = true
        nameLabel.topAnchor.constraint(equalTo: nameView.topAnchor, constant: view.frame.height * 100/812).isActive = true
        
        nameView.addSubview(nameTF)
        nameTF.heightAnchor.constraint(equalToConstant: view.frame.height * 56/812).isActive = true
        nameTF.widthAnchor.constraint(equalToConstant: view.frame.width * 293/375).isActive = true
        nameTF.centerXAnchor.constraint(equalTo: nameView.centerXAnchor).isActive = true
        nameTF.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: view.frame.height * 184/812).isActive = true
        nameTF.textColor = .white
    }
    
    let placeLabel = SwipeLabel(with: "Место рождения")
    let placeTF = SwipeButton(color: .yellow)
    @objc func showGeoVC() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            let geo = PlaceChooseViewController()
            geo.geoSendDelegate = self
            self.view.addSubview(geo)
        }
    }
    let pathImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "path")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    func setupPlaceView() {
        
        placeView.addSubview(placeLabel)
        placeLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        placeLabel.leadingAnchor.constraint(equalTo: placeView.leadingAnchor, constant: view.frame.width * 40/375).isActive = true
        placeLabel.trailingAnchor.constraint(equalTo: placeView.trailingAnchor, constant: -(view.frame.width * 58/375)).isActive = true
        placeLabel.topAnchor.constraint(equalTo: placeView.topAnchor, constant: view.frame.height * 100/812).isActive = true
        
        placeView.addSubview(placeTF)
        placeTF.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 56/812).isActive = true
        placeTF.widthAnchor.constraint(equalToConstant: view.frame.width * 293/375).isActive = true
        placeTF.topAnchor.constraint(equalTo: placeLabel.bottomAnchor, constant: view.frame.height * 184/812).isActive = true
        placeTF.centerXAnchor.constraint(equalTo: placeView.centerXAnchor).isActive = true
        placeTF.addTarget(self, action: #selector(showGeoVC), for: .touchUpInside)
        
        
        placeTF.addSubview(pathImage)
        pathImage.trailingAnchor.constraint(equalTo: placeTF.trailingAnchor, constant: -15).isActive = true
        pathImage.centerYAnchor.constraint(equalTo: placeTF.centerYAnchor).isActive = true
        pathImage.heightAnchor.constraint(equalTo: placeTF.heightAnchor, multiplier: 15/56).isActive = true
        
    }
    
    let dateLabel = SwipeLabel(with: "Дата рождения")
    let datePicker = SwipeDatePicker(mode: .date)
    let selectViewDate: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    func setupDateView() {
        dateView.addSubview(dateLabel)
        dateLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: dateView.leadingAnchor, constant: view.frame.width * 40/375).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: dateView.trailingAnchor, constant: -(view.frame.width * 58/375)).isActive = true
        dateLabel.topAnchor.constraint(equalTo: dateView.topAnchor, constant: view.frame.height * 100/812).isActive = true
        
        dateView.addSubview(datePicker)
        datePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 100).isActive = true
        datePicker.centerXAnchor.constraint(equalTo: dateView.centerXAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        //datePicker.backgroundColor = .green
        //datePicker.setValue(UIColor.white, forKey: "textColor")
        
        datePicker.addSubview(selectViewDate)
        selectViewDate.widthAnchor.constraint(equalTo: datePicker.widthAnchor, multiplier: 1).isActive = true
        selectViewDate.heightAnchor.constraint(equalToConstant: 35).isActive = true
        selectViewDate.centerXAnchor.constraint(equalTo: datePicker.centerXAnchor).isActive = true
        selectViewDate.centerYAnchor.constraint(equalTo: datePicker.centerYAnchor).isActive = true
        selectViewDate.layer.cornerRadius = 7
    }
    
    let timeLabel = SwipeLabel(with: "Время рождения")
    let timePicker = SwipeDatePicker(mode: .time)
    let selectViewTime: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    func setupTimeView() {
        timeView.addSubview(timeLabel)
        timeLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: timeView.leadingAnchor, constant: view.frame.width * 40/375).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: timeView.trailingAnchor, constant: -(view.frame.width * 58/375)).isActive = true
        timeLabel.topAnchor.constraint(equalTo: timeView.topAnchor, constant: view.frame.height * 100/812).isActive = true
        
        timeView.addSubview(timePicker)
        timePicker.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 100).isActive = true
        timePicker.centerXAnchor.constraint(equalTo: timeView.centerXAnchor).isActive = true
        timePicker.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        timePicker.addSubview(selectViewTime)
        selectViewTime.widthAnchor.constraint(equalTo: timePicker.widthAnchor, multiplier: 1).isActive = true
        selectViewTime.heightAnchor.constraint(equalToConstant: 35).isActive = true
        selectViewTime.centerXAnchor.constraint(equalTo: timePicker.centerXAnchor).isActive = true
        selectViewTime.centerYAnchor.constraint(equalTo: timePicker.centerYAnchor).isActive = true
        selectViewTime.layer.cornerRadius = 7
    }
    
    
    
    //MARK: BOTTOM CONTROL
    
    
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .gray
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    let prevButton: UIButton = {
        let button = UIButton(type: .system)
//        button.setTitle("PREV", for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
//        button.setTitleColor(.gray, for: .normal)
//        button.setImage(UIImage(named: "pathBack"), for: .normal)
//        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "pathBack"), for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func handlePrev() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        scrollView.setContentOffset(CGPoint(x: (nextIndex * Int(view.frame.width)), y: 0), animated: true)
    }
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Далее", for: .normal)
        button.titleLabel?.font = UIFont(name: "Lato-Bold", size: 20)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func handleNext() {
        
        //Добавить обработку текст филдов
        
                if pageControl.currentPage == 3 {
                    FirestoreService.shared.saveProfileWith(uid: currentUser.uid,
                                                            email: currentUser.email!,
                                                            name: nameTF.text,
                                                            birthPlace: placeTF.titleLabel!.text,
                                                            birthTimestamp: formFromPickersToTimestamp(date: datePicker.date, time: timePicker.date),
                                                            geo: geoPoint, isEdited: false) { (result) in
                                                                
                                                                switch result {
                                                                    
                                                                case .success(let muser):
                                                                    UserSettings.shared.saveProfile(name: self.nameTF.text!,
                                                                                                    birthPlace: self.placeTF.titleLabel!.text!,
                                                                                                    birthTimestamp: self.formFromPickersToTimestamp(date: self.datePicker.date, time: self.timePicker.date),
                                                                                                    sex: nil,
                                                                                                    mail: self.currentUser.email!,
                                                                                                    isEdited: false)
                                                                    self.showAlert(with: "Успешно!", and: "Приятного пользования", completion: {
                                                                        let mainTBC = MainTabBarController()
                                                                        mainTBC.modalTransitionStyle = .crossDissolve
                                                                        mainTBC.modalPresentationStyle = .overCurrentContext
                                                                        self.present(mainTBC, animated: true)
                                                                    })
                                                                    print(muser)
                                                                case .failure(let error):
                                                                    self.showAlert(with: "Ошибка!", and: error.localizedDescription)
                                                                }
                    }
                    
                    
                }
        
        let nextIndex = min(pageControl.currentPage + 1, 3)
        scrollView.setContentOffset(CGPoint(x: (nextIndex * Int(view.frame.width)), y: 0), animated: true)
    }
    
    func setupBottomControl() {
//        let bottomControlStackView = UIStackView(arrangedSubviews: [prevButton, pageControl, nextButton])
//        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
//        bottomControlStackView.distribution = .fillEqually
//
//        view.addSubview(bottomControlStackView)
//
//        NSLayoutConstraint.activate([
//            bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
//            bottomControlStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            bottomControlStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)])
        
        view.addSubview(prevButton)
        prevButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        prevButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        prevButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        prevButton.widthAnchor.constraint(equalTo: prevButton.heightAnchor, multiplier: 10/21).isActive = true
        
        view.addSubview(nextButton)
        nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(view.frame.height * 70/812)).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.frame = CGRect(x: 0, y: 0, width: view.frame.width - 60 , height: view.frame.height * 56/812)
        nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: view.frame.height * 56/812).isActive = true
        nextButton.setGradientBackground(colorOne: #colorLiteral(red: 0.568627451, green: 0.5607843137, blue: 0.9294117647, alpha: 1), colorTwo: #colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1))
        nextButton.layer.cornerRadius = nextButton.frame.size.height / 2
        nextButton.clipsToBounds = true
    }
    
    
    
    
    //MARK: UIScrollViewDelegate METHODS
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        pageControl.currentPage = Int((scrollView.contentOffset.x + (CGFloat(view.frame.width) / 2)) / CGFloat(view.frame.width))
        print(pageControl.currentPage)
        hideKeyboardOnSwipe()
        
    }

}

extension SwipeViewController: UIGestureRecognizerDelegate {
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

extension SwipeViewController {
    func showAlert(with title: String, and message: String, completion: @escaping () -> Void = {}) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            completion()
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

extension SwipeViewController: GeoPointSendDelegate {
    func setGeo(city: String, geo: GeoPoint) {
        placeTF.setAttributedTitle(NSAttributedString(string: city,
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                   NSAttributedString.Key.font: UIFont(name: "Lato-Bold", size: 16)]), for: .normal)
        geoPoint = geo
    }
    

    
    
}
