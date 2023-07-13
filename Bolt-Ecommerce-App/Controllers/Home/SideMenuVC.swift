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
    
    //MARK: - Vars
    var menus: [SideMenuModel] = [
        SideMenuModel(icon: UIImage(systemName: "house.fill")!, title: "Home"),
        SideMenuModel(icon: UIImage(systemName: "person.fill")!, title: "Profile"),
        SideMenuModel(icon: UIImage(systemName: "slider.horizontal.3")!, title: "Settings")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
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
                let loginView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC")
                
                DispatchQueue.main.async {
                    loginView.modalPresentationStyle = .fullScreen
                    self.present(loginView, animated: true)
                }
                
            }
        }
    }
    
    func showUserInfo() {
        
        if let user = User.currentUser {
            usernameLabel.text = user.username
        }
    }
    
    
    
}


extension SideMenuVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuCell.identifier, for: indexPath) as? SideMenuCell else {
            fatalError("xib doesn't exist")
        }
        
        let menu = menus[indexPath.row]
        
        let customSelectionColorView = UIView()
        customSelectionColorView.backgroundColor = #colorLiteral(red: 0.9680405259, green: 0.9680406451, blue: 0.9680405259, alpha: 0.8965305556)
        cell.selectedBackgroundView = customSelectionColorView
        cell.titleLabel.text = menu.title
        cell.iconImageView.image = menu.icon
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
