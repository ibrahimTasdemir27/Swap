//
//  AllAdverterRequirements.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 1.08.2024.
//

import UIKit


protocol AdvertPropertyProvider: AnyObject {
    func basicsInfoRequirementsSuccess()
    func createAdvertProductSuccess(_ product: Product, with images: [UIImage])
}


typealias AdvertViewControllerType = BaseViewController & AdressPreviewer & AdressViewController.Delegate & RequestGalleryViewController.Delegate & GalleryPreviewer

protocol AllAdvertRequirementsController: AdvertPropertyProvider where Self: AdvertViewControllerType {
    var presentable: (any AdvertPresentable)? { get }
    
}

extension AllAdvertRequirementsController {
    func basicsInfoRequirementsSuccess() {
        previewAdress()
    }
    
    func createAdvertProductSuccess(_ product: Product, with images: [UIImage]) {
        let vc = AdvertPreviewViewController.create(for: product, with: images)
        navigationController?.pushViewController(vc, animated: true)
    }
    func readyAdressContent(_ adress: AdressViewModel.Adress) {
        presentable?.address = adress
        previewGallery()
    }
    
    func didFinishSelectImage(with images: [UIImage]) {
        presentable?.images = images
        presentable?.pickImageSuccess(images)
    }
}
