//
//  AppDelegate.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 16.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        

        if let user = Auth.auth().currentUser {
            FirestoreService.shared.getUserData(user: user) { (result) in
                switch result {

                case .success(let muser):
                    UserSettings.shared.saveProfile(name: muser.name,
                                                    birthPlace: muser.birthPlace,
                                                    birthTimestamp: muser.birthTimestamp,
                                                    sex: muser.sex,
                                                    mail: muser.email,
                                                    isEdited: muser.isEdited)
                case .failure(let error):
                    print("ВСЕ ПОШЛО ПО ПИЗДЕ")
                    print(error.localizedDescription)
                }
            }
        }
        
        //window?.rootViewController = SwipeViewController(currentUser: Auth.auth().currentUser!)
        window?.rootViewController = MainTabBarController()
        
        var navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
//        let helloViewController = RegistrationViewController()
//        window?.rootViewController = helloViewController
        
//        print(Auth.auth().currentUser?.email)
//        if let user = Auth.auth().currentUser {
//            FirestoreService.shared.getUserData(user: user) { (result) in
//                switch result {
//
//                case .success(let muser):
//                    self.window?.rootViewController = MainTabBarController()
//                case .failure(let error):
//                    self.window?.rootViewController = helloViewController
//                }
//            }
//        } else {
//            window?.rootViewController = helloViewController
//        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

