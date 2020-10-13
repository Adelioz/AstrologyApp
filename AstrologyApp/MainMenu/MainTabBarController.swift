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
    
    override func viewWillLayoutSubviews() {
        if let items = self.tabBar.items {
            let viewTabBar = items[2].value(forKey: "view") as? UIView
            if viewTabBar?.subviews.count == 2 {
                let label = viewTabBar?.subviews[1]as? UILabel
                label?.numberOfLines = 2
                label?.textAlignment = .center
                label?.text = "Астрологический тест"
                items[2].imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -5, right: 0)
            }
        }
    }
    
    func setupTabBar() {
        
        //tabBar.barTintColor = .clear
        //tabBar.unselectedItemTintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.clipsToBounds = true
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        tabBar.backgroundColor = #colorLiteral(red: 0.08074066788, green: 0.08231648058, blue: 0.2913123071, alpha: 1)
        //let appearance = UITabBarAppearance
        
        
        
        //let mainVC = MainMenuViewController()//UINavigationController(rootViewController: MainMenuViewController())
        let mainVC = UINavigationController(rootViewController: MainMenuViewController())
        mainVC.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(named: "tabBarMain"), selectedImage: nil)
        
        let horoscopeVC = HoroscopeViewController()//UINavigationController(rootViewController: HoroscopeViewController())
        horoscopeVC.tabBarItem = UITabBarItem(title: "Гороскоп", image: UIImage(named: "tabBarHoro"), selectedImage: nil)
        
        let testVC = TestViewController()//UINavigationController(rootViewController: TestViewController())
        testVC.tabBarItem = UITabBarItem(title: "Астрологический тест", image: UIImage(named: "tabBarAstro"), selectedImage: nil)
        
        let moreVC = MoreViewController()//UINavigationController(rootViewController: MoreViewController())
        moreVC.tabBarItem = UITabBarItem(title: "Еще", image: UIImage(named: "tabBarOther"), selectedImage: nil)
        
        viewControllers = [mainVC, horoscopeVC, testVC, moreVC]
    }
    
    
    


}
