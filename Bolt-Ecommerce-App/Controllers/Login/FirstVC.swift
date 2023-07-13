//
//  ViewController.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/4/23.
//

import UIKit

class FirstVC: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.addCornerRadius(cornerRadius: 5)
        loginButton.addGradientBackground()

    }
    
//    private func localizeView() {
//
//    }
    
}

