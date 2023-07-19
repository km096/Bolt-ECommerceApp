//
//  RatePopUpView.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/11/23.
//

import UIKit
import Cosmos

protocol rateViewDelegate {
    func getRating(_ rating: Double)
}

class RatePopUpView: UIViewController {
    
    @IBOutlet weak var rateView: CosmosView!
    @IBOutlet weak var containerView: UIView!
    
    var rateDelegate: rateViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupRating()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func setupRating() {
        rateView.didTouchCosmos = { rating in
            self.rateDelegate?.getRating(rating)
        }
    }

}
