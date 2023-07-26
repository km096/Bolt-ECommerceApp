//
//  CheckoutVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/26/23.
//

import UIKit
import CoreData

class CheckoutVC: UIViewController, TotalPriceDelegte {
        
    //MARK: - IBOutltets
    //Labels
    @IBOutlet weak var paymentLabel: UILabel!
    
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var subtotalPriceLabel: UILabel!
    @IBOutlet weak var discountPercentageLabel: UILabel!
    @IBOutlet weak var shippingPriceLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    //Buttons
    @IBOutlet weak var checkoutButton: UIButton!
    
    //Vars
    var subtotalPrice: Double = 0
    var totalPrice: Double = 0
    let discount: Double = 5
    let shipping: Double = 10
    let cartView = CartVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLabels()
        updateUIForCheckoutButton()
        cartView.totalPriceDelegate = self
    }
    
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func checkoutButtonPressed(_ sender: Any) {
        
    }
    
    //MARK: - UpdateUI
    private func updateUIForCheckoutButton() {
        checkoutButton.addGradientBackground()
        checkoutButton.addCornerRadius(cornerRadius: 5)
    }
    
    //MARK: - Setup
    private func setLabels() {
        discountPercentageLabel.text = "%\(discount)"
        shippingPriceLabel.text = "$\(shipping)"
        totalPriceLabel.text = "$\(setTotalPrice())"
    }
    
    func getTotalPrice(_ totalPrice: Double) {
        self.subtotalPrice = totalPrice
        subtotalPriceLabel.text = "$\(totalPrice)"
    }

    func setTotalPrice() -> Double {
        return subtotalPrice * discount / 100 + shipping
    }
    
}
