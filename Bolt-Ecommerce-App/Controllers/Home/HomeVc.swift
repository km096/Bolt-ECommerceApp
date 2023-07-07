//
//  HomeVc.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/4/23.
//

import UIKit

class HomeVc: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    
    @IBOutlet weak var bestSellCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    
    //MARK: - Vars
    private let spacing:CGFloat = 16.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        setupSearchTextFiled()
//        saveData { finished in
//            print("data saved")
//        }
         
    }
    
    //MARK: - Configure
    private func configureCollectionView() {
        
        collectioViewDelegates(collectionView: categoryCollectionView, nibName: "CategoryCell")
        collectioViewDelegates(collectionView: featuredCollectionView, nibName: "FeaturedCell")
        collectioViewDelegates(collectionView: bestSellCollectionView, nibName: "FeaturedCell")
    }
    
    private func collectioViewDelegates(collectionView: UICollectionView, nibName: String){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
    //MARK: - Setup
    private func setupSearchTextFiled() {
        searchTextField.setPlaceholderColor ( Constants.Colors.searchPlacHolder )
        searchView.setShadow(shadowOpacity: 0.3, shadowColor: UIColor.lightGray.cgColor)
    }
    

}

extension HomeVc : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func cell(_ collectionView: UICollectionView) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            categoryCell.setupCategoryCell(type: indexPath.row)
            return categoryCell
        } else if collectionView.tag == 1 {
            let featuredCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedCell", for: indexPath) as! HomeCategoryCell
            featuredCell.setupCell(homeCategory: featured()[indexPath.row])
            return featuredCell
        } else {
            let bestSellCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedCell", for: indexPath) as! HomeCategoryCell
            bestSellCell.setupCell(homeCategory: featured()[indexPath.row])

            return bestSellCell
        }
        
        
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout

        let itemSpacing: CGFloat = 20
        let itemInOneLine: CGFloat = 2.5

        let width = collectionView.frame.width - itemSpacing * (itemInOneLine - 1 )
        layout.minimumLineSpacing = itemSpacing

        return CGSize(width: width / itemInOneLine, height: (collectionView.frame.height ) )
    }
    
    
}
