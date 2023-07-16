//
//  HomeCategoryVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/9/23.
//

import UIKit

class ProductsVC: UIViewController {
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var seachBar: UISearchBar!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Vars
    var titleText = ""
    var isHidden = true
    var searchedItems = [ProductModel]()
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
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
    }
    
    //MARK: - Localization
    private func localize() {
        seachBar.placeholder = "searchProduct".localized
    }
    
}

