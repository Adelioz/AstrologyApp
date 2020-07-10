//
//  UserSettings.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 01.07.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import Foundation
import Firebase

struct UserUD: Codable {
    var name: String
    var birthPlace: String
    var birthTimestamp: String
    var email: String
    var sex: String
    var isEdited: Bool
    
    init(name: String, birthPlace: String, birthTimestamp: String, sex: String?, email: String, isEdited: Bool) {
        self.name = name
        self.birthPlace = birthPlace
        self.birthTimestamp = birthTimestamp
        if let sex = sex {
            self.sex = sex
        } else {
            self.sex = ""
        }
        self.email = email
        self.isEdited = isEdited
    }
    
    static func ==(lhs: UserUD, rhs: UserUD) -> Bool {
        if lhs.name == rhs.name,
            lhs.birthPlace == rhs.birthPlace,
            lhs.birthTimestamp == rhs.birthTimestamp,
            lhs.sex == rhs.sex,
            lhs.email == rhs.email,
            lhs.isEdited == rhs.isEdited {
            return true
        } else {
            return false
        }
    }
    
}

class UserSettings {
    
    static let shared = UserSettings()
    let defaults = UserDefaults.standard
    
    func getProfile() -> UserUD? {
        if let savedPers = defaults.object(forKey: "user") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(UserUD.self, from: savedPers) {
                return loadedPerson
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    func saveProfile(name: String, birthPlace: String, birthTimestamp: String, sex: String?, mail: String, isEdited: Bool) {
        let user = UserUD(name: name, birthPlace: birthPlace, birthTimestamp: birthTimestamp, sex: sex, email: mail, isEdited: isEdited)
        let encoder = JSONEncoder()
        
        if let currUser = getProfile() {
            if currUser == user {
                return
            } else {
                
                defaults.removeObject(forKey: "user")
                if let encoded = try? encoder.encode(user) {
                    defaults.set(encoded, forKey: "user")
                }
                
            }
        } else {
            if let encoded = try? encoder.encode(user) {
                defaults.set(encoded, forKey: "user")
            }
        }
        
        
        
    }
    
}
