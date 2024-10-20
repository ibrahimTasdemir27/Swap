//
//  Product.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 19.07.2024.
//

import UIKit

protocol BaseProductImplementer {
    
}

enum SellerType: Codable {
    case individual
    case company
}

class ProductSeller: Codable {
    let id: String
    let name: String
    let type: SellerType
    let registerDate: String
    let registerTimeStamp: Int
    let phone: String
    
    init(id: String, name: String, type: SellerType, registerDate: String = Date().toStringSmall(), registerTimeStamp: Int = Date.getTimeStamp(), phone: String) {
        self.id = id
        self.name = name
        self.type = type
        self.registerDate = registerDate
        self.registerTimeStamp = registerTimeStamp
        self.phone = phone
    }
}

class Product: BaseProductImplementer, Codable {
    let id: String
    let heading: String
    let description: String
    let seller: ProductSeller
    let listingDate: String
    let timestamp: Int
    let adress: AdressViewModel.Adress
    let categoryArray: [String]
    let primaryImage: String?
    let images: [String]
    
    
    var categoryStrings: String {
        return categoryArray.joined(separator: " > ")
    }
    
    init(id: String = UUID().uuidString, heading: String, description: String, seller: ProductSeller, listingDate: String = Date().toStringSmall(), timestamp: Int = Date.getTimeStamp(), adress: AdressViewModel.Adress, categoryArray: [String], primaryImage: String? = nil, images: [String]) {
        self.id = id
        self.heading = heading
        self.description = description
        self.seller = seller
        self.listingDate = listingDate
        self.timestamp = timestamp
        self.adress = adress
        self.categoryArray = categoryArray
        self.primaryImage = primaryImage
        self.images = images
    }
    
    init(product: Product) {
        self.id = product.id
        self.heading = product.heading
        self.description = product.description
        self.seller = product.seller
        self.listingDate = product.listingDate
        self.timestamp = product.timestamp
        self.adress = product.adress
        self.categoryArray = product.categoryArray
        self.primaryImage = product.primaryImage
        self.images = product.images
    }

    
}


enum ProductColor: String, Codable, CaseIterable, Describer {
    case brown
    case red
    case blue
    case gray
    case green
    case black
    case white
    
    func describe() -> String {
        switch self {
        case .brown:     return "Kahverengi"
        case .red:       return "Kırmızı"
        case .blue:      return "Mavi"
        case .gray:      return "Gri"
        case .green:     return "Yeşil"
        case .black:     return "Siyah"
        case .white:     return "Beyaz"
        }
    }
    
}

