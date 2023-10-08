//
//  CheckoutVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 8/7/23.
//

import UIKit

class CheckoutVC: UIViewController {

    //MARK: - IBOutlets
    //TableViews
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var addressTableView: UITableView!
    
    //Labels
    @IBOutlet weak var checkoutLabel: UILabel!
    //
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    //
    @IBOutlet weak var subtotalPriceLabel: UILabel!
    @IBOutlet weak var discountPercentageLabel: UILabel!
    @IBOutlet weak var shippingPriceLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    //Buttons
    @IBOutlet weak var buyButton: UIButton!
    
    //Vars
    var cartProducts =  [Products]()
    var addressInfo = [Address]()
    
    var subtotalPrice: Double = 0
    var totalPrice: Double = 0
    let discount: Double = 5
    let shipping: Double = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
        configureTableViews()
        updateUIForBuyButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchAddressInfo()
        fetchCartProducts()
//        addressTableView.reloadData()
    }
    
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func buyButtonPressed(_ sender: Any) {
        goToConfirmationScreen()
    }
    
    //MARK: - ConfigureTableViews
    private func configureTableViews() {
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(CartCell.nib, forCellReuseIdentifier: CartCell.identifier)
        
        addressTableView.delegate = self
        addressTableView.dataSource = self
        addressTableView.register(AddressCell.nib, forCellReuseIdentifier: AddressCell.identifier)
    }
    
    //MARK: - UpdateUI
    private func updateViews() {
        checkoutLabel.text = "checkout".localized
        subtotalLabel.text = "subtotal".localized
        discountLabel.text = "discount".localized
        shippingLabel.text = "shipping".localized
        totalLabel.text = "total".localized
        
        subtotalPriceLabel.text = "$\(subtotalPrice)"
        discountPercentageLabel.text = "%\(discount)"
        shippingPriceLabel.text = "$\(shipping)"
        totalPriceLabel.text = "$\(totalPrice)"
        
        
    }
    
    private func updateUIForBuyButton() {
        buyButton.addGradientBackground()
        buyButton.addCornerRadius(cornerRadius: 5)
        buyButton.tintColor = .white
        buyButton.setTitle("buy".localized, for: .normal)
    }
    
    private func fetchCartProducts() {
        let bool = NSNumber(booleanLiteral: true)
        let fetchRequest = Products.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "addToCart == %@", bool as CVarArg)
        do {
            cartProducts = try managedContextProducts.fetch(fetchRequest)
        } catch {
            print("Error fetching items: \(error.localizedDescription)")
        }
    }
        
    func fetchAddressInfo() {
        let bool = NSNumber(booleanLiteral: true)
        let fetchRequest = Address.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "checkmarked == %@", bool as CVarArg)
        do {
            addressInfo = try managedContextAddress.fetch(fetchRequest)
            print(addressInfo.count)
        } catch {
            print("Error fetching address info: \(error.localizedDescription)")
        }
    }
    
    
    //MARK: - Navigation
    private func goToConfirmationScreen() {
        guard let confirmationVC = instantiateVC(Constants.Storyboard.payment, Constants.Identifiers.confirmationVC) as? ConfirmationVC else {
            return
        }
        
        presentVC(confirmationVC)
    }
}

extension CheckoutVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == cartTableView ? cartProducts.count : addressInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == cartTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: CartCell.identifier, for: indexPath) as? CartCell
            cell?.setupCell(cartProducts[indexPath.row])
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: AddressCell.identifier, for: indexPath) as? AddressCell
            cell?.setupCell(address: addressInfo[indexPath.row])
            return cell!
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView == cartTableView ? 180 : 100
    }
    
   
    
    
}
