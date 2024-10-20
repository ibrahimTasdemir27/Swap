//
//  Vehicle.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 19.07.2024.
//

import Foundation

enum VehicleType: String, Codable, CaseIterable, CategoryImplementer {
    case automobile
    //case suv
    case motorcycle
    
    static func allData() -> [String : Any] {
        return VehicleType.allCases.reduce(into: [String: Any]()) { partialResult, vehicleType in
            partialResult[vehicleType.describe()] = vehicleType.getChilds()
        }
    }
    
    static func provideData() -> [String : Any] {
        return [:]
    }
    
    func getChilds() -> [String: Any] {
        switch self {
        case .automobile:
            return CarBrand.allData()
        case .motorcycle:
            return [:]
        }
    }
    
    func describe() -> String {
        switch self {
        case .automobile:
            return "Otomobil"
        case .motorcycle:
            return "Motorsiklet"
        }
    }
}

class Vehicle: Product {
    let type: VehicleType
    
    
    init(product: Product, type: VehicleType) {
        self.type = type
        super.init(product: product)
    }
    
    init(vehicle: Vehicle) {
        self.type = vehicle.type
        super.init(product: vehicle)
    }
    
    
    private enum CodingKeys: CodingKey {
        case type
    }

    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(VehicleType.self, forKey: .type)
        try super.init(from: decoder)
    }
}



