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
        static let loginVC = "LoginVC"
        static let homeVC = "homeID"
        static let productDetails = "ProductDetailsID"
        static let ratePopUpView = "ratePopUpID"
        static let cart = "CartId"
        static let addAddress = "AddAddressId"
        static let getLocation = "getLocationID"
        static let payment = "paymentID"
        static let checkoutVC = "checkoutID"
        static let langugesVC = "langugesID"
        static let favoriteVC = "favoriteID"
        static let profileeVC = "profileID"
        static let editProfileVC = "editProfileID"
        static let confirmationVC = "confirmatioID"

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

struct Language {
    var languageCode: String
    var language: String
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
    case language = "kLanguage"
    case cartProductsKey = "KCARTITEMS"
    case storedImages = "StoredImages"
    case fileReferance = "gs://bolt-ecommerceapp.appspot.com"
    case selectedRow = "KSelectedRow"
}


public let userDefaults = UserDefaults.standard
public let managedContextAddress = AppDelegate.sharedAppDelegate.coreDataStackAddress.managedContext
public let managedContextProducts = AppDelegate.sharedAppDelegate.coreDataStackProducts.managedContext

public let descriptionText = "A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine."






