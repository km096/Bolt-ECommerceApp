//
//  Language.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 8/10/23.
//

import UIKit


class Language: NSObject {
    
    open var languageCode: String
    open var language: String
    
    public static var emptyLanguage: Language {
        return Language(languageCode: "", language: "")
    }
    
    init(languageCode: String, language: String) {
        
        self.languageCode = languageCode
        self.language = language
    }
    
    open override var description: String{
        return self.languageCode + " " + self.language
    }
    
    
}
