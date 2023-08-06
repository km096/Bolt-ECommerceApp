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
    var menus: [SideMenu] = [
        SideMenu(icon: UIImage(systemName: "house.fill")!, title: "home".localized),
        SideMenu(icon: UIImage(systemName: "person.fill")!, title: "profile".localized),
        SideMenu(icon: UIImage(systemName: "cart.fill")!, title: "cart".localized),
        SideMenu(icon: UIImage(systemName: "heart.fill")!, title: "favorite".localized),
        SideMenu(icon: UIImage(systemName: "basket.fill")!, title: "orders".localized),
        SideMenu(icon: UIImage(systemName: "pencil")!, title: "language".localized),
        SideMenu(icon: UIImage(systemName: "slider.horizontal.3")!, title: "settings".localized)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        updateUIForUserImage()
        localize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showUserInfo()
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
                let loginView = UIStoryboard(name: Constants.Storyboard.main, bundle: nil).instantiateViewController(withIdentifier: Constants.Identifiers.loginView)
                
                DispatchQueue.main.async {
                    loginView.modalPresentationStyle = .fullScreen
                    self.present(loginView, animated: true)
                }
                
            }
        }
    }
    
    private func updateUIForUserImage() {
        userImageView.makeRounded()
    }
    
    //MARK: - Localization
    private func localize() {
        logOutButton.setTitle("logout".localized, for: .normal)
    }
    
    //MARK: - Setup
    private func showUserInfo() {
        if let user = User.currentUser {
            usernameLabel.text = user.username
            
            if user.avatarLink != "" {
                FileStorage.downloadImage(imageUrl: user.avatarLink) { [weak self] image in
                    guard let strongSelf = self else { return }
                    strongSelf.userImageView.image = image
                }
            }
        }
    }
}
