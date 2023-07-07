//
//  LoginVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/4/23.
//

import UIKit
import ProgressHUD


class LoginVC: UIViewController, UITextViewDelegate {
    
    //MARK: - IBOutlets
    //Labels
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    //TextFileds
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //Buttons
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    
    //MARK: - Vars

    var isLogin = true
    var isClicked = false
        
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

//        getUser()
        setTextFieldsDelegates()
        updateUIForLoginButton()
        print("is login: \(isLogin)")
    }
    
    //MARK: - IBActions
    @IBAction func loginButtonPressed(_ sender: Any) {
       
        if isValidData() {
            loginUser()
        } else {
            ProgressHUD.showFailed(Constants.ErrorMessage.allFieldsRequired)
        }
    }
    
    @IBAction func eyeButtonPressed(_ sender: UIButton) {
        if isClicked {
            passwordTextField.isSecureTextEntry = false
            sender.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            sender.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
//        eyeButtonPressed(isClicked, passwordTextField, sender)
        isClicked.toggle()
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    //MARK: - Setup
    private func setTextFieldsDelegates() {

        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        UpdatePlaceHoldersLabels(textField: textField)
    }

    //MARK: - Animations
    private func UpdatePlaceHoldersLabels(textField: UITextField) {
        
        switch textField {

        case emailTextField:
            emailLabel.text = textField.hasText ? "Email" : ""
        default:
            passwordLabel.text = textField.hasText ? "Password" : ""

        }
    }
    
    private func updateUIForLoginButton() {
        loginButton.tintColor = .white
        loginButton.setGradientBackground()
        loginButton.setupButton(cornerRadius: 10)

    }
    
    //MARK: - Helpers
    private func isValidData() -> Bool {
        
        if isValidEmail(emailTextField) && isValidPassword(passwordTextField) {
            return true
        }
        return false
        
    }
    
    private func loginUser() {
        
        FirebaseUserListener.shared.loginUserWithEmail(email: emailTextField.text!, password: passwordTextField.text!) { error, isEmailVerified in
            
            if error == nil {
                if isEmailVerified {
                    self.goToHomeScreen()
                } else {
                    ProgressHUD.showFailed("Please verify email.")
                }
            } else {
                ProgressHUD.showFailed(error?.localizedDescription)
            }
        }
    }
    
    private func resetPassword() {
        FirebaseUserListener.shared.resetPassword(email: emailTextField.text!) { error in
            
            if error == nil {
                ProgressHUD.showSucceed("Reset link sent to email.")
            } else {
                ProgressHUD.showFailed(error?.localizedDescription)
            }
            
        }
        
    }
        

    // MARK: - Navigation
    private func goToHomeScreen() {
        let homeView = UIStoryboard(name: Constants.Storyboard.home, bundle: nil).instantiateViewController(withIdentifier: Constants.Identifiers.homeView) as! HomeVc
        present(homeView, animated: true)
    }

}
