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
        static let sideMenu = "SideMenu"
        
    }
    
    struct Identifiers {
        static let loginView = "LoginVC"
        static let homeView = "HomeVC"
        static let productDetails = "ProductDetailsID"
        static let cart = "CartId"
        static let addAddress = "AddAddressId"
        static let getLocation = "getLocationID"
        static let checkout = "checkoutID"
        static let langugesVC = "langugesID"
        static let favoriteVC = "favoriteID"


        //Segues
        static let segueToProducts = "gotToProducts"
        static let segueToPayment = "gotToPayment"
        
    }
    
    struct Colors {
        static let searchPlacHolder = #colorLiteral(red: 0.5778337717, green: 0.5778337717, blue: 0.5778337717, alpha: 1)
        static let textColor = #colorLiteral(red: 0.4242071807, green: 0.528095901, blue: 0.8550408483, alpha: 1)
    }

    struct ErrorMessage {
        static let allFieldsRequired = "All fields are required"
        static let worngEmail = "Wrong email or passwrod"
        static let registeredBefore = "This email is registed before"
        static let addressExsitedBefore = "This address exsited before"
    }
    
    struct Categories {
        static let women = Category(title: "Women", color: #colorLiteral(red: 0.4, green: 0.4941176471, blue: 0.9176470588, alpha: 0.5043152058), image: UIImage(named: "Women"))
        static let men = Category(title: "Men", color: #colorLiteral(red: 1, green: 0.3450980392, blue: 0.3450980392, alpha: 0.4958588051), image: UIImage(named: "Men"))
        static let kids = Category(title: "Kids", color: #colorLiteral(red: 0.5886181593, green: 0.9536833167, blue: 0.7361328006, alpha: 0.500305681), image: UIImage(named: "Kids"))
    }
    
}

enum Size: String {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"

}

enum Color: String {
    case brown = "Brown"
    case blue = "Blue"
    case red = "Red"

}


enum Key: String {
    case currentUser = "currentUser"
    case cartItems = "KCARTITEMS"
    case storedImages = "StoredImages"
    case fileReferance = "gs://bolt-ecommerceapp.appspot.com"
}

public let currentLang = Locale.current.language.languageCode?.identifier

public let userDefaults = UserDefaults.standard

public let managedContextCartItems = AppDelegate.sharedAppDelegate.coreDataStackCartItems.managedContext
public let managedContextAddress = AppDelegate.sharedAppDelegate.coreDataStackAddress.managedContext








