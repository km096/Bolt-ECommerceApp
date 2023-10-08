//
//  HomeVc.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/4/23.
//

import UIKit
import SideMenu
import MOLH

class HomeVC: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    //CollectioViews
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    @IBOutlet weak var bestSellCollectionView: UICollectionView!
    
    //Labels
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var featuredLabel: UILabel!
    @IBOutlet weak var bestsellLabel: UILabel!
    
    @IBOutlet var seeAllButtons: [UIButton]!
    
    //MARK: - Vars
    var buttonIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setupSearchTextFiled()
        localizeViews()
    }
    
    //MARK: - IBActions
    @IBAction func categoriesSeeAllButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func featuredSeeAllButtonPressed(_ sender: UIButton) {
        buttonIndex = 1
        performSegue(withIdentifier: Constants.Identifiers.segueToProducts, sender: sender)
    }
    
    @IBAction func bestSellSeeAllButtonPressed(_ sender: UIButton) {
        buttonIndex = 2
        performSegue(withIdentifier: Constants.Identifiers.segueToProducts, sender: sender)
    }
    
  
    //MARK: - CollectionViews Delegates
    private func configureCollectionView() {
        
        collectioViewDelegates(collectionView: categoryCollectionView, nibName: "CategoryCell")
        collectioViewDelegates(collectionView: featuredCollectionView, nibName: "ProductCell")
        collectioViewDelegates(collectionView: bestSellCollectionView, nibName: "ProductCell")
    }
    
    private func collectioViewDelegates(collectionView: UICollectionView, nibName: String){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
    //MARK: - Localization
    private func localizeViews() {
        categoriesLabel.text = "categories".localized
        featuredLabel.text = "featured".localized
        bestsellLabel.text = "bestSell".localized
        
        seeAllButtons.forEach({$0.setTitle("seeAll".localized, for: .normal)})
    }
    
    //MARK: - Setup
    private func setupSearchTextFiled() {
        searchTextField.updatePlaceholder ( Constants.Colors.searchPlacHolder )
        searchView.addShadow(shadowOpacity: 0.3, shadowColor: UIColor.lightGray.cgColor)
    }
    
    private func makeSettings() -> SideMenuSettings {
        let presentationStyle: SideMenuPresentationStyle = .menuSlideIn
        var settings = SideMenuSettings()
        settings.presentationStyle = presentationStyle
        
        return settings
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showsideMenu" {
            guard let sideMenuNavigationController = segue.destination as? SideMenuNavigationController else {
                return
            }
            sideMenuNavigationController.settings = makeSettings()
            
            if MOLHLanguage.currentAppleLanguage() == "en" {
                sideMenuNavigationController.leftSide = true
                SideMenuManager.default.leftMenuNavigationController = sideMenuNavigationController
            } else {
                SideMenuManager.default.rightMenuNavigationController = sideMenuNavigationController
            }
            
        } else if segue.identifier == Constants.Identifiers.segueToProducts {
            guard let productsVC = segue.destination as? ProductsVC else {
                return
            }
            productsVC.modalTransitionStyle = .crossDissolve
            switch buttonIndex {
            case 1:
                productsVC.titleText = "featured".localized
            case 2:
                productsVC.titleText = "bestSell".localized
            default:
                break
            }
        }
    }
    
    
}

