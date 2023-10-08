//
//  ProfileVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 8/6/23.
//

import UIKit

class ProfileVC: UIViewController {
    
    //MARK: - IBOutlets
    //labels
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    //
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
        
    
    //ImageViews
    @IBOutlet weak var userImageView: UIImageView!
    //Buttons
    @IBOutlet weak var editProfileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
        updateUIForButton()
        userImageView.makeRounded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUserImage()
    }
    
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func editProfileButtonPressed(_ sender: Any) {
        goToEditProfile()
    }
    
    //MARK: - UpdateUI
    private func updateUIForButton() {
        editProfileButton.addGradientBackground()
        editProfileButton.addCornerRadius(cornerRadius: 5)
        editProfileButton.tintColor = .white
        editProfileButton.setTitle("editProfile".localized, for: .normal)
    }
    
    private func updateViews() {
        usernameLbl.text = "username".localized
        emailLbl.text = "email".localized
        addressLbl.text = "address".localized
        cityLbl.text = "city".localized
        genderLbl.text = "gender".localized
        phoneNumberLbl.text = "phoneNumber".localized
    }
    
    //MARK: - Setup
    private func setUserImage() {
        if let user = User.currentUser {
            usernameLabel.text = user.username
            emailLabel.text = user.email
            addressLabel.text = user.addressLane
            cityLabel.text = user.city
            genderLabel.text = user.gender
            phoneNumberLabel.text = user.phoneNumber
            
            if user.avatarLink != "" {
                FileStorage.downloadImage(imageUrl: user.avatarLink) { [weak self] image in
                    guard let strongSelf = self else { return }
                    strongSelf.userImageView.image = image
                }
            }
        }
    }
    
    //MARK: - Navigation
    private func goToEditProfile() {
        guard let editProfileVC = instantiateVC(Constants.Storyboard.sideMenu, Constants.Identifiers.editProfileVC) as? EditProfileVC else {
            return
        }
        presentVC(editProfileVC)
    }
    

}

