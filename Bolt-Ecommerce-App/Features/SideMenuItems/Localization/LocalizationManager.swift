////
////  Locallization.swift
////  Bolt-Ecommerce-App
////
////  Created by ME-MAC on 8/10/23.
////
//
//import Foundation
//
//class LocalizationManager: NSObject {
//    
//    static let shared = LocalizationManager()
//    
//    var bundle: Bundle? = nil
//    var languagueDirection = LanguageDirection(rawValue: 1)
//    
//    // Get direction of language
//    func getLanguageDirections() -> LanguageDirection {
//        if languagueDirection?.rawValue == 0 {
//            return .leftToRight
//        } else if getLanguage() == "ar" {
//            return .rightToLeft
//        } else{
//            return .leftToRight
//        }
//    }
//    
//    func localizedString(forKey key: String, value comment: String) -> String {
//        let localized = bundle!.localizedString(forKey: key, value: comment, table: nil)
//        return localized
//    }
//    
//    // set language for localization
//    func setLanguage(language: String) {
//        var selectedLanguage = language
//        if language.count == 0 {
//            selectedLanguage = "en"
//        }
//        UserDefaults.standard.set(selectedLanguage, forKey: Key.language.rawValue)
//        UserDefaults.standard.synchronize()
//        let path: String? = Bundle.main.path(forResource: selectedLanguage, ofType: "lproj")
//        if path == nil {
//            //in case the language does not exists
//            resetLocalization()
//        } else {
//            bundle = Bundle(path: path!)
//        }
//    }
//    
//    // reset bundle
//    func resetLocalization() {
//        bundle = Bundle.main
//    }
//    
//    // get selected language from UserDefaults
//    func getLanguage() -> String? {
//        if let language = UserDefaults.standard.string(forKey: Key.language.rawValue) {
//            return language
//        }
//        return nil
//    }
//    
////    func loclizeString(key: Any, comment: Any) -> String {
////        return LocalizationManager.shared.localizedString(forKey: key as! String, value: comment as! String)
////    }
//}
//
