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
    @IBOutlet weak var searchTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureCollectionView()
        setupSearchTextFiled()
        
         
    }
    
    //MARK: - Configure
    private func configureCollectionView() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
    }
    
    //MARK: - Setup
    private func setupSearchTextFiled() {
        searchTextField.setPlaceholderColor ( Constants.Colors.searchPlacHolder )
        searchView.setShadow()
    }
    
    
    

    

}

extension HomeVc : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        return cell
    }
    
    
    
}
