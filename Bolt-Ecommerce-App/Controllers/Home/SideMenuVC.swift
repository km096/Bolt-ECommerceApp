//
//  SideMenuVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/9/23.
//

import UIKit

class SideMenuVC: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var sideMenuTableView: UITableView!
    @IBOutlet weak var logOutButton: UIButton!
    
    //MARK: - Vars
    var menus: [SideMenuModel] = [
        SideMenuModel(icon: UIImage(systemName: "house.fill")!, title: "home".localized),
        SideMenuModel(icon: UIImage(systemName: "person.fill")!, title: "profile".localized),
        SideMenuModel(icon: UIImage(systemName: "slider.horizontal.3")!, title: "settings".localized)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        showUserInfo()
        localize()
    }
    
    //MARK: - Table View Delegates
    private func configureTableView() {
        sideMenuTableView.delegate = self
        sideMenuTableView.dataSource = self
        self.sideMenuTableView.register(SideMenuCell.nib, forCellReuseIdentifier: SideMenuCell.identifier)
    }
    

    //MARK: - IBActions
    @IBAction func logOutButtonPressed(_ sender: Any) {
        FirebaseUserListener.shared.logOutCurrentUder { error in
            if error == nil {
                let loginView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC")
                
                DispatchQueue.main.async {
                    loginView.modalPresentationStyle = .fullScreen
                    self.present(loginView, animated: true)
                }
                
            }
        }
    }
    
    //MARK: - Localization
    private func localize() {
        logOutButton.setTitle("logout".localized, for: .normal)
    }
    
    //MARK: - Setup
    private func showUserInfo() {
        
        if let user = User.currentUser {
            usernameLabel.text = user.username
        }
    }
}
