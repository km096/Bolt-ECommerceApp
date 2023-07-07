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
    }
    
    struct Identifiers {
        static let loginView = "LoginVC"
        static let homeView = "HomeVC"
    }
    
    struct Colors {
        static let searchPlacHolder = #colorLiteral(red: 0.5778337717, green: 0.5778337717, blue: 0.5778337717, alpha: 1)
    }

    struct Images {
        static let menu = UIImage(named: "menu_bar")
        static let backArrow = UIImage(named: "back_arrow")

    }

    struct ErrorMessage {
        static let allFieldsRequired = "All fields are required"
        static let worngEmail = "Wrong email or passwrod"
        static let registeredBefore = "This email is registed before"

    }
    
    struct Category {
        
        struct Title {
            static let women = "Women"
            static let men = "Men"
            static let kids = "Kids"
        }
        
        struct Colors {
            static let women = #colorLiteral(red: 0.4, green: 0.4941176471, blue: 0.9176470588, alpha: 0.5043152058)
            static let men = #colorLiteral(red: 1, green: 0.3450980392, blue: 0.3450980392, alpha: 0.4958588051)
            static let kids = #colorLiteral(red: 0.5886181593, green: 0.9536833167, blue: 0.7361328006, alpha: 0.500305681)
        }
    }
    
    struct HomeCategory {
        
        struct Titles {
            static let woman = "Woman T-Shirt"
            static let man = "Man T-Shirt"
        }
        
        struct Prices {
            static let woman = "$55.00"
            static let man = "$34.00"
        }
        
        struct Featured {
            
            
            
        }
    }
    
    
}

enum LoginStatus: String {
    case login = "login"
    case register = "register"
}

//enum Category{
//    case featured
//    case bestSell
//
//}

enum Keys: String {
    case currentUser = "currentUser"
}

public let userDefaluts = UserDefaults.standard


struct HomeCategory {
//    var id: [Int]?
    var title: String?
    var price: String?
    var imageName: String?
    
    init(title: String?, price: String?, imageName: String?) {
//        self.id = id
        self.title = title
        self.price = price
        self.imageName = imageName
    }
}


//var id = Array(0...9)
//var titles: [String] = ["Woman T-Shirt", "Man T-Shirt", "T-Shirt", "Shirt"]
//var prices: [String] = ["$34.00", "$55.00", "$34.00", "$55.00"]
//var imageName: [String] = ["WomanT-Shirt", "ManT-Shirt", "WomanT-Shirt1", "WomanT-Shirt2", "ManT-Shirt", "Blazer", "T-Shirt", "Shirt"]

//let featured = HomeCategory(id: id, title: titles, price: prices, imageName: imageName)

let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext


