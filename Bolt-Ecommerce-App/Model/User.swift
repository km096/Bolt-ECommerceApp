//
//  User.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/4/23.
//

import Foundation
import FirebaseAuth
import FirebaseCore

struct User: Codable, Equatable {
    
    var id = ""
    var username: String
    var email: String
    
    static var currentId: String {
        return Auth.auth().currentUser!.uid
    }
    
    static var currentUser: User? {
        if Auth.auth().currentUser != nil {
            if let dictionary = UserDefaults.standard.data(forKey: Keys.currentUser.rawValue) {
                let decoder = JSONDecoder()
                do {
                    let userObject = try decoder.decode(User.self, from: dictionary)
                    return userObject
                } catch {
                    print("Error decoding user from user defaults : \(error.localizedDescription)")
                }
            }
        }
        return nil
    }
    
}

func saveUserLocally(_ user: User) {
    let encode = JSONEncoder()
    
    do {
        let data = try encode.encode(user)
        UserDefaults.standard.set(data, forKey: Keys.currentUser.rawValue)
    } catch {
        print("Error saving user data")
    }
}
