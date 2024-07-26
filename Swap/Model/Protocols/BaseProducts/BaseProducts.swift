//
//  BaseProducts.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 26.07.2024.
//

import UIKit

enum BaseProducts {
    
    protocol Product {
        var advertHeadingField: String? { get }
        var advertDescriptionField: String? { get }
        var address: AdressViewModel.Adress? { get }
        var images: [UIImage]? { get }
    }
    
}
