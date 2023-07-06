//
//  GlobalFunctions.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/6/23.
//

import UIKit

func displayError(viewController: UIViewController, message: String) {
    let alert = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default))
    viewController.present(alert, animated: true)
}

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

func getUser() -> [UserItem] {
    var users = [UserItem]()
    do {
        users = try context.fetch(UserItem.fetchRequest())

    } catch {
        print("Could not fetch: \(error.localizedDescription)")
    }
    
    return users
}
