//
//  ItemsCollectionViewExt.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/10/23.
//

import UIKit

extension ItemsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isSearching ? searchedItems.count : getItems().count
//        return getItems().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ItemCell else {
            fatalError("xib doesn't exist")
        }
        
        if isSearching {
            cell.setupCell(item: searchedItems[indexPath.row])
        } else {
            cell.setupCell(item: getItems()[indexPath.row])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return setCollectionViewSize(collectionView: collectionView, collectionViewLayout: collectionViewLayout, itemInOneLine: 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let itemDetailsView = goToVC(storyboardName: Constants.Storyboard.home, identifier: Constants.Identifiers.itemDetails) as? ItemDetailsVC {
            
            itemDetailsView.item =  isSearching ?  searchedItems[indexPath.row] : getItems()[indexPath.row]

            present(itemDetailsView, animated: true)
        }
    }
    
    
    
    
}

