//
//  AddAddressVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/19/23.
//

import UIKit

class AddressVC: UIViewController {

    //MARK: - IBOutets
    @IBOutlet weak var addressTableView: UITableView!
    
    //Labels
    @IBOutlet weak var addressLabel: UILabel!
    
    //Buttons
    @IBOutlet weak var addAddressButton: DashedButton!
    @IBOutlet weak var continueToPaymentButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUIForContinueButton()
        configureTableView()
    }
    
    //MARK: - TableViewDelegates
    private func configureTableView() {
        addressTableView.delegate = self
        addressTableView.dataSource = self
        addressTableView.register(AddressCell.nib, forCellReuseIdentifier: AddressCell.identifier)
    }
    
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func addAddressButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func continueToPaymentButtonPressed(_ sender: Any) {
        
    }
    
    //MARK: - UpdateUI
    private func updateUIForContinueButton() {
        continueToPaymentButton.addGradientBackground()
        continueToPaymentButton.tintColor = .white
        continueToPaymentButton.addCornerRadius(cornerRadius: 5)
    }
    
    

}
