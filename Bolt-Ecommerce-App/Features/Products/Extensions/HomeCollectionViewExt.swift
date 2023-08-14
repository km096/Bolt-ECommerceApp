//
//  UICollectionViewExt.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/8/23.
//

import UIKit

extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            
            categoryCell.updateCellFor(indexpath: indexPath.row)
            return categoryCell
            
        } else if collectionView.tag == 1 {
            let featuredCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
            
            featuredCell.setupCell(product: getProducts()[indexPath.row])
            return featuredCell
            
        } else {
            let bestSellCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
            
            bestSellCell.setupCell(product: getProducts()[indexPath.row])
            return bestSellCell
        }
                
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout

        let itemSpacing: CGFloat = 20
        let itemInOneLine: CGFloat = 2.5

        let width = collectionView.frame.width - itemSpacing * (itemInOneLine - 1 )
        layout.minimumLineSpacing = itemSpacing

        return CGSize(width: width / itemInOneLine, height: collectionView.frame.height )
                
    }
    
    
    
    
    
    
}

