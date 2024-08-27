//
//  AllAdverterRequirements.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 1.08.2024.
//

import UIKit

/*
 Şimdi advert gösterecek controller için tip koşullarını karlılayan typealias'a;
    typealias = AdvertViewControllerType dedik
 
 Bu advert'in tüm adımlarını yöneten bir protokol controller var ->
 func basicsInfoRequirementsSuccess()
 func createAdvertProductSuccess(_ product: Product, with images: [UIImage])
 func readyAdressContent(_ adress: AdressViewModel.Adress)
 func didFinishSelectImage(with images: [UIImage])
 
 Şimdi bu protokol bir controller içerisinde kullanılması gerektiği için buna AllAdvertRequirementsController diyebilirim
 
 Bir de bu adverti hazırlayan bir protokol var ->
 func setupBasicInfo()
 func createAdvert() -> AdvertType?
 func pickImageSuccess(_ images: [UIImage])
 
 Bu da bilgileri sağlayan bir data görevi görüyor oluşturuyor adverti oluşturan kısım burası
 
 
 
 
 */

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
