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

class CartVC: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var cartLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var continueButton = UIButton()
    var cartProducts = [Products]()
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        setContinueButton()
        cartLabel.text = "cart".localized
        totalLabel.text = "total".localized

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCartProducts()
        cartTableView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        continueButton.addCornerRadius(cornerRadius: 5)
        continueButton.addGradientBackground()
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
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
        guard let addressVC = storyboard?.instantiateViewController(withIdentifier: Constants.Identifiers.addAddress) as? AddressVC else {
            return
        }
        addressVC.setTotalPrice(setTotalPrice())
        presentVC(addressVC)
    }
    
    //MARK: - UpdateUI
    private func setTotalPrice() -> Double {
        return cartProducts.reduce(0, {$0 + $1.price * Double($1.quantity)})

    }
    
    private func setTotaPriceLabel() {
        totalPriceLabel.text = "$\(self.setTotalPrice())"
    }
    
    
    //MARK: - Setup
    private func setContinueButton() {
        self.continueButton = UIButton(type: .custom)
        continueButton.setTitle("continue".localized, for: .normal)
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        view.addSubview(continueButton)
    }
        
    //MARK: - Helpers
    private func fetchCartProducts() {
        let bool = NSNumber(booleanLiteral: true)
        let fetchRequest = Products.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "addToCart == %@", bool as CVarArg)
        do {
            cartProducts = try managedContextProducts.fetch(fetchRequest)
            setTotaPriceLabel()
        } catch {
            print("Error fetching items: \(error.localizedDescription)")
        }
    }
    
    func removeItem(atIndexPath indexPath: IndexPath) {
        cartProducts[indexPath.row].addToCart = false
        managedContextProducts.delete(cartProducts[indexPath.row])
        AppDelegate.sharedAppDelegate.coreDataStackProducts.saveContext()
        cartProducts.remove(at: indexPath.row)

        cartTableView.reloadData()
        setTotaPriceLabel()
        ProgressHUD.showSucceed("Item removed from the cart")
    }
    
    func incrementItemQyantity(atIndexPath indexPath: IndexPath) {
        var newQuantity = cartProducts[indexPath.row].quantity

        newQuantity += 1
        cartProducts[indexPath.row].quantity = newQuantity
        AppDelegate.sharedAppDelegate.coreDataStackProducts.saveContext()

        cartTableView.reloadData()
        setTotaPriceLabel()
    }
    
    func decrementItemQyantity(atIndexPath indexPath: IndexPath) {
        var newQuantity = cartProducts[indexPath.row].quantity
        newQuantity -= 1
        if newQuantity < 0 {
            newQuantity = 0
        }
        cartProducts[indexPath.row].quantity = newQuantity
        AppDelegate.sharedAppDelegate.coreDataStackProducts.saveContext()
        
        cartTableView.reloadData()
        setTotaPriceLabel()
    }
}
