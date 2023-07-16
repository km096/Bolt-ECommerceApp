//
//  ItemDetailsVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/10/23.
//

import UIKit
import Cosmos

class ItemDetailsVC: UIViewController, rateViewDelegate {
    
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
    var product = ProductModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUIForTitleLabel()
        localize()
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
        setButtonColor(button: sender)
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
        
    }
    
    @IBAction func buyNowButtonPressed(_ sender: Any) {
        
    }
    
    //MARK: - Localization
    private func localize() {
        descriptionLabel.text = "description".localized
        selectSizeButton.setTitle("selectSize".localized, for: .normal)
        selectColorButton.setTitle("selectColor".localized, for: .normal)
        buyNowButton.setTitle("buyNow".localized, for: .normal)
        addToCartButton.setTitle("addToCart".localized, for: .normal)

    }
    
    //MARK: - Setup
    private func checkButtonState(button: CustomButton) {
//        if button == SButton {
//            SButton.isSelected = button == SButton
//            MButton.isSelected = false
//            LButton.isSelected = false
//        } else if button == MButton {
//            SButton.isSelected = false
//            MButton.isSelected =  button == MButton
//            LButton.isSelected = false
//        } else if button == LButton {
//            SButton.isSelected = false
//            MButton.isSelected = false
//            LButton.isSelected = button == LButton
//
//        }
        
        sSizeButton.isSelected = button == sSizeButton
        mSizeButton.isSelected =  button == mSizeButton
        lSizeButton.isSelected = button == lSizeButton


    }
    
    private func changeButtonColor(button: UIButton) {
        if button == colorButtons[0] {
            colorButtons[0].alpha = 1
            for i in colorButtons {
                if i != colorButtons[0] {
                    i.alpha = 0.5
                }
            }
        } else if button == colorButtons[1] {
            colorButtons[1].alpha = 1
            for i in colorButtons {
                if i != colorButtons[1] {
                    i.alpha = 0.5
                }
            }
        } else if button == colorButtons[2] {
            colorButtons[2].alpha = 1
            for i in colorButtons {
                if i != colorButtons[2] {
                    i.alpha = 0.5
                }
            }
        }
    }
    
    func getRating(_ rating: Double) {
        rateButton.setTitle(String(describing: rating ), for: .normal)
        updateRateLabel(rate: rating)
    }
    //MARK: - UpdateUI
    func setButtonColor(button: CustomButton) {
        let selectedColor = #colorLiteral(red: 0.4242071807, green: 0.528095901, blue: 0.8550408483, alpha: 1)
        let defaultColor  = #colorLiteral(red: 0.9209751487, green: 0.9209751487, blue: 0.9209751487, alpha: 1)
        
        let selectedTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let defaultTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        button.setButtonColor(selectedColor, selectedTintColor, forState: .selected)
        button.setButtonColor(defaultColor, defaultTintColor, forState: .normal)
       
        checkButtonState(button: button)
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
    
    private func updateUIForTitleLabel() {
        productImageView.image = UIImage(named: product.imageName!)
        productTitleLabel.text = product.title
        productPriceLabel.text = product.price
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
        
    //MARK: - PresentPopUpView
    private func presentPopUpView() {
        let popupVC = storyboard?.instantiateViewController(withIdentifier: "ratePopUpID") as! RatePopUpView

        popupVC.rateDelegate = self
        // Set the presentation style and transition style
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .crossDissolve

        // Present the pop-up view controller
        self.present(popupVC, animated: true, completion: nil)
    }
    
    
    
}
