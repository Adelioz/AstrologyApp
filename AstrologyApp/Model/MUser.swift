//
//  MUser.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 19.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct MUser {
    var name: String
    var birthPlace: String
    var birthTimestamp: String
    var email: String
    var uid: String
    var sex: String = ""
    var geo: GeoPoint
    var isEdited: Bool = false
    
    init(name: String, birthTimestamp: String, email: String, uid: String, birthPlace: String, geo: GeoPoint, isEdited: Bool) {
        self.name = name
        self.birthTimestamp = birthTimestamp
        self.email = email
        self.uid = uid
        self.birthPlace = birthPlace
        self.geo = geo
        self.isEdited = isEdited
        
    }
    
    init?(document: DocumentSnapshot) {
        guard let data = document.data() else { return nil }
        guard let name = data["name"] as? String,
              let uid = data["uid"] as? String,
              let email = data["email"] as? String,
              let birthTimestamp = data["birthTimestamp"] as? String,
              let birthPlace = data["birthPlace"] as? String,
              let sex = data["sex"] as? String,
              let geo = data["geo"] as? GeoPoint,
              let isEdited = data["isEdited"] as? Bool else { return nil }
        
        self.name = name
        self.uid = uid
        self.email = email
        self.birthTimestamp = birthTimestamp
        self.birthPlace = birthPlace
        self.sex = sex
        self.geo = geo
        self.isEdited = isEdited
    }
    
    var representation: [String: Any] {
        var rep = [String: Any]()
        rep["name"] = name
        rep["birthPlace"] = birthPlace
        rep["birthTimestamp"] = birthTimestamp
        rep["email"] = email
        rep["uid"] = uid
        rep["sex"] = sex
        rep["geo"] = geo
        rep["isEdited"] = isEdited
        return rep
    }
    
}
