//
//  EditProfileExt.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 8/6/23.
//

import UIKit
import Gallery
import ProgressHUD

extension EditProfileVC: GalleryControllerDelegate {
    
    func galleryController(_ controller: Gallery.GalleryController, didSelectImages images: [Gallery.Image]) {
        if images.count > 0 {
            images.first?.resolve(completion: { [weak self] avatarImage in
                guard let strongSelf = self else { return }
                
                guard let avatarImage = avatarImage else {
                    ProgressHUD.showError("Could not select image")
                    return
                }
                strongSelf.uploadUserImage(avatarImage)
                strongSelf.userImageView.image = avatarImage
                
            })
        }
        controller.dismiss(animated: true)
    }
    
    func galleryController(_ controller: Gallery.GalleryController, didSelectVideo video: Gallery.Video) {
        controller.dismiss(animated: true)
    }
    
    func galleryController(_ controller: Gallery.GalleryController, requestLightbox images: [Gallery.Image]) {
        controller.dismiss(animated: true)
    }
    
    func galleryControllerDidCancel(_ controller: Gallery.GalleryController) {
        controller.dismiss(animated: true)
    }
    
    
}

