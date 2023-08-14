//
//  Languages.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 8/10/23.
//

import UIKit

class Languages: NSObject {
    
    fileprivate(set) static var languages: [Language] = {
        
        var languages = [Language]()
        languages.append(Language(languageCode: "en", language: "English"))
        languages.append(Language(languageCode: "ar", language: "Arabic"))

        return languages
    }()
    
    class func isLanguageAvailable(_ code: String) -> Bool {
        for language in languages {
            if code == language.languageCode {
                return true
            }
        }
        return false
    }
    
    class func getLanguageFrom(languageCode code: String) -> Language {

        for language in languages {
            if code == language.languageCode {
                return language
            }
        }
        return Language.emptyLanguage
    }
}

