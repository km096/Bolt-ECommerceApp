//
//  HomeCategoryVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/9/23.
//

import UIKit

class ItemsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
//    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var seachBar: UISearchBar!
    @IBOutlet weak var titleLabel: UILabel!
    
    var titleText = ""
    var isHidden = true
    
    var searchedItems = [ItemModel]()
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = titleText
        ConfigureCollctionView()
        seachBar.delegate = self
        // Do any additional setup after loading the view.
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
    
}

