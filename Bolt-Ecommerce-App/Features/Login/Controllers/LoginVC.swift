//
//  LoginVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/4/23.
//

import UIKit
import ProgressHUD
import FBSDKLoginKit
import FirebaseAuth


class LoginVC: UIViewController, UITextViewDelegate {
    
    
    
    //MARK: - IBOutlets
    //Labels
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var dontHaveAnAccountLabel: UILabel!
    
    //TextFileds
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //Buttons
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    //MARK: - Vars
    var isClicked = false
        
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUIForLoginButton()
        setTextFieldsDelegates()
        localizeViews()
    }
    
    //MARK: - IBActions
    @IBAction func loginButtonPressed(_ sender: Any) {
       
        if isValidData() {
            loginUser()
        } else {
            ProgressHUD.showFailed(Constants.ErrorMessage.allFieldsRequired)
        }
    }
    
    @IBAction func showPasswordButtonPressed(_ sender: UIButton) {
        showPassword(isClicked, passwordTextField, sender)
        isClicked.toggle()
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        resetPassword()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    //MARK: - Localization
    private func localizeViews() {
        
        loginLabel.text = "login".localized
        dontHaveAnAccountLabel.text = "dontHaveAccuont".localized
        
        emailTextField.placeholder = "email".localized
        passwordTextField.placeholder = "password".localized
        
        forgotPasswordButton.setTitle("forgotPassword".localized, for: .normal)
        loginButton.setTitle("login".localized, for: .normal)
        signupButton.setTitle("signup".localized, for: .normal)

    }
    
    //MARK: - Setup
    private func setTextFieldsDelegates() {
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc private func textFieldDidChange(textField: UITextField) {
        updatePlaceHolders(textField: textField)
    }

    //MARK: - Animations
    private func updatePlaceHolders(textField: UITextField) {
        switch textField {
        case emailTextField:
            emailLabel.text = textField.hasText ? "email".localized : ""
        default:
            passwordLabel.text = textField.hasText ? "password".localized : ""
        }
    }
    
    //MARK: - UpadateUI
    private func updateUIForLoginButton() {
        loginButton.tintColor = .white
        loginButton.addGradientBackground()
        loginButton.addCornerRadius(cornerRadius: 10)
    }
    
    //MARK: - Helpers
    private func isValidData() -> Bool {
        
        if isValidEmail(emailTextField) && isValidPassword(passwordTextField) {
            return true
        }
        return false
        
    }
    
    private func loginUser() {
        FirebaseUserListener.shared.loginUserWithEmail(email: emailTextField.text!, password: passwordTextField.text!) { [weak self] error, isEmailVerified in
            
            guard let srtongSelf = self else { return }
            
            if error == nil {
                if isEmailVerified {
                    srtongSelf.goToHomeScreen()
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
        let homeView = UIStoryboard(name: Constants.Storyboard.home, bundle: nil).instantiateViewController(withIdentifier: Constants.Identifiers.homeView) as! HomeVC
        homeView.modalPresentationStyle = .fullScreen
        present(homeView, animated: true)
    }

}

