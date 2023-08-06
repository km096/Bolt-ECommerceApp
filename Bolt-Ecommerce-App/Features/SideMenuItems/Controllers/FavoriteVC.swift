//
//  FavoriteVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 8/1/23.
//

import UIKit

class FavoriteVC: UIViewController {

    @IBOutlet weak var favoriteeCollectionView: UICollectionView!
    
    var favoriteProduct = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setCollectionView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchFavoriteProductData()
    }
    

    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func setCollectionView() {
        favoriteeCollectionView.delegate = self
        favoriteeCollectionView.dataSource = self
        favoriteeCollectionView.register(ProductCell.nib, forCellWithReuseIdentifier: ProductCell.identifier)
    }
    
    
    private func fetchFavoriteProductData() {
        let fetchRequest = CartItems.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "isFavorite == YES")
        
        do {
            let favorite = try managedContextCartItems.fetch(fetchRequest)
            let count = try managedContextCartItems.count(for: fetchRequest)
            for product in favorite {
                for i in 0 ..< count {
                    if product.isFavorite {
                        favoriteProduct[i].title = product.title ?? ""
                        favoriteProduct[i].imageName = product.imageName ?? ""
                        favoriteProduct[i].price = product.price
                    }
                }
            }
        } catch {
            print("Error fetching items: \(error.localizedDescription)")
        }
    }
    

}
