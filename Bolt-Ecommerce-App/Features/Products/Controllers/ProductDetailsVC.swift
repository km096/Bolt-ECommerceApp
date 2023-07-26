//
//  ItemDetailsVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/10/23.
//

import UIKit
import Cosmos
import CoreData
import ProgressHUD

class ProductDetailsVC: UIViewController, rateViewDelegate {
    
    //MARK: - IBOutlets
    //Labels
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var decriptionTextLabel: UILabel!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    //ImageViews
    @IBOutlet weak var productImageView: UIImageView!
    
    //Buttons
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var selectSizeButton: UIButton!
    @IBOutlet weak var selectColorButton: UIButton!
    @IBOutlet weak var buyNowButton: UIButton!
    @IBOutlet weak var addToCartButton: UIButton!
    
    //SizeButtonsOutlets
    @IBOutlet weak var sSizeButton: CustomButton!
    @IBOutlet weak var mSizeButton: CustomButton!
    @IBOutlet weak var lSizeButton: CustomButton!
    
    //ColorButtonsOutlets
    @IBOutlet var colorButtons: [UIButton]!
    
    //ViewsOutlets
    @IBOutlet weak var selectColorView: UIView!
    @IBOutlet weak var selectSizeView: UIView!
    
    //Vars
    var selectView = UIView()
    var product: Product!
    var color: String = ""
    var size: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        localize()
        setupTitleLabel()
        moreButton.addTarget(self, action: #selector(expandLabel), for: .touchUpInside)
    }

    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func rateButtonPressed(_ sender: Any) {
        presentPopUpView()
    }
    
    @IBAction func sizeButtonPressed(_ sender: CustomButton) {
        updateUIForSizeButton(button: sender)
    }
    
    @IBAction func selectSizeButtonPressed(_ sender: Any) {
        selectColorView.isHidden = true
    }
    
    @IBAction func selectColorButtonPressed(_ sender: Any) {
        selectColorView.isHidden = false
    }
    
    @IBAction func colorButtonPressed(_ sender: UIButton) {
        changeButtonColor(button: sender)
    }
    
    @IBAction func addToCarrtButtonPressed(_ sender: Any) {
        addItemToCart()
    }
    
    @IBAction func buyNowButtonPressed(_ sender: Any) {
        goToCartScreen()
    }
    
    //MARK: - Localization
    private func localize() {
        descriptionLabel.text = "description".localized
        selectSizeButton.setTitle("selectSize".localized, for: .normal)
        selectColorButton.setTitle("selectColor".localized, for: .normal)
        buyNowButton.setTitle("buyNow".localized, for: .normal)
        addToCartButton.setTitle("addToCart".localized, for: .normal)
    }
    
    //MARK: - UpdateUI
    private func updateUIForSizeButton(button: CustomButton) {
        let selectedColor = #colorLiteral(red: 0.4242071807, green: 0.528095901, blue: 0.8550408483, alpha: 1)
        let defaultColor  = #colorLiteral(red: 0.9209751487, green: 0.9209751487, blue: 0.9209751487, alpha: 1)
        
        let selectedTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let defaultTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        button.setButtonColor(selectedColor, selectedTintColor, forState: .selected)
        button.setButtonColor(defaultColor, defaultTintColor, forState: .normal)
       
        setsizeButtonsState(button: button)
    }
    
    //MARK: - Setup
    private func setsizeButtonsState(button: CustomButton) {
        if button == sSizeButton {
            sSizeButton.isSelected = true
            mSizeButton.isSelected = false
            lSizeButton.isSelected = false
            size = Size.small.rawValue
        } else if button == mSizeButton {
            sSizeButton.isSelected = false
            mSizeButton.isSelected = true
            lSizeButton.isSelected = false
            size = Size.medium.rawValue

        } else if button == lSizeButton {
            sSizeButton.isSelected = false
            mSizeButton.isSelected = false
            lSizeButton.isSelected = true
            size = Size.large.rawValue
        }
    }
    
    private func changeButtonColor(button: UIButton) {
        if button == colorButtons[0] {
            colorButtons[0].alpha = 1
            for i in colorButtons {
                if i != colorButtons[0] {
                    i.alpha = 0.5
                }
            }
            color = Color.brown.rawValue
        } else if button == colorButtons[1] {
            colorButtons[1].alpha = 1
            for i in colorButtons {
                if i != colorButtons[1] {
                    i.alpha = 0.5
                }
            }
            color = Color.blue.rawValue

        } else if button == colorButtons[2] {
            colorButtons[2].alpha = 1
            for i in colorButtons {
                if i != colorButtons[2] {
                    i.alpha = 0.5
                }
            }
            color = Color.red.rawValue
        }
    }

    private func setupTitleLabel() {
        productImageView.image = UIImage(named: product.imageName)
        productTitleLabel.text = product.title
        productPriceLabel.text = "$\(product.price)"
    }
    
    //MARK: - Helpers
    func getRating(_ rating: Double) {
        rateButton.setTitle(String(describing: rating ), for: .normal)
        updateRateLabel(rate: rating)
    }
    
    private func addItemToCart() {
        let fetchRequest = CartItems.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@ AND #size == %@ AND color == %@", product.id, size, color)
        
        do {
            let matchingItems = try managedContextCartItems.fetch(fetchRequest)
            
            if let existingItems = matchingItems.first{
                existingItems.quantity += 1
            } else {
                let cartItem = CartItems(context: managedContextCartItems)
                cartItem.quantity = 1
                cartItem.id = product.id
                cartItem.title = product.title
                cartItem.price = product.price
                cartItem.imageName = product.imageName
                cartItem.color = color
                cartItem.size = size
            }
            
            AppDelegate.sharedAppDelegate.coreDataStackCartItems.saveContext()
            ProgressHUD.showSucceed("Item added to the cart")

        } catch {
            print("Error fetching items: \(error.localizedDescription)")
        }
    }
    
    @objc func expandLabel() {
        if moreButton.titleLabel?.text == "more".localized {
            moreButton.setTitle("collapse".localized, for: .normal)
            decriptionTextLabel.numberOfLines = 0
            decriptionTextLabel.lineBreakMode = .byCharWrapping
        } else {
            moreButton.setTitle("more".localized, for: .normal)
            decriptionTextLabel.numberOfLines = 3
            decriptionTextLabel.lineBreakMode = .byTruncatingTail
        }
    }
    
    private func updateRateLabel(rate: Double) {
        if rate == 5 {
            rateLabel.text = "excellent".localized
        } else if rate == 4 {
            rateLabel.text = "veryGood".localized
        } else if rate == 3 {
            rateLabel.text = "good".localized
        } else {
            rateLabel.text = "bad".localized

        }
    }
        
    //MARK: - PresentPopUpView
    private func presentPopUpView() {
        guard let popupView = storyboard?.instantiateViewController(withIdentifier: "ratePopUpID") as? RatePopUpView else {
            return
        }

        popupView.rateDelegate = self
        popupView.modalPresentationStyle = .overFullScreen
        popupView.modalTransitionStyle = .crossDissolve
        self.present(popupView, animated: true, completion: nil)
    }
    
    //MARK: - Navigation
    private func goToCartScreen() {
        guard let cartView = UIStoryboard(name: Constants.Storyboard.payment, bundle: nil).instantiateViewController(withIdentifier: Constants.Identifiers.cart) as? CartVC else {
            return
        }
        present(cartView, animated: true)
    }
        
}
