//
//  ProfileVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 8/3/23.
//

import UIKit
import Gallery
import ProgressHUD

class EditProfileVC: UIViewController {

    
    //MARK: - IBOutlets
    //Labels
    @IBOutlet weak var EditProfileLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    //TextFields
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    //Buttons
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    //ImageViews
    @IBOutlet weak var userImageView: UIImageView!
    
    //Vars
    var gallery: GalleryController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        userImageView.makeRounded()
        updateUIForConfirmButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showUserInfo()
    }
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        showImageGallery()
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        saveUserInfo()
    }
    
    //MARK: - UpdateUI
    private func updateViews() {
        EditProfileLabel.text = "editProfile".localized
        usernameLabel.text = "username".localized
        emailLabel.text = "email".localized
        addressLabel.text = "address".localized
        cityLabel.text = "city".localized
        genderLabel.text = "gender".localized
        phoneLabel.text = "phoneNumber".localized
    }
    
    private func updateUIForEditButton() {
        editButton.addGradientBackground()
        editButton.tintColor = .white
    }
    
    private func updateUIForConfirmButton() {
        saveButton.addGradientBackground()
        saveButton.addCornerRadius(cornerRadius: 5)
        saveButton.tintColor = .white
        saveButton.setTitle("save".localized, for: .normal)
    }
    
    func showUserInfo() {
        if let user = User.currentUser {
            usernameTextField.text = user.username
            emailTextField.text = user.email
            addressTextField.text = user.addressLane
            cityTextField.text = user.city
            genderTextField.text = user.gender
            phoneTextField.text = user.phoneNumber
            
            if user.avatarLink != "" {
                FileStorage.downloadImage(imageUrl: user.avatarLink) { [weak self] image in
                    guard let strongSrlf = self else { return }
                    strongSrlf.userImageView.image = image
                }
            } else {
                print("there ise no avatar link")
            }
        }
    }
    
    //MARK: - Gallery
    private func showImageGallery() {
        gallery = GalleryController()
        gallery.delegate = self
        
        Config.tabsToShow = [.imageTab, .cameraTab]
        Config.Camera.imageLimit = 1
        Config.initialTab = .imageTab
        
        present(gallery, animated: true)
    }
    
    //MARK: - UploadImage
    func uploadUserImage(_ image: UIImage) {
        let fileDirectory = "Avatars/_\(User.currentId).jpg"
        FileStorage.uploadImage(image, directory: fileDirectory) { documentLink in
            
            if var user = User.currentUser {
                user.avatarLink = documentLink ?? ""
                saveUserLocally(user)
                FirebaseUserListener.shared.saveUserToFirebase(user)
            }
            
            FileStorage.saveFielocally(fileData: image.jpegData(compressionQuality: 1)! as NSData, fileName: User.currentId)
        }
    }
    
    //MARK: - Setup
    func saveUserInfo() {
        if checkTextFields() {
            if var user = User.currentUser {
                user.addressLane = addressTextField.text!
                user.city = cityTextField.text!
                user.gender = genderTextField.text!
                user.phoneNumber = phoneTextField.text!
                
                saveUserLocally(user)
                FirebaseUserListener.shared.saveUserToFirebase(user)
            
            }
            dismiss(animated: true)
        } else {
            ProgressHUD.showFailed(Constants.ErrorMessage.allFieldsRequired)
        }
    }
    
    private func checkTextFields() -> Bool {
        for textField in self.view.subviews where textField is UITextField {
            let textField = (textField as? UITextField)
            if textField?.text == "" {
                return false
            }
        }
        return true
    }
}
