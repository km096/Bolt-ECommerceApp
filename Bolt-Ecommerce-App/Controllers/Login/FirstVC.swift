//
//  ViewController.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/4/23.
//

import UIKit

class FirstVC: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUser()
        loginButton.setupButton(cornerRadius: 5)

    }
    
    //MARK: - IBActions
  
    
    //MARK: - Helpers
    private func getUser() {
        let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext

        do {
            let users = try context.fetch(UserItem.fetchRequest())
            
            if let user = users.first(where: {$0.isLogin == true}) {
                print("loged in user: \(user.isLogin)")
            } else {
               print("There is no user loged in")
            }
        } catch {
            print("Could not fetch: \(error.localizedDescription)")
        }
    }
    
    
    
    //MARK: - Navigation
    private func goToLoginScreen(_ login: Bool) {
        let loginView = storyboard?.instantiateViewController(withIdentifier: Constants.Identifiers.loginView) as! LoginVC
//        loginView.from = LoginStatus.login.rawValue
//        loginV/iew.fromLogin = login
        present(loginView, animated: true)
    }
    
    
}

