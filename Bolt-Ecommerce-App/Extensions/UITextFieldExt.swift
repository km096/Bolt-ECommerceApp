//
//  UITextFieldExt.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/5/23.
//

import UIKit

extension UITextField {
    
    func updatePlaceholder() {

        self.textAlignment = getCurrentLanguage() == "en" ? .left : .right

    }
}
