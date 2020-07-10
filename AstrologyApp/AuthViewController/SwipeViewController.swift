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


class SwipeViewController: UIViewController, UIScrollViewDelegate {
    
    

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

        scrollView.delegate = self
        view.backgroundColor = .white
        setupAllViews()
        setupGesture()
        geoVC.geoSendDelegate = self
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
    let nameTF = SwipeTextField(color: .yellow)
    
    func setupNameView() {
        nameView.addSubview(nameLabel)
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        nameLabel.topAnchor.constraint(equalTo: nameView.topAnchor, constant: 200).isActive = true
        
        nameView.addSubview(nameTF)
        nameTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameTF.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        nameTF.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 100).isActive = true
        nameTF.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 50).isActive = true
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
    
    func setupPlaceView() {
        
        placeView.addSubview(placeLabel)
        placeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        placeLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        placeLabel.topAnchor.constraint(equalTo: placeView.topAnchor, constant: 200).isActive = true
        
        placeView.addSubview(placeTF)
        placeTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        placeTF.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        placeTF.topAnchor.constraint(equalTo: placeLabel.bottomAnchor, constant: 100).isActive = true
        placeTF.leadingAnchor.constraint(equalTo: placeView.leadingAnchor, constant: 50).isActive = true
        placeTF.addTarget(self, action: #selector(showGeoVC), for: .touchUpInside)
        
    }
    
    let dateLabel = SwipeLabel(with: "Дата рождения")
    let datePicker = SwipeDatePicker(mode: .date)
    
    func setupDateView() {
        dateView.addSubview(dateLabel)
        dateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        dateLabel.topAnchor.constraint(equalTo: dateView.topAnchor, constant: 200).isActive = true
        
        dateView.addSubview(datePicker)
        datePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 100).isActive = true
        datePicker.centerXAnchor.constraint(equalTo: dateView.centerXAnchor).isActive = true
    }
    
    let timeLabel = SwipeLabel(with: "Время рождения")
    let timePicker = SwipeDatePicker(mode: .time)
    
    func setupTimeView() {
        timeView.addSubview(timeLabel)
        timeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        timeLabel.topAnchor.constraint(equalTo: timeView.topAnchor, constant: 200).isActive = true
        
        timeView.addSubview(timePicker)
        timePicker.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 100).isActive = true
        timePicker.centerXAnchor.constraint(equalTo: timeView.centerXAnchor).isActive = true
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
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.gray, for: .normal)
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
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.red, for: .normal)
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
                                                                        self.present(MainTabBarController(), animated: true)
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
        let bottomControlStackView = UIStackView(arrangedSubviews: [prevButton, pageControl, nextButton])
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlStackView)
        
        NSLayoutConstraint.activate([
            bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            bottomControlStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomControlStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)])
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
        placeTF.setTitle(city, for: .normal)
        geoPoint = geo
    }
    

    
    
}
