//
//  Constants.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/5/23.
//

import Foundation
import UIKit

struct Constants {
    
    struct Storyboard{
        static let main = "Main"
        static let home = "Home"
        static let payment = "Payment"
    }
    
    struct Identifiers {
        static let loginView = "LoginVC"
        static let homeView = "HomeVC"
        static let productDetails = "ProductDetailsID"
        static let cart = "CartId"
        static let addAddress = "AddAddressId"

        static let segueToItems = "gotToItems"
        
    }
    
    struct Colors {
        static let searchPlacHolder = #colorLiteral(red: 0.5778337717, green: 0.5778337717, blue: 0.5778337717, alpha: 1)
    }

    struct ErrorMessage {
        static let allFieldsRequired = "All fields are required"
        static let worngEmail = "Wrong email or passwrod"
        static let registeredBefore = "This email is registed before"

    }
    
    struct Categories {
        static let women = Category(title: "Women", color: #colorLiteral(red: 0.4, green: 0.4941176471, blue: 0.9176470588, alpha: 0.5043152058), image: UIImage(named: "Women"))
        static let men = Category(title: "Men", color: #colorLiteral(red: 1, green: 0.3450980392, blue: 0.3450980392, alpha: 0.4958588051), image: UIImage(named: "Men"))
        static let kids = Category(title: "Kids", color: #colorLiteral(red: 0.5886181593, green: 0.9536833167, blue: 0.7361328006, alpha: 0.500305681), image: UIImage(named: "Kids"))
    }
    
}

enum Sizes: String {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"

}

enum Colors: String {
    case brown = "Brown"
    case blue = "Blue"
    case red = "Red"

}


enum Keys: String {
    case currentUser = "currentUser"
    case cartItems = "KCARTITEMS"
    case storedImages = "StoredImages"
}

public let userDefaults = UserDefaults.standard
public let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext








