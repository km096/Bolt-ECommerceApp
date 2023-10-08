//
//  ConfirmationVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 8/16/23.
//

import UIKit

class ConfirmationVC: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var confirmationLabel: UILabel!
    
    
    @IBOutlet weak var backToHomeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUIForConfirmationButton()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToHomeBtnPressed(_ sender: Any) {
        backToHomeScreen()
    }
    
    private func updateUIForConfirmationButton() {
        backToHomeButton.addGradientBackground()
        backToHomeButton.addCornerRadius(cornerRadius: 5)
        backToHomeButton.tintColor = .white
        backToHomeButton.setTitle("backToHome".localized, for: .normal)
    }
    
    //MARK: - Navigation
    private func backToHomeScreen() {
        guard let homeVC = instantiateVC(Constants.Storyboard.home, Constants.Identifiers.homeVC) as? HomeVC else {
            return
        }
        
        presentVC(homeVC)
    }

}
