//
//  ElectronicProduct.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 31.07.2024.
//

import Foundation


class ElectronicProduct: Product {
    let guarantee: Bool
    
    init(product: Product, guarantee: Bool) {
        self.guarantee = guarantee
        super.init(product: product)
    }
    
    init(electronic: ElectronicProduct) {
        self.guarantee = electronic.guarantee
        super.init(product: electronic)
    }
    
    required init(from decoder: any Decoder) throws {
        enum CodingKeys: CodingKey {
            case guarantee
        }
        let container = try decoder.container(keyedBy: CodingKeys.self)
        guarantee = try container.decode(Bool.self, forKey: .guarantee)
        try super.init(from: decoder)
    }
    
}




struct ElectronicProductEnvironment {    
    enum ElectronicCategory: String, Describer, CaseIterable, CategoryImplementer {
        static func allData() -> [String : Any] {
            return allCases.reduce(into: [String: Any]()) { partialResult, category in
                partialResult[category.describe()] = category.getChilds()
            }
        }
        
        static func provideData() -> [String : Any] {
            return [:]
        }
        
        func getChilds() -> [String : Any] {
            switch self {
            case .computer: return ComputerEnvironment.ComputerCategory.allData()
            case .phone:    return PhoneEnvironment.ProductType.allData()
            case .other:    return [Finalizer.otherelectronic.rawValue : Finalizer.otherelectronic.rawValue ]
            }
        }
        
        case computer
        case phone
        case other
        
        func describe() -> String {
            switch self {
            case .computer:             return "Bilgisayar"
            case .phone:                return "Telefon"
            case .other:                return "Diğer Her Şey"
            }
        }
    }
}
