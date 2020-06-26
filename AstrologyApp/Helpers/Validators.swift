//
//  Validators.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 20.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import UIKit

class Validators {
    static func isFilled(email: String?, password: String?, confPassword: String?) -> Bool {
        guard let password = password,
            let confPassword = confPassword,
            let email = email,
            password != "",
            confPassword != "",
            email != "" else {
                return false
        }
        
        return true
    }
    
    static func isFilled(name: String?, birthPlace: String?, birthTimestamp: String?) -> Bool {
        guard let birthPlace = birthPlace,
            let birthTimestamp = birthTimestamp,
            let name = name,
            birthPlace != "",
            birthTimestamp != "",
            name != "" else {
                return false
        }
        
        return true
    }
    
    static func isSimpleEmail(_ email: String) -> Bool {
        let emailRegEx = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailRegEx)
    }
    
    private static func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
}
