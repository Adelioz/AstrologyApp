//
//  SwipeViewController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 16.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        secondScrollView.delegate = self
        view.backgroundColor = .white
        setupView()
        setupBottomControl()
        setupGesture()
        
    }
    
    
    //MARK: LABELS
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Как вас зовут?"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let placeLabel: UILabel = {
        let label = UILabel()
        label.text = "Место рождения"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата рождения"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Время рождения"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать!"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    //MARK: TextFields
    let nameTF: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .yellow
        tf.font = UIFont.boldSystemFont(ofSize: 30)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let placeTF: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .yellow
        tf.font = UIFont.boldSystemFont(ofSize: 30)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let dateTF: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .yellow
        tf.font = UIFont.boldSystemFont(ofSize: 30)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let timeTF: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .gray
        tf.font = UIFont.boldSystemFont(ofSize: 30)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    
    //MARK: ScrollView
    let secondScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isPagingEnabled = true
        scroll.bounces = false
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    let firstScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isPagingEnabled = true
        scroll.bounces = false
        //scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    
    //MARK: VIEWS
    
    let greenView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .green
        return view
    }()
    
    let redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .red
        return view
    }()
    
    //MARK: BUTTONS
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
        
        if pageControl.currentPage == 0 {
            firstScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
        
        let nextIndex = max(pageControl.currentPage - 1, 0)
        secondScrollView.setContentOffset(CGPoint(x: (nextIndex * Int(view.frame.width)), y: 0), animated: true)
        
        
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
        let nextIndex = min(pageControl.currentPage + 1, 3)
        secondScrollView.setContentOffset(CGPoint(x: (nextIndex * Int(view.frame.width)), y: 0), animated: true)
    }
    
    let helloNextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func nextPage() {
        firstScrollView.setContentOffset(CGPoint(x: Int(view.frame.width), y: 0), animated: true)
    }
    
    
    //MARK: SETUPS
    func setupView() {
        
        secondScrollView.addSubview(nameLabel)
        secondScrollView.addSubview(placeLabel)
        secondScrollView.addSubview(dateLabel)
        secondScrollView.addSubview(timeLabel)


        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        nameLabel.topAnchor.constraint(equalTo: secondScrollView.topAnchor, constant: 200).isActive = true


        placeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        placeLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        placeLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        placeLabel.topAnchor.constraint(equalTo: secondScrollView.topAnchor, constant: 200).isActive = true
        //
        dateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: placeLabel.trailingAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: secondScrollView.topAnchor, constant: 200).isActive = true
        //
        timeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: secondScrollView.topAnchor, constant: 200).isActive = true


        secondScrollView.addSubview(nameTF)
        secondScrollView.addSubview(placeTF)
        secondScrollView.addSubview(dateTF)
        secondScrollView.addSubview(timeTF)

        nameTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameTF.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        nameTF.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 100).isActive = true
        nameTF.leadingAnchor.constraint(equalTo: secondScrollView.leadingAnchor, constant: 50).isActive = true

        placeTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        placeTF.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        placeTF.topAnchor.constraint(equalTo: placeLabel.bottomAnchor, constant: 100).isActive = true
        placeTF.leadingAnchor.constraint(equalTo: nameTF.trailingAnchor, constant: 100).isActive = true

        dateTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        dateTF.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        dateTF.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 100).isActive = true
        dateTF.leadingAnchor.constraint(equalTo: placeTF.trailingAnchor, constant: 100).isActive = true

        timeTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        timeTF.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        timeTF.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 100).isActive = true
        timeTF.leadingAnchor.constraint(equalTo: dateTF.trailingAnchor, constant: 100).isActive = true
//
        
        
        greenView.addSubview(secondScrollView)
        secondScrollView.topAnchor.constraint(equalTo: greenView.topAnchor).isActive = true
        secondScrollView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor).isActive = true
        secondScrollView.leadingAnchor.constraint(equalTo: greenView.leadingAnchor).isActive = true
        secondScrollView.trailingAnchor.constraint(equalTo: greenView.trailingAnchor).isActive = true
        secondScrollView.contentSize = CGSize(width: (view.frame.width * 4), height: view.frame.height)
        
        view.addSubview(firstScrollView)
        firstScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        firstScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        firstScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        firstScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        firstScrollView.contentSize = CGSize(width: (view.frame.width * 2), height: view.frame.height)
        
        firstScrollView.addSubview(redView)
        redView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        redView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        
        firstScrollView.addSubview(greenView)
        greenView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        greenView.leadingAnchor.constraint(equalTo: redView.trailingAnchor).isActive = true
        
        

        redView.addSubview(helloLabel)
        helloLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        helloLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        helloLabel.topAnchor.constraint(equalTo: redView.topAnchor, constant: 200).isActive = true
        
        redView.addSubview(helloNextButton)
        helloNextButton.bottomAnchor.constraint(equalTo: redView.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        helloNextButton.leadingAnchor.constraint(equalTo: redView.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        helloNextButton.trailingAnchor.constraint(equalTo: redView.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        helloNextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        helloNextButton.backgroundColor = .gray

        
        
        
    }
    
    fileprivate func setupBottomControl() {
        let bottomControlStackView = UIStackView(arrangedSubviews: [prevButton, pageControl, nextButton])
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually

        greenView.addSubview(bottomControlStackView)

        NSLayoutConstraint.activate([
            bottomControlStackView.bottomAnchor.constraint(equalTo: greenView.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            bottomControlStackView.leadingAnchor.constraint(equalTo: greenView.leadingAnchor),
            bottomControlStackView.trailingAnchor.constraint(equalTo: greenView.trailingAnchor),
            bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    
    
    
    //MARK: UIScrollViewDelegate METHODS
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        pageControl.currentPage = Int((scrollView.contentOffset.x + (CGFloat(view.frame.width) / 2)) / CGFloat(view.frame.width))
        print(pageControl.currentPage)
        
    }

}

extension SwipeViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func setupGesture() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDown))
        swipeDown.delegate = self
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        view.addGestureRecognizer(swipeDown)
    }
    
    @objc func hideKeyboardOnSwipeDown() {
        view.endEditing(true)
    }
    
}
