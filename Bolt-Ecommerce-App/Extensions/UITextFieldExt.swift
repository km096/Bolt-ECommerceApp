//
//  UITextFieldExt.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/5/23.
//

import UIKit

extension UITextField {
    
    func updatePlaceholder(_ color: UIColor) {
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [.foregroundColor: color])

        self.placeholder = "searchProduct".localized
    }
}
