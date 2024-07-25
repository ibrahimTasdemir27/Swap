//
//  Car.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 19.07.2024.
//

import Foundation

enum Car: String, Codable, CaseIterable, CategoryImplementer {
    static func allData() -> [String : Any] {
        return allCases.reduce(into: [String: Any]()) { partialResult, car in
            partialResult[car.describe()] = car.model
        }
    }
    
    static func provideData() -> [String : Any] {
        return [:]
    }
    
    func getChilds() -> [String : Any] {
        model.reduce(into: [String: Any]()) { partialResult, model in
            partialResult[model] = Finalizer.car
        }
    }
    
    func describe() -> String {
        return rawValue.capitalized
    }
    
    case clio
    case espace
    
    var model: [String] {
        switch self {
        case .clio:
            ["0.9 Sport Tourer", "0.9 TCe", "1.0 SCe"]
        case .espace:
            ["1.6 dCi", "1.9 dCi"]
        }
    }
    
}

enum CarBrand: String, Codable, CaseIterable, CategoryImplementer {
    static func allData() -> [String : Any] {
        return allCases.reduce(into: [String: Any]()) { partialResult, brand in
            partialResult[brand.describe()] = brand.getChilds()
        }
    }
    
    static func provideData() -> [String : Any] {
        return [:]
    }
    
    func getChilds() -> [String : Any] {
        switch self {
        case .renault:
            return series.reduce(into: [String: Any]()) { partialResult, car in
                partialResult[car.describe()] = car.getChilds()
            }
        }
    }
    
    func describe() -> String {
        return rawValue.capitalized
    }
    
    case renault
    
    
    var title: String {
        return rawValue.capitalized
    }
    
    var series: [Car] {
        switch self {
        case .renault:
            [.clio, .espace]
        }
    }
    
}

class CarEngine: Codable {
    let power: String
    let volume: String
    let traction: CarTractionType
    
    init(power: String, volume: String, traction: CarTractionType) {
        self.power = power
        self.volume = volume
        self.traction = traction
    }
}

// <# # >

class CarProduct: Vehicle {
    let brand: CarBrand
    let series: Car
    let model: String
    let year: Int
    let fuel: CarFuelType
    let caseType: CarCaseType
    let shift: CarShiftType
    let traction: CarTractionType
    let status: ProductStatus
    let kilometer: String
    let power: String
    let color: ProductColor
    let guarentee: Bool
    let seriousDamageRegistered: Bool
    
    init(vehicle: Vehicle, brand: CarBrand, series: Car, model: String, year: Int, fuel: CarFuelType, caseType: CarCaseType, shift: CarShiftType, traction: CarTractionType, status: ProductStatus, kilometer: String, power: String, color: ProductColor, guarantee: Bool, seriousDamageRegistered: Bool) {
        self.brand = brand
        self.series = series
        self.model = model
        self.year = year
        self.fuel = fuel
        self.caseType = caseType
        self.shift = shift
        self.traction = traction
        self.status = status
        self.kilometer = kilometer
        self.power = power
        self.color = color
        self.guarentee = guarantee
        self.seriousDamageRegistered = seriousDamageRegistered
        super.init(vehicle: vehicle)
    }
    
    private enum CodingKeys: CodingKey {
        case brand, series, model, year, fuel, caseType, shift, traction, status, kilometer, power, color, guarentee, seriousDamageRegistered
    }
    
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        brand = try container.decode(CarBrand.self, forKey: .brand)
        series = try container.decode(Car.self, forKey: .series)
        model = try container.decode(String.self, forKey: .model)
        year = try container.decode(Int.self, forKey: .year)
        fuel = try container.decode(CarFuelType.self, forKey: .fuel)
        caseType = try container.decode(CarCaseType.self, forKey: .caseType)
        shift = try container.decode(CarShiftType.self, forKey: .shift)
        traction = try container.decode(CarTractionType.self, forKey: .traction)
        status = try container.decode(ProductStatus.self, forKey: .status)
        kilometer = try container.decode(String.self, forKey: .kilometer)
        power = try container.decode(String.self, forKey: .power)
        color = try container.decode(ProductColor.self, forKey: .color)
        guarentee = try container.decode(Bool.self, forKey: .guarentee)
        seriousDamageRegistered = try container.decode(Bool.self, forKey: .seriousDamageRegistered)
        try super.init(from: decoder)
    }
}


enum CarFuelType: String, Codable, CaseIterable, Describer {
    case diesel
    case gasoline
    case gasolinelpg
    case hybrid
    
    func describe() -> String {
        switch self {
        case .diesel:       return "Dizel"
        case .gasoline:     return "Benzin"
        case .gasolinelpg:  return "Benzin&LPG"
        case .hybrid:       return "Hibrit"
        }
    }
}

enum CarShiftType: String, Codable, CaseIterable, Describer {
    case manual
    case automatic
    
    func describe() -> String {
        switch self {
        case .manual:       return "Manuel"
        case .automatic:    return "Otomatik"
        }
    }
}

enum ProductStatus: String, Codable, CaseIterable, Describer {
    case zero
    case second
    
    func describe() -> String {
        switch self {
        case .zero:         return "Sıfır"
        case .second:       return "İkinci El"
        }
    }
}

enum CarCaseType: String, Codable, CaseIterable, Describer {
    case sedan
    case hatchback
    case stationwagon
    case suv
    case pickup
    case minivan
    case panelvan
    case coupe
    case crossover
    case mpv
    case cabrio
    
    
    func describe() -> String {
        switch self {
        case .sedan:        return "Sedan"
        case .hatchback:    return "Hatchback"
        case .stationwagon: return "Station Wagon"
        case .suv:          return "SUV"
        case .pickup:       return "Pickup"
        case .minivan:      return "Minivan"
        case .panelvan:     return "Panelvan"
        case .coupe:        return "Coupe"
        case .crossover:    return "Crossover"
        case .mpv:          return "MPV"
        case .cabrio:       return "Cabrio"
        }
    }
}

enum CarTractionType: String, Codable, CaseIterable, Describer {
    case front
    case behind
    
    func describe() -> String {
        switch self {
        case .front:        return "Önden Çekiş"
        case .behind:       return "Arkadan Çekiş"
        }
    }
}

