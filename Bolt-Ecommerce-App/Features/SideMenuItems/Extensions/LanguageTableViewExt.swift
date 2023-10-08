//
//  LanguageTableViewExt.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 8/9/23.
//

import UIKit
import MOLH

extension LanguageVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: LanguageCell.identifier, for: indexPath) as? LanguageCell {
            cell.languageLabel.text = languages[indexPath.row].language
            
            if MOLHLanguage.currentAppleLanguage() == languages[indexPath.row].languageCode {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }

            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath
//        let selectedLanguage = self.languages[indexPath.row]
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
        MOLH.reset(transition: .transitionCrossDissolve)
        self.languageTableView.reloadData()


    }
    
    
    
}
