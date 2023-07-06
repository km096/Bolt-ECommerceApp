//
//  SignupVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/6/23.
//

import UIKit

class SignupVC: UIViewController {
    
    //MARK: - IBOutlets
    //Labels
    @IBOutlet weak var signupLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    //TextFileds
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //Buttons
    @IBOutlet weak var signupButton: UIButton!
    
    //Vars
    var users = [UserItem]()
    var isClicked = false
    var isLogin = true


    override func viewDidLoad() {
        super.viewDidLoad()

        getUser()
        setTextFieldsDelegstes()
        updateUIForSignupButton()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBActions

    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        isValidData() ? registerUser() : displayError(viewController: self, message: Constants.ErrorMessage.allFieldsRequired)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func eyeButtonPressed(_ sender: UIButton) {
        if isClicked {
            passwordTextField.isSecureTextEntry = false
            sender.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            sender.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
        isClicked.toggle()
    }
    
    //MARK: - Setup
    private func setTextFieldsDelegstes() {
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        UpdatePlaceHoldersLabels(textField: textField)
    }
    
    //MARK: - Animations
    private func UpdatePlaceHoldersLabels(textField: UITextField) {
        
        switch textField {
        case nameTextField:
            nameLabel.text = textField.hasText ? "Name" : ""
        case emailTextField:
            emailLabel.text = textField.hasText ? "Email" : ""
        default:
            passwordLabel.text = textField.hasText ? "Password" : ""

        }
    }
    
    private func updateUIForSignupButton() {
        signupButton.setTitleColor(.white, for: .normal)
        signupButton.setGradientBackground()

    }
    
    
    //MARK: - Helpers
    private func isValidData() -> Bool {
        
        if isValidEmail(emailTextField) && isValidPassword(passwordTextField) {
            return true
        }
        return false
        
    }

    
    private func registerUser() {
        if let user = users.first(where: {$0.email == emailTextField.text}) {
            //TODO: - display error
            displayError(viewController: self, message: Constants.ErrorMessage.registeredBefore)
            user.isLogin = true
           
            isLogin = user.isLogin
        } else {
            createUser { finished in
                print("user created")
            }
        
        
        }
        
    }
    
    private func createUser(completion: (_ finished: Bool) -> ()) {
        let newUser = UserItem(context: context)
        newUser.username = nameTextField.text
        newUser.email = emailTextField.text
        newUser.password = passwordTextField.text
        
        do {
            try context.save()
            completion(true)
        } catch {
            print("Could not save user: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    private func getUser(){
        
        do {
            users = try context.fetch(UserItem.fetchRequest())
 
            print("users num: \(users.count)")
        } catch {
            print("Could not fetch: \(error.localizedDescription)")
        }
    }

}
