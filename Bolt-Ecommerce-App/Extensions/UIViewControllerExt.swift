//
//  UIViewControllerExt.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/31/23.
//

import UIKit

extension UIViewController {
    
    func presentVC(_ viewControllerToPresent: UIViewController) {
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        viewControllerToPresent.modalTransitionStyle = .crossDissolve
        present(viewControllerToPresent, animated: true)
    }
   
}
