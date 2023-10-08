//
//  SignupVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/6/23.
//

import UIKit
import ProgressHUD

class SignupVC: UIViewController {
    
    //MARK: - IBOutlets
    //Labels
    @IBOutlet weak var signupLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var alreadyHaveAccountLabel: UILabel!
    
    //TextFileds
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //Buttons
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var resendEmailButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - Vars
    var isClicked = false

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        setTextFieldsDelegstes()
        updateUIForSignupButton()
        usernameTextField.updatePlaceholder()
        emailTextField.updatePlaceholder()
        passwordTextField.updatePlaceholder()
    }
    
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        isValidData() ? registerUser() : ProgressHUD.showFailed(Constants.ErrorMessage.allFieldsRequired)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func showPasswordButtonPressed(_ sender: UIButton) {
        showPassword(isClicked, passwordTextField, sender)
        isClicked.toggle()
    }
    
    @IBAction func resendVerifacationEmailButtonPressed(_ sender: Any) {
        resendEmail()
    }
    
    //MARK: - Localization
    private func updateViews() {
        signupLabel.text = "signup".localized
        alreadyHaveAccountLabel.text = "alreadyHaveAccount".localized
        
        usernameTextField.placeholder = "username".localized
        emailTextField.placeholder = "email".localized
        passwordTextField.placeholder = "password".localized
        
        resendEmailButton.setTitle("resendEmail".localized, for: .normal)
        loginButton.setTitle("login".localized, for: .normal)
        signupButton.setTitle("signup".localized, for: .normal)
        
    }
    
    //MARK: - Setup
    private func setTextFieldsDelegstes() {
        usernameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        UpdatePlaceHoldersLabels(textField: textField)
    }
    
    //MARK: - Animations
    private func UpdatePlaceHoldersLabels(textField: UITextField) {
        
        switch textField {
        case usernameTextField:
            usernameLabel.text = textField.hasText ? "username".localized : ""
        case emailTextField:
            emailLabel.text = textField.hasText ? "email".localized : ""
        default:
            passwordLabel.text = textField.hasText ? "password".localized : ""

        }
    }
    
    private func updateUIForSignupButton() {
        signupButton.tintColor = .white
        signupButton.addGradientBackground()
        signupButton.addCornerRadius(cornerRadius: 10)

    }
    
    //MARK: - Helpers
    private func isValidData() -> Bool {
        
        if isValidEmail(emailTextField) && isValidPassword(passwordTextField) {
            return true
        }
        return false
    }

    private func registerUser() {
        FirebaseUserListener.shared.registerWithEmail(username: usernameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!) { [weak self] error in
            
            guard let srtongSelf = self else { return }
            
            if error == nil {
                ProgressHUD.showSucceed("Emai verifacation sent.")
                srtongSelf.resendEmailButton.isHidden = false
            } else {
                ProgressHUD.showFailed(error?.localizedDescription)
            }
        }
    }
        
    private func resendEmail() {
        FirebaseUserListener.shared.resendEmailVerifacation { error in
            
            if error == nil {
                ProgressHUD.showSucceed("Varifacation email resent")
            } else {
                ProgressHUD.showFailed(error?.localizedDescription)
            }
        }
    }
    
}
