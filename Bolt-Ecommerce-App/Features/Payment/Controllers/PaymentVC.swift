//
//  CheckoutVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/26/23.
//

import UIKit
import CoreData

class PaymentVC: UIViewController {
        
    //MARK: - IBOutltets
    @IBOutlet weak var visaCollecctionView: UICollectionView!
    
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
    private var subtotalPrice: Double = 0
    var totalPrice: Double = 0
    let discount: Double = 5
    let shipping: Double = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
        setCollectionView()
        updateUIForCheckoutButton()
    }

    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func checkoutButtonPressed(_ sender: Any) {
        goToCheckoutVC()
    }
        
    //MARK: - UpdateUI
    private func updateUIForCheckoutButton() {
        checkoutButton.addGradientBackground()
        checkoutButton.addCornerRadius(cornerRadius: 5)
    }
    
    //MARK: - Setup
    private func setCollectionView() {
        visaCollecctionView.delegate = self
        visaCollecctionView.dataSource = self
        visaCollecctionView.register(VisaCell.nib, forCellWithReuseIdentifier: VisaCell.identifier)
    }
    
    private func updateViews() {
        paymentLabel.text = "payment".localized
        subtotalLabel.text = "subtotal".localized
        discountLabel.text = "discount".localized
        shippingLabel.text = "shipping".localized
        totalLabel.text = "total".localized
        
        subtotalPriceLabel.text = "$\(subtotalPrice)"
        discountPercentageLabel.text = "%\(discount)"
        shippingPriceLabel.text = "$\(shipping)"
        totalPriceLabel.text = "$\(setTotalPrice())"
    }
    
    func setSubtotalPrice(_ subtotalPrice: Double) {
        self.subtotalPrice = subtotalPrice
    }
    
    private func setTotalPrice() -> Double {
        return subtotalPrice - (subtotalPrice * discount / 100) + shipping
    }
    
    
    //MARK: - Navigation
    private func goToCheckoutVC() {
        guard let checkoutVC = instantiateVC(Constants.Storyboard.payment, Constants.Identifiers.checkoutVC) as? CheckoutVC else {
            return
        }
        checkoutVC.subtotalPrice = self.subtotalPrice
        checkoutVC.totalPrice = self.setTotalPrice()
        presentVC(checkoutVC)

    }
    

}


