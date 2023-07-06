//
//  User.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/4/23.
//

import Foundation

struct User: Codable {
    var name: String
    var email: String
    var password: String
}

func saveUserLocally(_ user: User, completion: @escaping (_ error: Error?) -> ()) {
    let encode = JSONEncoder()
    
    do {
        let data = try encode.encode(user)
        UserDefaults.standard.set(data, forKey: "currentUser")
        completion(nil)
    } catch {
        print("Error saving user data")
        completion(error)
    }
}
