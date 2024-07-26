//
//  Advert.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 25.07.2024.
//

import UIKit

protocol AdvertPresentable {
    associatedtype AdvertType: Product
    func setupBasicInfo()
    func createAdvert() -> AdvertType?
    func pickImageSuccess(_ images: [UIImage])
}

extension AdvertPresentable {
    func pickImageSuccess(_ images: [UIImage]) {
        fatalError("Did you know this not implemented")
    }
}

protocol AdvertPropertyProvider: AnyObject {
    func basicsInfoRequirementsSuccess()
}

