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

class PlaceChooseViewController: UIViewController {

    var geoSendDelegate: GeoPointSendDelegate!

    let urlBuilder = URLBuilder()
    let tableView = UITableView()
    let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.showsCancelButton = true
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    var geoPoint: GeoPoint?
    var city: String?
    
    var resultsArray: [Dictionary<String, AnyObject>] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchSetup()
        tableViewSetup()
    }
    
    func tableViewSetup() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 65
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //tableView.estimatedRowHeight = 44.0
        
        
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }
    
    func searchSetup() {
        searchBar.delegate = self
        
        view.addSubview(searchBar)
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
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
        //print(resultsArray[indexPath.row])
        let result = resultsArray[indexPath.row]
        let str = result["structured_formatting"] as! Dictionary<String, AnyObject>
        city = str["main_text"] as? String
        guard let city = city else { return }
        getLocation(city: city) { (geo) in
            print(geo)
            print(city)
            self.geoSendDelegate.setGeo(city: city, geo: geo)
            self.dismiss(animated: true, completion: nil)
        }

        //guard let geo = geoPoint else { print("ЕБТВОЮМАТЬ"); return }
        
    }
    
    
}

extension PlaceChooseViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //        searchCountry = countryNameArr.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        //        searching = true
        searchPlaceFromGoogle(place: searchText)
        //print(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true, completion: nil)
        
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
                        print(dict)
                        if let results = dict["predictions"] as? [Dictionary<String, AnyObject>] {
                            self.resultsArray.removeAll()
                            //print("json == \(results)")
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
