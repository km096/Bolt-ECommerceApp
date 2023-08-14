//
//  HomeCategoryVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/9/23.
//

import UIKit

class ProductsVC: UIViewController {
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var seachBar: UISearchBar!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Vars
    var titleText = ""
    var isHidden = true
    var searchedItems = [Product]()
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = titleText
        ConfigureCollctionView()
        seachBar.delegate = self
        localize()
    }
    
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func searchButttonPressed(_ sender: Any) {
        if isHidden {
            seachBar.isHidden = false
            isHidden = false
        } else {
            seachBar.isHidden = true
            isHidden = true
        }
    }
    
    //MARK: - Configure Collction View
    private func ConfigureCollctionView() {
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        productsCollectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")        
    }
    
    //MARK: - Localization
    private func localize() {
        seachBar.placeholder = "searchProduct".localized
    }
    
}

