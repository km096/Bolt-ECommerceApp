//
//  ItemsSearchBarExt.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/10/23.
//

import UIKit

extension ItemsVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedItems = getItems().filter({($0.title?.lowercased().contains(searchText.lowercased()))!})
        isSearching = true
        collectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.isHidden = true
        isSearching = false
        collectionView.reloadData()
    }
}
