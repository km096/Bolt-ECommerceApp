//
//  AddAddressVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/19/23.
//

import UIKit
import CoreData
import ProgressHUD

class AddAddressVC: UIViewController, UITextFieldDelegate {
    
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
    @IBOutlet weak var getLocationButton: UIButton!
    
    //Vars
    var allFieldsEmpty: Bool = true
    var addressNew: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
        setTextFieldsDelegates()
        updateUIForAddAddressButton()
        updateUIForGetLocationButton()
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
        goToLocationScreen()
    }
    
    //MARK: - UpdateUI
    private func updateUIForAddAddressButton() {
        addAddressButton.addGradientBackground()
        addAddressButton.addCornerRadius(cornerRadius: 5)
        addAddressButton.tintColor = .white
        addAddressButton.setTitle("addAddress".localized, for: .normal)
    }
    
    private func updateUIForGetLocationButton() {
        getLocationButton.addGradientBackground()
        getLocationButton.setTitle("getLocation".localized, for: .normal)
        getLocationButton.addCornerRadius(cornerRadius: 5)
    }
    
    private func updateViews() {
        createAddressLabel.text = "createAddress".localized
        nameLabel.text = "name".localized
        addressLaneLabel.text = "address".localized
        cityLabel.text = "city".localized
        postalCodeLabel.text = "postalCode".localized
        phoneNumberLabel.text = "phoneNumber".localized
        
    }
    
    //MARK: - Setup
    private func setTextFieldsDelegates() {
        for textField in self.view.subviews where textField is UITextField {
            let textField = (textField as? UITextField)
            textField?.delegate = self
            textField?.updatePlaceholder()
        }
    }
    
    private func saveAddressInfo() {
        let address = Address(context: managedContextAddress)
        address.name = nameTextField.text
        address.address = addressLaneTextField.text
        address.city = cityTextField.text
        address.postalCode = postalCodeTextField.text
        address.phoneNumber = phoneNumberTextField.text
        
        AppDelegate.sharedAppDelegate.coreDataStackAddress.saveContext()
    }
    
    
    
    //MARK: - Helpers
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
    private func goToLocationScreen() {
        guard let getLocationVC = storyboard?.instantiateViewController(withIdentifier: Constants.Identifiers.getLocation) as? GetLocationVC else {
            return
        }
        getLocationVC.locationDelegate = self
        presentVC(getLocationVC)

    }

}

extension AddAddressVC: UserLocationInfoDelegate {
    func getUserLocationInfo(_ name: String, _ address: String, _ city: String, _ postalCode: String) {
        nameTextField.text = name
        addressLaneTextField.text = address
        cityTextField.text = city
        postalCodeTextField.text = postalCode
    }

}
