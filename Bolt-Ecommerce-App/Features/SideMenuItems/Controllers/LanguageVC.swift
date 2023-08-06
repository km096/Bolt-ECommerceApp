//
//  LanguageVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/31/23.
//

import UIKit

class LanguageVC: UIViewController {

    @IBOutlet weak var enLangButton: UIButton!
    @IBOutlet weak var arLangButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        print("current Language: \(currentLang)")
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func enLangButtonPressed(_ sender: Any) {
        
        let newLanguage = currentLang == "en" ? "ar" : "en"
        UserDefaults.standard.set([newLanguage], forKey: "AppleLanguages")
        exit(0)
    }
    
    
   
    
}
