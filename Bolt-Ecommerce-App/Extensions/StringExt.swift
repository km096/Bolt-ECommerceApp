//
//  StringExt.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/12/23.
//

import Foundation

extension String {
    
    var localized: String {
//        return LocalizationManager.shared.localizedString(forKey: self, value: "")
        return NSLocalizedString(self, comment: "")
    }
    
}
