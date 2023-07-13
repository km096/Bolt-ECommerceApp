//
//  GlobalFunctions.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/6/23.
//

import UIKit

func isValidEmail(_ emailText: UITextField) -> Bool {
    if let email = emailText.text, !email.isEmpty  {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    return false
}

func isValidPassword(_ passwordText: UITextField) -> Bool {
    if let password = passwordText.text, !password.isEmpty && password.count >= 6 {
        return true
    }
    return false
}

func securePasswordButtonPressed(_ isClicked: Bool, _ textField: UITextField, _ secureButton: UIButton) {
    if isClicked {
        textField.isSecureTextEntry = false
        secureButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
    } else {
        textField.isSecureTextEntry = true
        secureButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
    }
}

func getItems() -> [ItemModel] {
    
    let womanTShirt: ItemModel = ItemModel(id: 0, title: "Woman T-Shirt", price: "$40.00", imageName: "Woman T-Shirt0")
    let womanTShirt1: ItemModel = ItemModel(id: 1, title: "Woman T-Shirt", price: "$50.00", imageName: "Woman T-Shirt1")
    let womanTShirt2: ItemModel = ItemModel(id: 2, title: "Woman T-Shirt", price: "$35.00", imageName: "Woman T-Shirt2")
    let manTShirt: ItemModel = ItemModel(id: 3, title: "Man T-Shirt", price: "$33.00", imageName: "Man T-Shirt0")
    let manTShirt1: ItemModel = ItemModel(id: 4, title: "Woman T-Shirt", price: "$65.00", imageName: "Woman T-Shirt1")
    let shirt: ItemModel = ItemModel(id: 5, title: "Shirt", price: "$53.00", imageName: "Shirt")
    let tShirt: ItemModel = ItemModel(id: 6, title: "T-Shirt", price: "$45.00", imageName: "T-Shirt")
    let blazer: ItemModel = ItemModel(id: 7, title: "Blazer", price: "$33.00", imageName: "Blazer")
    
    var item = [ItemModel]()

    item.append(contentsOf: [womanTShirt, womanTShirt1, womanTShirt2, manTShirt, manTShirt1, tShirt, shirt, blazer])

    return item
}

func setCollectionViewSize(collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout, itemInOneLine: CGFloat) -> CGSize {
    
    let layout = collectionViewLayout as! UICollectionViewFlowLayout

    let itemSpacing: CGFloat = 20
    let itemInOneLine: CGFloat = itemInOneLine

    let width = collectionView.frame.width - itemSpacing * (itemInOneLine - 1 )
    layout.minimumLineSpacing = itemSpacing

    return CGSize(width: width / itemInOneLine, height: 270)
}

func goToVC(storyboardName: String, identifier: String) -> UIViewController {
    let vc = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier)
        return vc
    
}

