//
//  HoroscopeViewController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 29.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class HoroscopeViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        setupBackgroundImage()
        
        setupScrollView()
        setupLabel()
        setupPeriodButtons()
        setupCollectionViewView()
        setupTableView()
        setupSignTableCell()
        
        
        
        //setupHoroscopeTexts()
        
    }
    
    
    //MARK: - Scroll View
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        //scroll.isPagingEnabled = true
        scroll.bounces = true
        
        scroll.showsHorizontalScrollIndicator = true
        return scroll
    }()
    
    let viewScrollView = UIView()

    func setupScrollView() {
        view.addSubview(scrollView)
        //scrollView.topAnchor.constraint(equalTo: horoLabel.bottomAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.contentSize = CGSize(width: view.frame.width, height: (view.frame.height * 3))
        //scrollView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
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
    
    
    //MARK: - horoLabel
    let horoLabel = SwipeLabel(with: "Гороскоп")
    func setupLabel() {
        scrollView.addSubview(horoLabel)
        
        scrollView.addSubview(horoLabel)
        horoLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: view.frame.height * 50/812).isActive = true
        horoLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: view.frame.width * 16/375).isActive = true

    }
    
    //MARK: - Period buttons
    
    let todayButton = LineButton(labelText: "Сегодня")
    let weekButton = LineButton(labelText: "Неделя")
    let monthButton = LineButton(labelText: "Месяц")
    
    func setupPeriodButtons() {
        
        let stack = UIStackView(arrangedSubviews: [todayButton, weekButton, monthButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 10
        
        
        scrollView.addSubview(stack)
        stack.topAnchor.constraint(equalTo: horoLabel.bottomAnchor, constant: view.frame.height * 30/812).isActive = true
        stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 35/375 * view.frame.width).isActive = true
        //stack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 231/375).isActive = true
    }
    
    //MARK: - Signs Table Cell
    
    let signTableCell: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "sign")
        return table
    }()
    
    func setupSignTableCell() {
        signTableCell.delegate = self
        signTableCell.dataSource = self
        signTableCell.register(SignTableViewCell.self, forCellReuseIdentifier: "sign")
        signTableCell.backgroundColor = .clear
        signTableCell.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        collectionViewView.addSubview(signTableCell)
        signTableCell.heightAnchor.constraint(equalTo: collectionViewView.heightAnchor).isActive = true
        signTableCell.widthAnchor.constraint(equalTo: collectionViewView.widthAnchor).isActive = true
//        signTableCell.topAnchor.constraint(equalTo: collectionViewView.topAnchor).isActive = true
//        signTableCell.bottomAnchor.constraint(equalTo: collectionViewView.bottomAnchor).isActive = true
//        signTableCell.leadingAnchor.constraint(equalTo: collectionViewView.leadingAnchor).isActive = true
//        signTableCell.trailingAnchor.constraint(equalTo: collectionViewView.trailingAnchor).isActive = true
    }
    
    //MARK: - Collection View View
    
    var collectionViewView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    func setupCollectionViewView() {
        scrollView.addSubview(collectionViewView)
        collectionViewView.topAnchor.constraint(equalTo: todayButton.bottomAnchor, constant: 5).isActive = true
        collectionViewView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        collectionViewView.heightAnchor.constraint(equalToConstant: 110/812 * view.frame.height).isActive = true
        
    }

    
    
    //MARK: - Horo Table View
    
    let horoTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        return table
    }()
    
    func setupTableView() {
        horoTableView.delegate = self
        horoTableView.dataSource = self
        horoTableView.register(HoroTableViewCell.self, forCellReuseIdentifier: "tableCell")
        horoTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        horoTableView.estimatedRowHeight = UITableView.automaticDimension
        
        scrollView.addSubview(horoTableView)
        horoTableView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        horoTableView.topAnchor.constraint(equalTo: collectionViewView.bottomAnchor, constant: 10).isActive = true
        horoTableView.heightAnchor.constraint(equalToConstant: 1600).isActive = true
        horoTableView.isScrollEnabled = false
        
        setupHoroCellText()
        
    }
    
