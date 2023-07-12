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
    @IBOutlet weak var decriptionLabel: UILabel!
    @IBOutlet weak var ItemTitleLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var rateButton: UIButton!
    
    //SizeButtonsOutlets
    @IBOutlet weak var SButton: CustomButton!
    @IBOutlet weak var MButton: CustomButton!
    @IBOutlet weak var LButton: CustomButton!
    
    //ColorButtonsOutlets
    @IBOutlet var colorButtons: [UIButton]!
    
    
    //ViewsOutlets
    @IBOutlet weak var selectColorView: UIView!
    @IBOutlet weak var selectSizeView: UIView!
    
    //Vars
    var selectView = UIView()
    var item = ItemModel()
    var isColorSelected = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUIForTitleLabel()
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
//        selectSizeView.isHidden = false
    }
    
    @IBAction func selectColorButtonPressed(_ sender: Any) {
        selectColorView.isHidden = false
//        selectSizeView.isHidden = true
    }
    
    @IBAction func colorButtonPressed(_ sender: UIButton) {
        checkButtonColor(button: sender)
        print("Color: \(sender.backgroundColor)")
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
    
    private func checkButtonState(button: CustomButton) {
        if button == SButton {
            SButton.isSelected = true
            MButton.isSelected = false
            LButton.isSelected = false
        } else if button == MButton {
            SButton.isSelected = false
            MButton.isSelected = true
            LButton.isSelected = false
        } else if button == LButton {
            SButton.isSelected = false
            MButton.isSelected = false
            LButton.isSelected = true

        }
    }
    
    private func checkButtonColor(button: UIButton) {
        if button == colorButtons[0] {
            colorButtons[0].layer.borderColor = UIColor.black.cgColor
            colorButtons[1].layer.borderColor = UIColor.systemBlue.cgColor
            colorButtons[2].layer.borderColor = UIColor.systemRed.cgColor
        } else if button == colorButtons[1] {
            colorButtons[1].layer.borderColor = UIColor.black.cgColor
            colorButtons[0].layer.borderColor = UIColor.systemBrown.cgColor
            colorButtons[2].layer.borderColor = UIColor.systemRed.cgColor
        } else if button == colorButtons[2] {
            colorButtons[2].layer.borderColor = UIColor.black.cgColor
            colorButtons[0].layer.borderColor = UIColor.systemBrown.cgColor
            colorButtons[1].layer.borderColor = UIColor.systemBlue.cgColor
        }
    }
    
    private func updateRateLabel(rate: Double) {
        if rate == 5 {
            rateLabel.text = "Excellent"
        } else if rate == 4 {
            rateLabel.text = "Very Good"
        } else if rate == 3 {
            rateLabel.text = "Good"
        } else {
            rateLabel.text = "Bad"

        }
    }
    
    private func updateUIForTitleLabel() {
        itemImageView.image = UIImage(named: item.imageName!)
        ItemTitleLabel.text = item.title
        itemPriceLabel.text = item.price
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
    
    func rating(_ rate: Double) {
        rateButton.setTitle(String(describing: rate ), for: .normal)
        print("rating: \(rate)")
        updateRateLabel(rate: rate)
    }
    
}
