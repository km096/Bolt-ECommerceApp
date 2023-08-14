//
//  LanguageVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/31/23.
//

import UIKit

protocol LanguageSelectionDelegate {
    func LanguageViewController(_ vc: LanguageVC, didSelectLanguage language: Language)
}

class LanguageVC: UIViewController {

    @IBOutlet weak var languageTableView: UITableView!
    
    let languages = [Language(languageCode: "en", language: "English"), Language(languageCode: "ar", language: "Arabic")]
    var delegate : LanguageSelectionDelegate?
    var selectedIndex: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        print("current Language: \(currentLang)")
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    private func configureTableView() {
        languageTableView.delegate = self
        languageTableView.dataSource = self
        languageTableView.register(LanguageCell.nib, forCellReuseIdentifier: LanguageCell.identifier)
    }
    
   
    
}





