//
//  ItemsCollectionViewExt.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/10/23.
//

import UIKit

extension ProductsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isSearching ? searchedItems.count : getProducts().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell else {
            fatalError("xib doesn't exist")
        }
        
        if isSearching {
            cell.setupCell(product: searchedItems[indexPath.row])
        } else {
            cell.setupCell(product: getProducts()[indexPath.row])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return setCollectionViewSize(collectionView: collectionView, collectionViewLayout: collectionViewLayout, itemInOneLine: 2, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let productDetailsVC = storyboard?.instantiateViewController(withIdentifier: "ProductDetailsID") as? ProductDetailsVC else {
            return
        }
        productDetailsVC.product =  isSearching ? searchedItems[indexPath.row] : getProducts()[indexPath.row]
        presentVC(productDetailsVC)

    }
    
    
}

