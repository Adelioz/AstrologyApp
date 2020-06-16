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

        scrollView.delegate = self
        view.backgroundColor = .white
        setupView()
        setupBottomControl()
        
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
        tf.backgroundColor = .yellow
        tf.font = UIFont.boldSystemFont(ofSize: 30)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    
    //MARK: ScrollView
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isPagingEnabled = true
        scroll.showsHorizontalScrollIndicator = false
        return scroll
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
        let nextIndex = min(pageControl.currentPage + 1, 3)
        scrollView.setContentOffset(CGPoint(x: (nextIndex * Int(view.frame.width)), y: 0), animated: true)
    }
    
    
    //MARK: SETUPS
    func setupView() {
        
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(placeLabel)
        scrollView.addSubview(dateLabel)
        scrollView.addSubview(timeLabel)
        
        
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        nameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 200).isActive = true
        
        
        placeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        placeLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        placeLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        placeLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 200).isActive = true
        //
        dateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: placeLabel.trailingAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 200).isActive = true
        //
        timeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 200).isActive = true
        
        
        scrollView.addSubview(nameTF)
        scrollView.addSubview(placeTF)
        scrollView.addSubview(dateTF)
        scrollView.addSubview(timeTF)
        
        nameTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameTF.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        nameTF.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 100).isActive = true
        nameTF.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 50).isActive = true
        
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
        
        
        
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        scrollView.contentSize = CGSize(width: (view.frame.width * 4), height: view.frame.height)
        
    }
    
    fileprivate func setupBottomControl() {
        let bottomControlStackView = UIStackView(arrangedSubviews: [prevButton, pageControl, nextButton])
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlStackView)
        
        NSLayoutConstraint.activate([
            bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomControlStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    
    
    
    //MARK: UIScrollViewDelegate METHODS
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        pageControl.currentPage = Int((scrollView.contentOffset.x + (CGFloat(view.frame.width) / 2)) / CGFloat(view.frame.width))
        
    }

}
