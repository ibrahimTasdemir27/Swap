//
//  BaseProducts.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 26.07.2024.
//

import UIKit

enum BaseProducts {
    
    protocol Product: AnyObject {
        var advertHeading: String? { get set }
        var advertDescription: String? { get set }
        var address: AdressViewModel.Adress? { get set }
        var images: [UIImage]? { get set }
    }
    
}
