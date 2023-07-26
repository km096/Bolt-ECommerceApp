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
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        loginButton.tintColor = .white
        loginButton.addGradientBackground()
        loginButton.addCornerRadius(cornerRadius: 5)
        loginButton.setTitle("login".localized, for: .normal)

        signUpButton.setTitle("signup".localized, for: .normal)
    }
    
}

