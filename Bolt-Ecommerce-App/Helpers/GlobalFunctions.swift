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
    
    let womanTShirt: ItemModel = ItemModel(title: "Woman T-Shirt", price: "$40.00", imageName: "Woman T-Shirt0")
    let womanTShirt1: ItemModel = ItemModel(title: "Woman T-Shirt", price: "$50.00", imageName: "Woman T-Shirt1")
    let womanTShirt2: ItemModel = ItemModel(title: "Woman T-Shirt", price: "$35.00", imageName: "Woman T-Shirt2")
    let manTShirt: ItemModel = ItemModel(title: "Man T-Shirt", price: "$33.00", imageName: "Man T-Shirt0")
    let manTShirt1: ItemModel = ItemModel(title: "Woman T-Shirt", price: "$65.00", imageName: "Woman T-Shirt1")
    let shirt: ItemModel = ItemModel(title: "Shirt", price: "$53.00", imageName: "Shirt")
    let tShirt: ItemModel = ItemModel(title: "T-Shirt", price: "$45.00", imageName: "T-Shirt")
    let blazer: ItemModel = ItemModel(title: "Blazer", price: "$33.00", imageName: "Blazer")
    
    var item = [ItemModel]()
    var featured = [ItemModel]()
    var bestSell = [ItemModel]()

    item.append(contentsOf: [womanTShirt, womanTShirt1, womanTShirt2, manTShirt, manTShirt1, tShirt, shirt, blazer])
//    item.shuffle()
    
//    for i in 0 ..< item.count {
//        if i % 2 == 0 {
//            featured.append(item[i])
//        } else {
//            bestSell.append(item[i])
//        }
//    }
    return item
//    return (featured, bestSell)
}

func setCollectionViewSize(collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout, itemInOneLine: CGFloat) -> CGSize {
    
    let layout = collectionViewLayout as! UICollectionViewFlowLayout

    let itemSpacing: CGFloat = 20
    let itemInOneLine: CGFloat = itemInOneLine

    let width = collectionView.frame.width - itemSpacing * (itemInOneLine - 1 )
    layout.minimumLineSpacing = itemSpacing

    return CGSize(width: width / itemInOneLine, height: 270)
}

func setCollectionViewHeight(collectionView: UICollectionView, collectionViewHeight: NSLayoutConstraint) {
    let height = collectionView.collectionViewLayout.collectionViewContentSize.height
    collectionViewHeight.constant = height
    
}


func goToVC(storyboardName: String, identifier: String) -> UIViewController {
    let vc = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier)
        return vc
    
}

