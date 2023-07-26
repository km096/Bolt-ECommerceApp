//
//  AddAddressVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/19/23.
//

import UIKit
import CoreData
import ProgressHUD

class AddAddressVC: UIViewController, UITextFieldDelegate, UserLocationInfoDelegate {
    
    
    
    //MARK: - IBOutlets
    //Labels
    @IBOutlet weak var createAddressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLaneLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var postalCodeLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    //TextFields
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressLaneTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var postalCodeTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    //Buttons
    @IBOutlet weak var addAddressButton: UIButton!
    
    var allFieldsEmpty: Bool = true
    var addressNew: Bool = false
    var getLocation = GetLocationVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        checkTextField()
        ConfigureTextFields()
        updateUIForAddAddressButton()
    }
    
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func addAddressButtonPressed(_ sender: Any) {

        if isTextFieldsEmpty() {
            ProgressHUD.showFailed(Constants.ErrorMessage.allFieldsRequired)
        } else {
            if isAddressNew() {
                saveAddressInfo()
                dismiss(animated: true)
            } else {
                ProgressHUD.showFailed(Constants.ErrorMessage.addressExsitedBefore)
            }
        }
    }
    
    @IBAction func getLocationButtonPressed(_ sender: Any) {
        goToLocatioScreen()
    }
    
    
    //MARK: - UpdateUI
    private func updateUIForAddAddressButton() {
        addAddressButton.addGradientBackground()
        addAddressButton.addCornerRadius(cornerRadius: 5)
        addAddressButton.tintColor = .white
    }
    
    
    //MARK: - Setup
    private func saveAddressInfo() {
        let address = Address(context: managedContextAddress)
        address.name = nameTextField.text
        address.address = addressLaneTextField.text
        address.city = cityTextField.text
        address.postalCode = postalCodeTextField.text
        address.phoneNumber = phoneNumberTextField.text
        
        AppDelegate.sharedAppDelegate.coreDataStackAddress.saveContext()
    }
    
    func getUserLocationInfo(_ name: String, _ country: String, _ postalCode: String) {
        addressLaneTextField.text = name
        cityTextField.text = country
        postalCodeTextField.text = postalCode
        
        

    }
    
    private func ConfigureTextFields() {
        for textField in self.view.subviews where textField is UITextField {
            let textField = (textField as? UITextField)
            textField?.delegate = self
        }
    }
    
    private func isTextFieldsEmpty() -> Bool {
        for textField in self.view.subviews where textField is UITextField {
            if let text = (textField as? UITextField)?.text, text.isEmpty {
                allFieldsEmpty = true
                break
            } else {
                allFieldsEmpty = false
            }
        }
        return allFieldsEmpty
    }
    
    private func isAddressNew() -> Bool {
        if let address = addressLaneTextField.text,
           let city = cityTextField.text {
            let fetchRequest = Address.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "address == %@ AND city == %@", address, city)
            
            do {
                let matchingAddress = try managedContextAddress.fetch(fetchRequest)
                if matchingAddress.first != nil {
                    addressNew = false
                } else {
                    addressNew = true
                }
            } catch {
                print("Error fetching address: \(error.localizedDescription)")
            }
        }
        return addressNew
    }
    
    //MARK: - Navigation
    private func goToLocatioScreen() {
        guard let getLocationView = storyboard?.instantiateViewController(withIdentifier: Constants.Identifiers.getLocation) as? GetLocationVC else {
            return
        }
        getLocationView.locationDelegate = self
        present(getLocationView, animated: true)
    }

}
