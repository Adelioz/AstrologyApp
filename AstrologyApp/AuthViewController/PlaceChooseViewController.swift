//
//  PlaceChooseViewController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 26.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit
import FirebaseFirestore

protocol GeoPointSendDelegate {
    func setGeo(city: String, geo: GeoPoint)
}

class PlaceChooseViewController: UIView {

    var geoSendDelegate: GeoPointSendDelegate!

    let urlBuilder = URLBuilder()
    let tableView = UITableView()
    let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.showsCancelButton = true
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    var geoPoint: GeoPoint?
    var city: String?
    
    var resultsArray: [Dictionary<String, AnyObject>] = Array()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
        searchSetup()
        tableViewSetup()
        animateIn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func tableViewSetup() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 65
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //tableView.estimatedRowHeight = 44.0
        
        
        
        container.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 20).isActive = true
        
        
    }
    
    func searchSetup() {
        searchBar.delegate = self
        
        container.addSubview(searchBar)
        searchBar.topAnchor.constraint(equalTo: container.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        searchBar.searchBarStyle = .minimal
        searchBar.becomeFirstResponder()
    }
    
    @objc func animateOut() {
        
        self.endEditing(true)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
            self.alpha = 0
        }) { (complete) in
            if complete {
                self.removeFromSuperview()
            }
        }
        
        print("pizdariki")
    }
    
    @objc func animateIn() {
        
        self.container.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
        self.alpha = 1
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = .identity
            self.alpha = 1
        })
    }
    
    func viewSetup() {
        //self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.animateOut)))
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        self.frame = UIScreen.main.bounds
        self.addSubview(container)
        
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95).isActive = true
        container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9).isActive = true
    }
    

}

extension PlaceChooseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let place = self.resultsArray[indexPath.row]
        cell?.textLabel?.text = "\(place["description"] as! String)"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let result = resultsArray[indexPath.row]
        print(result)
        let str = result["structured_formatting"] as! Dictionary<String, AnyObject>
        city = str["main_text"] as? String
        guard let city = city else { return }
        getLocation(city: city) { (geo) in

            self.geoSendDelegate.setGeo(city: city, geo: geo)
            print(city)
            //self.dismiss(animated: true, completion: nil)
            self.animateOut()
        }

        
        
    }
    
    
}

extension PlaceChooseViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //        searchCountry = countryNameArr.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        //        searching = true
        searchPlaceFromGoogle(place: searchText)
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //dismiss(animated: true, completion: nil)
        self.animateOut()
    }
    
}


extension PlaceChooseViewController {
    func searchPlaceFromGoogle(place: String) {
        
        let urlRequest = urlBuilder.buildURL(city: place)
        guard let ur = urlRequest else { print("HUI"); return }
        let task = URLSession.shared.dataTask(with: ur) { (data, response, error) in
            if error == nil {
                if let responseData = data {
                    let jsonDict = try? JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                    
                    if let dict = jsonDict as? Dictionary<String, AnyObject> {
                        
                        if let results = dict["predictions"] as? [Dictionary<String, AnyObject>] {
                            self.resultsArray.removeAll()
                            
                            for dct in results {
                                self.resultsArray.append(dct)
                            }
                        } else {
                            print("FUCK!!!")
                        }
                    }
                }
                
            } else {
                print(error?.localizedDescription)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            
            
        }
        task.resume()
    }
    
    func getLocation(city: String, completion: @escaping (GeoPoint) -> Void) {
        let urlRequest = urlBuilder.buildGetURL(city: city)
        guard let url = urlRequest else { print("HUI"); return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("PIZDA")
                return
            }
            
            if let responseData = data {
                let jsonDict = try? JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                
                if let dict = jsonDict as? Dictionary<String, AnyObject> {
                    
                    if let results = dict["results"] as? [Dictionary<String, AnyObject>] {
                        
                        //print("json == \(results)")
                        for dct in results {
                            if let geometry = dct["geometry"] as? Dictionary<String, AnyObject> {
                                let location = geometry["location"] as? Dictionary<String, AnyObject>
                                let lat = location!["lat"] as? Double
                                let lng = location!["lng"] as? Double
                                
                                let geo = GeoPoint(latitude: lat!, longitude: lng!)
                                DispatchQueue.main.async {
                                    completion(geo)
                                }//self.geoPoint = GeoPoint(latitude: lat!, longitude: lng!)
                            } else {
                                print("GEOMETRY ERROR")
                            }
                        }
                    } else {
                        print("FUCK!!!")
                    }
                }
            }
            
        }
        task.resume()
    }
    
}
