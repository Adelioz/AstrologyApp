//
//  MainTabBarController.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 29.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()

    }
    
    func setupTabBar() {
        let mainVC = UINavigationController(rootViewController: MainMenuViewController())
        mainVC.tabBarItem = UITabBarItem(title: "Menu", image: nil, selectedImage: nil)
        
        let horoscopeVC = UINavigationController(rootViewController: HoroscopeViewController())
        horoscopeVC.tabBarItem = UITabBarItem(title: "Horoscope", image: nil, selectedImage: nil)
        
        let testVC = UINavigationController(rootViewController: TestViewController())
        testVC.tabBarItem = UITabBarItem(title: "Test", image: nil, selectedImage: nil)
        
        let moreVC = UINavigationController(rootViewController: MoreViewController())
        moreVC.tabBarItem = UITabBarItem(title: "More", image: nil, selectedImage: nil)
        
        viewControllers = [mainVC, horoscopeVC, testVC, moreVC]
    }
    
    
    


}
