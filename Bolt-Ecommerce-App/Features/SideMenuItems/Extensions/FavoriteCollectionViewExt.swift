//
//  FavoriteCollectionViewExt.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 8/1/23.
//

import UIKit

extension FavoriteVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell {
            cell.setupCell(product: favoriteProduct[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
}
