//
//  AddAddressVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/19/23.
//

import UIKit
import CoreData


class AddressVC: UIViewController {

    //MARK: - IBOutets
    @IBOutlet weak var addressTableView: UITableView!
    
    //Labels
    @IBOutlet weak var addressLabel: UILabel!
    
    //Buttons
    @IBOutlet weak var addAddressButton: DashedButton!
    @IBOutlet weak var continueToPaymentButton: UIButton!
    
    //Vars
    var selectedIndex = -1
    var address: [Address] = []
    private var totalPrice: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUIForContinueButton()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchAddressInfo()
        addressTableView.reloadData()
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
    
    @IBAction func continueToPaymentButtonPressed(_ sender: Any) {
        goToCheckoutScreen()
    }
    
    //MARK: - UpdateUI
    private func updateUIForContinueButton() {
        continueToPaymentButton.addGradientBackground()
        continueToPaymentButton.tintColor = .white
        continueToPaymentButton.addCornerRadius(cornerRadius: 5)
    }
    
    //MARK: - Setup
    func setTotalPrice(_ totalPrice: Double) {
        self.totalPrice = totalPrice
    }
    
    func fetchAddressInfo() {
        do {
            address = try managedContextAddress.fetch(Address.fetchRequest())
        } catch {
            print("Error fetching address info: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Navigation
    func goToCheckoutScreen() {
        guard let checkoutView = storyboard?.instantiateViewController(withIdentifier: Constants.Identifiers.checkout) as? PaymentVC else {
            return
        }
        guard let totalPrice = self.totalPrice else {
            return
        }
        checkoutView.setSubtotalPrice(totalPrice)
        checkoutView.modalPresentationStyle = .fullScreen
        present(checkoutView, animated: true)
    }
    

}

