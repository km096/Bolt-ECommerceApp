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
    var checked = false

    var address: [Address] = []
    private var totalPrice: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updteViews()
        configureTableView()
        updateUIForContinueButton()
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
        goToPaymentScreen()
    }
    
    //MARK: - UpdateUI
    private func updateUIForContinueButton() {
        continueToPaymentButton.tintColor = .white
        continueToPaymentButton.addGradientBackground()
        continueToPaymentButton.addCornerRadius(cornerRadius: 5)
    }
    
    private func updteViews() {
        addressLabel.text = "address".localized
        addAddressButton.setTitle("addAddress".localized, for: .normal)
        continueToPaymentButton.setTitle("continueToPayment".localized, for: .normal)
    }
    
    //MARK: - Setup
    func setTotalPrice(_ totalPrice: Double) {
        self.totalPrice = totalPrice
    }
    
    func fetchAddressInfo() {
        do {
            address = try managedContextAddress.fetch(Address.fetchRequest())
//            for i in address {
//                print("\(i.address!) = \(i.checkmarked)")
//            }
        } catch {
            print("Error fetching address info: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Navigation
    func goToPaymentScreen() {
        guard let paymentVC = storyboard?.instantiateViewController(withIdentifier: Constants.Identifiers.payment) as? PaymentVC else {
            return
        }
        guard let totalPrice = self.totalPrice else {
            return
        }
        paymentVC.setSubtotalPrice(totalPrice)
        presentVC(paymentVC)
    }
    
    

}

