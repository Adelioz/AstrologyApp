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
        
        setupBackgroundImage()
        setupScrollView()
        
        //setupPrevButton()
        //setupTitleLabel()
        setupTopView()
        setupPercentView()
        
        
        title = titleLabel.text
        
        setupSovmestTableView()
        
        //setupView()
        //vc.horoSendDelegate = self
        // Do any additional setup after loading the view.
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
    
    
    //MARK: - Scroll View
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.bounces = true
        
        scroll.showsHorizontalScrollIndicator = true
        return scroll
    }()

    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.contentSize = CGSize(width: view.frame.width, height: (view.frame.height * 3))
        
        //scrollView.contentSize = CGSize(width: view.frame.width, height: scrollView.frame.size.height)
    }
    
    //MARK: - Previous Button
    
    let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "pathBack"), for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    @objc private func handlePrev() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupPrevButton() {
//        scrollView.addSubview(prevButton)
//        prevButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        
        scrollView.addSubview(prevButton)
        prevButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        prevButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        prevButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        prevButton.widthAnchor.constraint(equalTo: prevButton.heightAnchor, multiplier: 10/21).isActive = true
    }
    
    //MARK: - Title
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Совместимость по знакам зодиака"
        label.font = UIFont(name: "SFProText-Semibold", size: 17)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    func setupTitleLabel() {
        scrollView.addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: prevButton.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    }
    
    
    //MARK: - Left Sign View
    
    let leftSignView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        label.text = "Рыбы"
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
        leftSignLabel.text = horo?.leftSign.name
        
        leftSignView.addSubview(leftSignImage)
        leftSignImage.image = horo?.leftSign.image.tintedWithLinearGradientColors(colorsArr: [#colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1), #colorLiteral(red: 0.568627451, green: 0.5607843137, blue: 0.9294117647, alpha: 1)])
        leftSignImage.widthAnchor.constraint(equalTo: leftSignView.widthAnchor, multiplier: 61/163).isActive = true
        leftSignImage.heightAnchor.constraint(equalTo: leftSignImage.widthAnchor).isActive = true
        leftSignImage.centerXAnchor.constraint(equalTo: leftSignView.centerXAnchor).isActive = true
        leftSignImage.centerYAnchor.constraint(equalTo: leftSignView.centerYAnchor, constant: -8).isActive = true
    }
    
    
    
    //MARK: - Right Sign View
    
    let rightSignView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        label.text = "Телец"
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
        rightSignLabel.text = horo?.rightSign.name
        
        rightSignView.addSubview(rightSignImage)
        rightSignImage.image = horo?.rightSign.image.tintedWithLinearGradientColors(colorsArr: [#colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1), #colorLiteral(red: 0.568627451, green: 0.5607843137, blue: 0.9294117647, alpha: 1)])
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
        scrollView.addSubview(topView)
        topView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5).isActive = true
        topView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
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
    
    
    //MARK: - Percent View
    
    let percentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 7
        return view
    }()
    
    let scalePercentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scalePercentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Lato-Bold", size: 13)
        label.textColor = #colorLiteral(red: 0.5529411765, green: 0.5450980392, blue: 1, alpha: 1)
        label.text = "100%"
        return label
    }()
    
    func setupPercentView() {
        view.addSubview(percentView)
        percentView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 335/375).isActive = true
        percentView.heightAnchor.constraint(equalTo: percentView.widthAnchor, multiplier: 43/335).isActive = true
        percentView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 18).isActive = true
        percentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        var percent = horo!.percent
        percent = String(percent.dropLast())
        let intPercent = CGFloat(integerLiteral: Int(percent)!)
        
        
        percentView.addSubview(scalePercentView)
        scalePercentView.frame = CGRect(x: 0, y: 0, width: view.frame.width * 280/375, height: view.frame.width * 17/375)
        scalePercentView.centerYAnchor.constraint(equalTo: percentView.centerYAnchor).isActive = true
        scalePercentView.heightAnchor.constraint(equalTo: percentView.heightAnchor, multiplier: 17/43).isActive = true
        scalePercentView.leadingAnchor.constraint(equalTo: percentView.leadingAnchor, constant: 10).isActive = true
        scalePercentView.widthAnchor.constraint(equalToConstant: view.frame.width * 280/375 * intPercent/100).isActive = true
        scalePercentView.layer.cornerRadius = scalePercentView.frame.height / 2
        scalePercentView.clipsToBounds = true
        scalePercentView.setGradientBackground(colorOne: #colorLiteral(red: 0.568627451, green: 0.5607843137, blue: 0.9294117647, alpha: 1), colorTwo: #colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1), horizontal: true)
        
        
        
        percentView.addSubview(scalePercentLabel)
        scalePercentLabel.centerYAnchor.constraint(equalTo: percentView.centerYAnchor).isActive = true
        scalePercentLabel.trailingAnchor.constraint(equalTo: percentView.trailingAnchor, constant: -10).isActive = true
        scalePercentLabel.text = horo?.percent
        
        
        scalePercentView.clipsToBounds = true
        
    }
    
    //MARK: - Sovmest Table View
    
    let sovmestTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        return table
    }()
    
    func setupSovmestTableView() {
        sovmestTableView.delegate = self
        sovmestTableView.dataSource = self
        sovmestTableView.register(HoroTableViewCell.self, forCellReuseIdentifier: "sovmestTableCell")
        sovmestTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        sovmestTableView.isScrollEnabled = false
        
        
        scrollView.addSubview(sovmestTableView)
        sovmestTableView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        sovmestTableView.topAnchor.constraint(equalTo: percentView.bottomAnchor, constant: 10).isActive = true
        //sovmestTableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        sovmestTableView.heightAnchor.constraint(equalToConstant: 2500).isActive = true
        
    }
    
    
    
    
    

    
//    override func viewWillAppear(_ animated: Bool) {
//        self.sovmestTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
//        sovmestTableView.reloadData()
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        self.sovmestTableView.removeObserver(self, forKeyPath: "contentSize")
//    }
//
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "contentSize" {
//            if let newValue = change?[.newKey] {
//                let newSize = newValue as! CGSize
//                self.sovmestTableView.heightAnchor.constraint(equalToConstant: newSize.height).isActive = true
//            }
//        }
//    }

    
}

extension SovmestimostSecondVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sovmestTableCell", for: indexPath) as! HoroTableViewCell
        cell.setup(frameWidth: view.bounds.width * 335/375)
        cell.textView.text = horo?.loveTitle
        switch indexPath.row {
        case 0:
            cell.label.text = "Любовь"
            cell.textView.text = horo?.loveTitle
        case 1:
            cell.label.text = "Секс"
            cell.textView.text = horo?.sexTitle
        case 2:
            cell.label.text = "Семья"
            cell.textView.text = horo?.famTitle
        case 3:
            cell.label.text = "Дружба"
            cell.textView.text = horo?.friendTitle
        case 4:
            cell.label.text = "Работа"
            cell.textView.text = horo?.workTitle
        default:
            return cell
        }
        return cell
    }


}
