//
//  ProductCategorys.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import Foundation

enum ProductCategory: String, Codable, CaseIterable, CategoryImplementer {
    case vehicle
    case estate
    case electronic
    
}

extension ProductCategory {
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
        case .vehicle:
            return VehicleType.allData()
        case .estate:
            return EstateType.allData()
        case .electronic:
            return ElectronicProductEnvironment.ElectronicCategory.allData()
            
        }
    }
    
    func describe() -> String {
        switch self {
        case .vehicle:
            return "Taşıt"
        case .estate:
            return "Emlak"
        case .electronic:
            return "Elektronik"
            //        case .land:
            //            return "Emlak"
        }
    }
}


//MARK: -> Vehicle/Automobile/Renault/Clio/1.3TCe
/*
 Model lazım ?
 Yakıt tipi lazım ?
 Bu 5 adımı geçtikten sonra
 Model yılı seçsin ?
 Yakıt tipi seçsin ?
 
 
 */

