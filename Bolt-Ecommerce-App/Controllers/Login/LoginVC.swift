//
//  LoginVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/4/23.
//

import UIKit


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
//    var from: String!
//    var fromLogin = true
    var isLogin = true
    var isClicked = false
    var users = [UserItem]()
    
//    let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()


//        updateUIFor(Login: isLogin)
        getUser()
        setTextFieldsDelegstes()
        updateUIForLoginButton()
        print("is login: \(isLogin)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        updateUIFor(Login: fromLogin)
//        print(fromLogin)
        getUser()
    }
    
    //MARK: - IBActions
    @IBAction func loginButtonPressed(_ sender: Any) {
        if isValidData() {
            loginUser()
        } else {
            displayError(viewController: self, message: Constants.ErrorMessage.allFieldsRequired)
        }
        
        
    }
    
//    @IBAction func signupButtonPressed(_ sender: UIButton) {
//        updateUIFor(Login: sender.titleLabel?.text == "Sign In")
//        isLogin.toggle()
//        print("is login: \(isLogin)")
//        
//    }
    
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
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    //MARK: - Setup
    private func setTextFieldsDelegstes() {
//        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        UpdatePlaceHoldersLabels(textField: textField)
    }

    //MARK: - Animations
    private func UpdatePlaceHoldersLabels(textField: UITextField) {
        
        switch textField {
//        case nameTextField:
//            nameLabel.text = textField.hasText ? "Name" : ""
        case emailTextField:
            emailLabel.text = textField.hasText ? "Email" : ""
        default:
            passwordLabel.text = textField.hasText ? "Password" : ""

        }
    }
    
    private func updateUIForLoginButton() {
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setGradientBackground()

    }
    
    private func updateUI(login: String) {
        
    }
    
    //MARK: - Helpers
//    private func isUserLogedIn() -> Bool {
//        
//    }
    
    private func isValidData() -> Bool {
        
        if isValidEmail(emailTextField) && isValidPassword(passwordTextField) {
            return true
        }
        return false
        
    }
    
//    private func isValidEmail(_ emailText: UITextField) -> Bool {
//        if let email = emailText.text, !email.isEmpty  {
//            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
//            return emailPredicate.evaluate(with: email)
//        }
//        
//        return false
//    }
//    
//    private func isValidPassword(_ passwordText: UITextField) -> Bool {
//        if let password = passwordText.text, !password.isEmpty && password.count >= 6{
//            return true
//        }
//        return false
//    }
        
    
    
    
    private func loginUser() {
        if isValidData() {
            if users.count > 0, let user = users.first(where: {$0.email == emailTextField.text && $0.password == passwordTextField.text}) {
                user.isLogin = true
                do {
                    try context.save()
                } catch {
                    print("Could not save login: \(error.localizedDescription)")
                }
                isLogin = user.isLogin
                goToHomeScreen()
            } else {
                displayError(viewController: self, message: Constants.ErrorMessage.worngEmail)
            }
        }
    }
    
//    private func registerUser() {
//        if isDataInputedFor(type: "register") {
//            if let user = users.first(where: {$0.email == emailTextField.text}) {
//                //TODO: - display error
//                displayError(message: Constants.ErrorMessage.registeredBefore)
//                user.isLogin = true
//               
//                isLogin = user.isLogin
//            } else {
//                createUser { finished in
//                    print("user created")
//                }
//            }
//        }
//        
//    }
    
    private func getUser() {
        
        do {
            users = try context.fetch(UserItem.fetchRequest())
            print("users num: \(users.count)")

        } catch {
            print("Could not fetch: \(error.localizedDescription)")
        }
    }
    
//    private func createUser(completion: (_ finished: Bool) -> ()) {
//        let newUser = UserItem(context: context)
//        newUser.username = nameTextField.text
//        newUser.email = emailTextField.text
//        newUser.password = passwordTextField.text
//        
//        do {
//            try context.save()
//            completion(true)
//        } catch {
//            print("Could not save user: \(error.localizedDescription)")
//            completion(false)
//        }
//    }
    
//    private func displayError(message: String) {
//        let alert = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default))
//        self.present(alert, animated: true)
//    }
    
    // MARK: - Navigation
    private func goToHomeScreen() {
        let homeView = UIStoryboard(name: Constants.Storyboard.home, bundle: nil).instantiateViewController(withIdentifier: Constants.Identifiers.homeView) as! HomeVc
        present(homeView, animated: true)
    }

}
