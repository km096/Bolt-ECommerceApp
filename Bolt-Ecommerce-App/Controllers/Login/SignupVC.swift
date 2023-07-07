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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    //TextFileds
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //Buttons
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var resendEmailButton: UIButton!
    
    //Vars
    var isClicked = false
    var isLogin = true


    override func viewDidLoad() {
        super.viewDidLoad()

        setTextFieldsDelegstes()
        updateUIForSignupButton()
        // Do any additional setup after loading the view.
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
    
    @IBAction func eyeButtonPressed(_ sender: UIButton) {
//        if isClicked {
//            passwordTextField.isSecureTextEntry = false
//            sender.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
//        } else {
//            passwordTextField.isSecureTextEntry = true
//            sender.setImage(UIImage(systemName: "eye.fill"), for: .normal)
//        }
        securePasswordButtonPressed(isClicked, passwordTextField, sender)
        isClicked.toggle()
    }
    
    
    @IBAction func resendVerifacationEmailButtonPressed(_ sender: Any) {
        resendEmail()
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
        signupButton.tintColor = .white
        signupButton.setGradientBackground()
        signupButton.setupButton(cornerRadius: 10)

    }
    
    //MARK: - Helpers
    private func isValidData() -> Bool {
        
        if isValidEmail(emailTextField) && isValidPassword(passwordTextField) {
            return true
        }
        return false
    }

    private func registerUser() {
        
        FirebaseUserListener.shared.registerWithEmail(username: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!) { [self] error in
            
            if error == nil {
                ProgressHUD.showSucceed("Emai verifacation sent.")
                self.resendEmailButton.isHidden = false
            } else {
                ProgressHUD.showFailed(error?.localizedDescription)
            }
        }
    }
        
            
    //TODO: - resend email
    private func resendEmail() {
        FirebaseUserListener.shared.resendEmailVerifacation { error in
            error
            
            if error == nil {
                ProgressHUD.showSucceed("Varifacation email resent")
            } else {
                ProgressHUD.showFailed(error?.localizedDescription)
            }
        }
    }
    
//    private func showOrHidePassword() {
//        securePasswordButtonPressed(isClicked, passwordTextField, <#T##secureButton: UIButton##UIButton#>)
//    }
        

}
