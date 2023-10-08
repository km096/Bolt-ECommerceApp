//
//  LanguageVC.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/31/23.
//

import UIKit


class LanguageVC: UIViewController {

    @IBOutlet weak var languageTableView: UITableView!
    
    let languages = [Language(languageCode: "en", language: "english".localized), Language(languageCode: "ar", language: "arabic".localized)]
    var selectedIndex: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // Do any additional setup after loading the view.
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
