//
//  CartVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/13/23.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    
    var continueButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        createContinueButton()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        continueButton.addCornerRadius(cornerRadius: 10)
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
    
    
    func createContinueButton() {
        self.continueButton = UIButton(type: .custom)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        view.addSubview(continueButton)
    }
    
    
    
    @objc func continueButtonPressed() {
        
    }
    
    


}
