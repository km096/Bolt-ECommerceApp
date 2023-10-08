//
//  FavoriteVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 8/1/23.
//

import UIKit

class FavoriteVC: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var favoriteeCollectionView: UICollectionView!
    
    //Vars
    var favoriteProduct = [Product]()
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setCollectionView()
        favoriteLabel.text = "favorite".localized
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchFavoriteProductData()
    }
    
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    //MARK: - Setup
    private func setCollectionView() {
        favoriteeCollectionView.delegate = self
        favoriteeCollectionView.dataSource = self
        favoriteeCollectionView.register(ProductCell.nib, forCellWithReuseIdentifier: ProductCell.identifier)
    }
    
    
    private func fetchFavoriteProductData() {
        let bool = NSNumber(booleanLiteral: true)
        let fetchRequest = Products.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "addToFavorite == %@", bool as CVarArg)
        
        do {
             let favoriteProducts = try managedContextProducts.fetch(fetchRequest)
            print("favorite product count: \(favoriteProducts.count)")
            
            if favoriteProducts.count > 0 {
                for product in  favoriteProducts {
                    let data = Product(id: product.id!, title: product.title!, price: product.price, imageName: product.imageName ?? "")
                    favoriteProduct.append(data)
                }
            }
        } catch {
            print("Error fetching items: \(error.localizedDescription)")
        }
    }
    

}
