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
    @IBOutlet weak var selectSizeButton: UIButton!
    @IBOutlet weak var selectColorButton: UIButton!
    @IBOutlet weak var buyNowButton: UIButton!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
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
    var product: Product!
    var color: String = ""
    var size: String = ""
    var isFavorite: Bool? = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
        setProductInfo()
        setDescriptionLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkFavorite()
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
    
    @IBAction func colorButtonPressed(_ sender: CustomButton) {
        setColorButtons(button: sender)
    }
    
    @IBAction func addToCarrtButtonPressed(_ sender: Any) {
        addProductToCart()
    }
    
    @IBAction func buyNowButtonPressed(_ sender: Any) {
        goToCartScreen()
    }
    
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
        addToFavorite()
    }
    
    //MARK: - Localization
    private func updateViews() {
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
    
    func updatUIForFavoriteButton() {
        favoriteButton.setImage(UIImage(systemName: isFavorite! ? "heart.fill" : "heart"), for: .normal)
    }
    
    private func updateRatingLabel(_ rating: Double) {
        switch rating {
        case 5:
            rateLabel.text = "excellent".localized
        case 4:
            rateLabel.text = "veryGood".localized
        case 3:
            rateLabel.text = "veryGood".localized
        default:
            rateLabel.text = "bad".localized
        }
    }
    
    private func setsizeButtonsState(button: CustomButton) {
        sSizeButton.isSelected = button == sSizeButton
        if sSizeButton.isSelected { size = Size.small.rawValue }
            
        mSizeButton.isSelected = button == mSizeButton
        if mSizeButton.isSelected { size = Size.medium.rawValue }
        
        lSizeButton.isSelected = button == lSizeButton
        if lSizeButton.isSelected { size = Size.large.rawValue }
    }
    
    private func setColorButtons(button: CustomButton) {
        colorButtons[0].alpha = button == colorButtons[0] ? 1 : 0.5
        if button == colorButtons[0] { color = Color.brown.rawValue }
        
        colorButtons[1].alpha = button == colorButtons[1] ? 1 : 0.5
        if button == colorButtons[1] { color = Color.blue.rawValue }
        
        colorButtons[2].alpha = button == colorButtons[2] ? 1 : 0.5
        if button == colorButtons[2] { color = Color.red.rawValue }

    }

    private func setProductInfo() {
        productImageView.image = UIImage(named: product.imageName)
        productTitleLabel.text = product.title
        productPriceLabel.text = "$\(product.price)"
    }
    
    private func setDescriptionLabel() {
        decriptionTextLabel.text = descriptionText
        let moreLess = UITapGestureRecognizer(target: self, action: #selector(self.seeMore(_:)))
        decriptionTextLabel.addGestureRecognizer(moreLess)
        decriptionTextLabel.isUserInteractionEnabled = true
        decriptionTextLabel.seeMoreLessText(tag: moreLess.view?.tag ?? 0, text: descriptionText)
    }
    
    //MARK: - Helpers
    @objc func seeMore(_ gesture: UITapGestureRecognizer) {
            if gesture.view?.tag == 0 {
                decriptionTextLabel.numberOfLines = 0
                gesture.view?.tag = 1
            } else {
                decriptionTextLabel.numberOfLines = 4
                gesture.view?.tag = 0
            }
            decriptionTextLabel.seeMoreLessText(tag: gesture.view?.tag ?? 0, text: descriptionText )
        }
    
    func getProductRate(_ rating: Double) {
        rateButton.setTitle(String(describing: rating ), for: .normal)
        updateRatingLabel(rating)
    }
            
    //MARK: - PresentPopUpView
    private func presentPopUpView() {
        guard let rateView = storyboard?.instantiateViewController(withIdentifier: Constants.Identifiers.ratePopUpView) as? RatePopUpView else {
            return
        }
        rateView.rateDelegate = self
        rateView.modalPresentationStyle = .overFullScreen
        rateView.modalTransitionStyle = .crossDissolve
        self.present(rateView, animated: true, completion: nil)
    }
    
    //MARK: - Navigation
    private func goToCartScreen() {
        guard let cartVC = UIStoryboard(name: Constants.Storyboard.payment, bundle: nil).instantiateViewController(withIdentifier: Constants.Identifiers.cart) as? CartVC else {
            return
        }
        presentVC(cartVC)
    }
        
}
