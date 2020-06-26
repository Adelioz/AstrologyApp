//
//  FirestoreService.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 20.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase

class FirestoreService {
    
    static let shared = FirestoreService()
    
    let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    func saveProfileWith(uid: String, email: String, name: String?, birthPlace: String?, birthTimestamp: String?, completion: @escaping (Result<MUser, Error>) -> Void) {
        
        guard Validators.isFilled(name: name, birthPlace: birthPlace, birthTimestamp: birthTimestamp) else {
            completion(.failure(UserError.notFilled))
            return
        }
        
        let muser = MUser(name: name!,
                          birthTimestamp: birthTimestamp!,
                          email: email,
                          uid: uid,
                          birthPlace: birthPlace!)
        
        self.usersRef.document(muser.uid).setData(muser.representation) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(muser))
            }
            
        }
        
    }
    
    func getUserData(user: User, completion: @escaping (Result<MUser, Error>) -> Void) {
        let docRef = usersRef.document(user.uid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                guard let muser = MUser(document: document) else {
                    completion(.failure(UserError.cannotUnwrapToMUser))
                    return
                }
                completion(.success(muser))
            } else {
                completion(.failure(UserError.cannotGetUserInfo))
            }
        }
    }
//    private var usersRef: CollectionReference {
//        return db.collection("users")
//    }
//
//    func getUserData(user: User, completion: @escaping (Result<MUser, Error>) -> Void) {
//        let docRef = usersRef.document(user.uid)
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                guard let muser = MUser(document: document) else {
//                    completion(.failure(UserError.cannotUnwrapToMUser))
//                    return
//                }
//                completion(.success(muser))
//            } else {
//                completion(.failure(UserError.cannotGetUserInfo))
//            }
//        }
//    }
//
//    func saveProfileWith(id: String, email: String, name: String?, birthDate: String?, birthTime: String?, completion: @escaping (Result<MUser, Error>) -> Void) {
//
//        guard Validators.isFilled(name: name, birthDate: birthDate, birthTime: birthTime) else {
//            completion(.failure(UserError.notFilled))
//            return
//        }
//
//        let muser = MUser(name: name!,
//                          birthDate: birthDate!,
//                          birthTime: birthTime!,
//                          email: email,
//                          uid: id)
//
//        self.usersRef.document(muser.uid).setData(muser.representation) { (error) in
//            if let error = error {
//                completion(.failure(error))
//            } else {
//                completion(.success(muser))
//            }
//        }
//
//    }
    
    
}
