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
    if let password = passwordText.text, !password.isEmpty && password.count >= 6{
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

func featured() -> [HomeCategory]{
    var featured = [HomeCategory]()
    featured.append(HomeCategory(title: "Woman T-Shirt", price: "$40.00", imageName: "WomanT-Shirt"))
    featured.append(HomeCategory(title: "Man T-Shirt", price: "$33.00", imageName: "ManT-Shirt"))
    featured.append(HomeCategory(title: "Woman T-Shirt", price: "$50.00", imageName: "WomanT-Shirt1"))
    return featured
}

//func saveData( completion: (_ finished: Bool) -> () ) {
//
//    let data = [HomeCategory]()
//    for i in 0 ..< 5 {
//        let newItem = CategoryItem(context: managedContext)
////        newItem.id = append()[i].title
//        newItem.title = featured()[i].title
//        newItem.price = featured()[i].title
//        newItem.imageName = featured()[i].imageName
//
//        do {
//            try managedContext.save()
//            completion(true)
//        } catch {
//            print("could not save : \(error.localizedDescription)")
//            completion(false)
//        }
//    }
//}
