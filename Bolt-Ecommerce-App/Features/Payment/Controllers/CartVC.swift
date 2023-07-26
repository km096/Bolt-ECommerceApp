//
//  CartVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/13/23.
//

import UIKit
import CoreData
import FirebaseAuth
import ProgressHUD

protocol TotalPriceDelegte {
    func getTotalPrice(_ totalPrice: Double)
}

class CartVC: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var continueButton = UIButton()
    var cartItems: [CartItems] = []
    var totalPriceDelegate: TotalPriceDelegte?
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        setupContinueButton()
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCartItems()
        cartTableView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        continueButton.addCornerRadius(cornerRadius: 5)
        continueButton.addGradientBackground()
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    //MARK: - TableView Delegates
    private func configureTableView() {
        cartTableView.delegate = self
        cartTableView.dataSource = self
        self.cartTableView.register(CartCell.nib, forCellReuseIdentifier: CartCell.identifier)
    }
    
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @objc func continueButtonPressed() {
        guard let addAddressView = storyboard?.instantiateViewController(withIdentifier: Constants.Identifiers.addAddress) as? AddressVC else {
            return
        }
        addAddressView.modalPresentationStyle = .fullScreen
        present(addAddressView, animated: true)
    }
    
    private func updateTotalPrice() {
        let totalPrice = cartItems.reduce(0, {$0 + $1.price * Double($1.quantity)})
        totalPriceLabel.text = "$ \(totalPrice)"
    }
    
    //MARK: - Setup
    private func setupContinueButton() {
        self.continueButton = UIButton(type: .custom)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        view.addSubview(continueButton)
    }
        
    //MARK: - Helpers
    private func fetchCartItems() {
        do {
            cartItems = try managedContextCartItems.fetch(CartItems.fetchRequest())
            updateTotalPrice()
        } catch {
            print("Error fetching items: \(error.localizedDescription)")
        }
    }
    
    func removeItem(atIndexPath indexPath: IndexPath) {
         managedContextCartItems.delete(cartItems[indexPath.row])
         AppDelegate.sharedAppDelegate.coreDataStackCartItems.saveContext()
         cartItems.remove(at: indexPath.row)
        updateTotalPrice()
         cartTableView.reloadData()
         ProgressHUD.showSucceed("Item removed from the cart")
    }
    
    func incrementItemQyantity(atIndexPath indexPath: IndexPath) {
        var newQuantity = cartItems[indexPath.row].quantity
        newQuantity += 1
        cartItems[indexPath.row].quantity = newQuantity
        AppDelegate.sharedAppDelegate.coreDataStackCartItems.saveContext()
        cartTableView.reloadData()
        updateTotalPrice()
    }
    
    func decrementItemQyantity(atIndexPath indexPath: IndexPath) {
        var newQuantity = cartItems[indexPath.row].quantity
        newQuantity -= 1
        if newQuantity < 0 {
            newQuantity = 0
        }
        cartItems[indexPath.row].quantity = Int32(newQuantity)
        AppDelegate.sharedAppDelegate.coreDataStackCartItems.saveContext()
        cartTableView.reloadData()
        updateTotalPrice()
    }
 
}
