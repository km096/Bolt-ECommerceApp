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
}

enum LoginStatus: String {
    case login = "login"
    case register = "register"
}

public let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext




