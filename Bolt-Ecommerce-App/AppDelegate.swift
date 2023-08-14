//
//  AppDelegate.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/4/23.
//

import UIKit
import MOLH
import FirebaseCore
import FBSDKCoreKit


@main
//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, MOLHResetable {


    var window: UIWindow?
    
    lazy var coreDataStackAddress: CoreDataStack = .init(modelName: "Address")
    lazy var coreDataStackProducts: CoreDataStack = .init(modelName: "Products")
    
      static let sharedAppDelegate: AppDelegate = {
          guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
              fatalError("Unexpected app delegate type, did it change? \(String(describing: UIApplication.shared.delegate))")
          }
          return delegate
      }()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        MOLHLanguage.setDefaultLanguage("en")
        MOLH.shared.activate(true)
//        setDefaultLanguage()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func reset() {
        let storyboard = UIStoryboard(name: Constants.Storyboard.home, bundle: Bundle.main)
        let rootController = storyboard.instantiateViewController(withIdentifier: Constants.Identifiers.homeVC) as? HomeVC
        
          window?.rootViewController = rootController
        
        
    }
    
//    func setDefaultLanguage() {
//        if let selectedLanguage = LocalizationManager.shared.getLanguage() {
//            LocalizationManager.shared.setLanguage(language: selectedLanguage)
//        } else {
//            let languageCode = Locale.preferredLanguages[0]
//            if Languages.isLanguageAvailable(languageCode) {
//                LocalizationManager.shared.setLanguage(language: languageCode)
//            } else {
//                LocalizationManager.shared.setLanguage(language: "en")
//            }
//        }
//        self.initRootView()
//        
//    }
//    
//    func initRootView() {
//        let direction = LocalizationManager.shared.getLanguageDirections()
//        if direction == .leftToRight {
//            let semantic: UISemanticContentAttribute = .forceLeftToRight
//            UITabBar.appearance().semanticContentAttribute = semantic
//            UIView.appearance().semanticContentAttribute = semantic
//            UINavigationBar.appearance().semanticContentAttribute = semantic
//
//        } else {
//            let semantic: UISemanticContentAttribute = .forceRightToLeft
//            UITabBar.appearance().semanticContentAttribute = semantic
//            UIView.appearance().semanticContentAttribute = semantic
//            UINavigationBar.appearance().semanticContentAttribute = semantic
//
//        }
//        
//        let storyboard = UIStoryboard(name: Constants.Storyboard.main, bundle: Bundle.main)
//        let rootController = storyboard.instantiateViewController(withIdentifier: "NavID") as? UINavigationController
//        
//          window?.rootViewController = rootController
//    }

          

            
}