//    var textArray = "Загрузка..."
//
//    func setupHoroscopeTexts() {
//        DispatchQueue.main.async {
//            HoroscopeSoup.shared.setup { (str) in
//                self.textArray = str
//                //self.horoTableView.reloadData()
//                self.horoTableView.beginUpdates()
//                self.horoTableView.endUpdates()
//
//
//
//            }
//
//        }
//
//
//    }
    
    
    
    var horoText = "Загрузка..."
    
    func setupHoroCellText() {
        
        que.async {
            HoroscopeSoup.shared.setup(sign: self.cells[0].name) { (str) in
                self.horoText = str
                DispatchQueue.main.async {
                    self.horoTableView.reloadData()
                }
            }
        }
    }
    
    var cells = SignCellModel.fetchSign()

    lazy var que: DispatchQueue = {
        return DispatchQueue.init(label: "VC.background", attributes: .concurrent)
    }()
    
}

//MARK: - Table View Extension
extension HoroscopeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == horoTableView {
            return 1
        } else

        if tableView == signTableCell {
            return 1
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == horoTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! HoroTableViewCell
            cell.cellDelegate = self
            cell.setup(frameWidth: view.bounds.width * 335/375)
            cell.label.text = "Гороскоп"
            cell.textView.text = horoText
            
//            DispatchQueue.main.async {
//                HoroscopeSoup.shared.setup { (str) in
//                    cell.textView.text = str
//                    //self.horoTableView.reloadData()
//                    self.horoTableView.beginUpdates()
//                    self.horoTableView.endUpdates()
//                }
//
//            }
            
            return cell
        }
        else if tableView == signTableCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "sign", for: indexPath) as! SignTableViewCell
            cell.collection.updateHoroDelegate = self
            cell.setupSign()
            return cell
        } else {
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == signTableCell {
            return collectionViewView.frame.height
        } else {
            return UITableView.automaticDimension//210
        }
    }
    
    
    
    
}

//MARK: - Collection View Extension
extension HoroscopeViewController: UICollectionViewDataSource, UICollectionViewDelegate {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }

    



}

extension HoroscopeViewController: GrowingCellProtocol {

    func updateHeightOfRow(_ cell: HoroTableViewCell, textView: UITextView) {
        let size = textView.bounds.size
        let newSize = horoTableView.sizeThatFits(CGSize(width: size.width, height: CGFloat.greatestFiniteMagnitude))
        if size.height != newSize.height {
//            UIView.setAnimationsEnabled(false)
//            horoTableView.beginUpdates()
//            horoTableView.endUpdates()
//            UIView.setAnimationsEnabled(true)
            if let thisIndexPath = horoTableView.indexPath(for: cell) {
                horoTableView.scrollToRow(at: thisIndexPath, at: .bottom, animated: false)
            }
        }


    }


}

extension HoroscopeViewController: UpdateHoroDelegate {
    
    func updateHoro(indexPath: IndexPath) {
        horoText = "Загрузка..."
        horoTableView.reloadData()
//        DispatchQueue.main.async {
//            HoroscopeSoup.shared.setup(sign: self.cells[indexPath.row].name) { (str) in
//                        self.horoText = str
//                        //self.horoTableView.reloadData()
//                        self.horoTableView.beginUpdates()
//                        self.horoTableView.endUpdates()
//                        //self.horoTableView.reloadData()
//                    }
//
//            }
        que.async {
            HoroscopeSoup.shared.setup(sign: self.cells[indexPath.row].name) { (str) in
                self.horoText = str
                //self.horoTableView.reloadData()
//              self.horoTableView.beginUpdates()
//              self.horoTableView.endUpdates()
                //self.horoTableView.reloadData()
                DispatchQueue.main.async {
                    self.horoTableView.reloadData()
                }
            }
        }
    }
    
    
}
