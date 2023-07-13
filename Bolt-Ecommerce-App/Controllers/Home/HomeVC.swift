//
//  HomeVc.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/4/23.
//

import UIKit
import SideMenu

class HomeVC: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    //CollectioViews
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    @IBOutlet weak var bestSellCollectionView: UICollectionView!
    
    //MARK: - Vars
    var buttonIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        setupSearchTextFiled()
        print("collection view: \(featuredCollectionView.frame.height)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    //MARK: - IBActions
    @IBAction func sideMenuButtonPressed(_ sender: Any) {
        showSideMenu()
    }
    
    @IBAction func categoriesSeeAllButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func featuredSeeAllButtonPressed(_ sender: UIButton) {
        buttonIndex = 1
        performSegue(withIdentifier: Constants.Identifiers.segueToItems, sender: sender)
    }
    
    @IBAction func bestSellSeeAllButtonPressed(_ sender: UIButton) {
        buttonIndex = 2
        performSegue(withIdentifier: Constants.Identifiers.segueToItems, sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let itemsView = segue.destination as? ItemsVC {
            switch buttonIndex {
            case 1:
                itemsView.titleText = "Featured"
            case 2:
                itemsView.titleText = "Best Sell"
            default:
                break
            }
        }

    }
    
    
    //MARK: - CollectionViews Delegates
    private func configureCollectionView() {
        
        collectioViewDelegates(collectionView: categoryCollectionView, nibName: "CategoryCell")
        collectioViewDelegates(collectionView: featuredCollectionView, nibName: "ItemCell")
        collectioViewDelegates(collectionView: bestSellCollectionView, nibName: "ItemCell")
    }
    
    private func collectioViewDelegates(collectionView: UICollectionView, nibName: String){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
    //MARK: - Setup
    private func setupSearchTextFiled() {
        searchTextField.setPlaceholderColor ( Constants.Colors.searchPlacHolder )
        searchView.addShadow(shadowOpacity: 0.3, shadowColor: UIColor.lightGray.cgColor)
    }
    
    
    //MARK: - Navigate
    private func showSideMenu() {
        guard let sideMenuView = storyboard?.instantiateViewController(withIdentifier: "SideMenuID") as? SideMenuNavigationController else {
            return
        }
        var settings = SideMenuSettings()
        settings.presentationStyle = .menuSlideIn
        SideMenuManager.default.leftMenuNavigationController?.settings = settings
        sideMenuView.settings = settings

        present(sideMenuView, animated: true)
    }
    
    



}

