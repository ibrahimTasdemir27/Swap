//
//  Estate.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 22.07.2024.
//

import Foundation

/* Bulunduğu kat - Otopark */
class EstateProduct: Product {
    let type: HouseType
    let sqftGrand: Int
    let sqftReal: Int
    let room: Room
    let age: Int
    let floor: Int
    let heating: HeatingType
    let bath: Int
    let balcony: Bool
    let lift: Bool
    let furniture: Bool
    let status: EstateState
    let landRegister: EstateLandRegisterStatus
    
    init(product: Product, type: HouseType, sqftGrand: Int, sqftReal: Int, room: Room, age: Int, floor: Int, heating: HeatingType, bath: Int, balcony: Bool, lift: Bool, furniture: Bool, status: EstateState, landRegister: EstateLandRegisterStatus) {
        self.type = type
        self.sqftGrand = sqftGrand
        self.sqftReal = sqftReal
        self.room = room
        self.age = age
        self.floor = floor
        self.heating = heating
        self.bath = bath
        self.balcony = balcony
        self.lift = lift
        self.furniture = furniture
        self.status = status
        self.landRegister = landRegister
        super.init(product: product)
    }
    
    init(estate: EstateProduct) {
        self.type = estate.type
        self.sqftGrand = estate.sqftGrand
        self.sqftReal = estate.sqftReal
        self.room = estate.room
        self.age = estate.age
        self.floor = estate.floor
        self.heating = estate.heating
        self.bath = estate.bath
        self.balcony = estate.balcony
        self.lift = estate.lift
        self.furniture = estate.furniture
        self.status = estate.status
        self.landRegister = estate.landRegister
        super.init(product: estate)
    }
    
    @frozen private enum CodingKeys: CodingKey {
        case type, sqftGrand, sqftReal, room, age, floor, heating, bath, balcony, lift, furniture, status,  landRegister
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(HouseType.self, forKey: .type)
        sqftGrand = try container.decode(Int.self, forKey: .sqftGrand)
        sqftReal = try container.decode(Int.self, forKey: .sqftReal)
        room = try container.decode(Room.self, forKey: .room)
        age = try container.decode(Int.self, forKey: .age)
        floor = try container.decode(Int.self, forKey: .floor)
        heating = try container.decode(HeatingType.self, forKey: .heating)
        bath = try container.decode(Int.self, forKey: .bath)
        balcony = try container.decode(Bool.self, forKey: .balcony)
        lift = try container.decode(Bool.self, forKey: .lift)
        furniture = try container.decode(Bool.self, forKey: .furniture)
        status = try container.decode(EstateState.self, forKey: .status)
        landRegister = try container.decode(EstateLandRegisterStatus.self, forKey: .landRegister)
        try super.init(from: decoder)
    }

    
}



enum EstateLandRegisterStatus: Describer, CaseIterable, Codable {
    case floor
    case easement
    case shareholder
    case detached
    case land
    case unknownland
    
    func describe() -> String {
        switch self {
        case .floor:            return "Kat Mülkiyetli"
        case .easement:         return "Kat İrtifaklı"
        case .shareholder:      return "Hisseli Tapulu"
        case .detached:         return "Müstakil Tapulu"
        case .land:             return "Arsa Tapulu"
        case .unknownland:      return "Bilinmiyor"
        }
    }
}

enum EstateState: Describer, CaseIterable, Codable {
    case empty
    case tenanted
    case landholder
    
    func describe() -> String {
        switch self {
        case .empty:            return "Boş"
        case .tenanted:         return "Kiracılı"
        case .landholder:       return "Mülk Sahibi"
        }
    }
}

enum HeatingType: String, Describer, CaseIterable, Codable {
    case air
    case naturalgas
    case stove
    
    func describe() -> String {
        switch self {
        case .air:              return "Klima"
        case .naturalgas:       return "Doğalgaz"
        case .stove:            return "Soba"
        }
    }
}

enum HouseType: String, Describer, CaseIterable, Codable {
    case apartment
    case residence
    case detached
    case villa
    case farm
    case mansion
    case waterside
    case watersideapartment
    case summery
    case prefabricated
    case cooperative
    
    func describe() -> String {
        switch self {
        case .apartment:            return "Daire"
        case .residence:            return "Rezidans"
        case .detached:             return "Müstakil Ev"
        case .villa:                return "Villa"
        case .farm:                 return "Çiftlik Evi"
        case .mansion:              return "Köşk & Konak"
        case .waterside:            return "Yalı"
        case .watersideapartment:   return "Yalı Dairesi"
        case .summery:              return "Yazlık"
        case .prefabricated:        return "Prefabrik"
        case .cooperative:          return "Kooperatif"
        }
    }
}

//Şimdi şöyle oldu ;
/*
 Emlak -> Konut -> Daire #Finalize olması lazım
 
 */

extension HouseType: CategoryImplementer {
    static func allData() -> [String : Any] {
        return HouseType.allCases.reduce(into: [String: Any]()) { partialResult, house in
            partialResult[house.describe()] = Finalizer(rawValue: house.rawValue)
        }
    }
    
    static func provideData() -> [String : Any] {
        return [:]
    }
    
    func getChilds() -> [String : Any] {
        
        return [:]
    }
    
    
}


enum Room: Describer, CaseIterable, Codable {
    case studio
    case oneplusone
    case onehalfplusone
    case twopluszero
    case twohalfplusone
    case twoplustwo
    case threepluszero
    case threeplusone
    case threehalfplusone
    case threeplustwo
    case threeplusthree
    case fourpluszero
    case fourplusone
    case fourhalfplusone
    case fourhalfplustwo
    case fourplustwo
    case fourplusthree
    case fourplusfour
    case fiveplusone
    case fivehalfplusone
    case fiveplustwo
    case fiveplusthree
    case fiveplusfour
    case sixplusone
    case sixplustwo
    case sixhalfplusone
    case sixplusthree
    case sixplusfour
    case sevenplusone
    case sevenplustwo
    case sevenplusthree
    case eightplusone
    case eightplustwo
    case eightplusthree
    case eightplusfour
    case nineplusone
    case nineplustwo
    case nineplusthree
    case nineplusfour
    case nineplusfive
    case nineplussix
    case tenplusone
    case tenplustwo
    case tenplus
    
    
    func describe() -> String {
        switch self {
        case .studio:               return "Stüdyo (1+0)"
        case .oneplusone:           return "1+1"
        case .onehalfplusone:       return "1.5+1"
        case .twopluszero:          return "2+0"
        case .twohalfplusone:       return "2+1"
        case .twoplustwo:           return "2+2"
        case .threepluszero:        return "3+0"
        case .threeplusone:         return "3+1"
        case .threehalfplusone:     return "3.5+1"
        case .threeplustwo:         return "3+2"
        case .threeplusthree:       return "3+3"
        case .fourpluszero:         return "4+0"
        case .fourplusone:          return "4+1"
        case .fourhalfplusone:      return "4.5+1"
        case .fourhalfplustwo:      return "4.5+2"
        case .fourplustwo:          return "4+2"
        case .fourplusthree:        return "4+3"
        case .fourplusfour:         return "4+4"
        case .fiveplusone:          return "5+1"
        case .fivehalfplusone:      return "5.5+1"
        case .fiveplustwo:          return "5+2"
        case .fiveplusthree:        return "5+3"
        case .fiveplusfour:         return "5+4"
        case .sixplusone:           return "6+1"
        case .sixplustwo:           return "6+2"
        case .sixhalfplusone:       return "6.5+1"
        case .sixplusthree:         return "6+3"
        case .sixplusfour:          return "6+4"
        case .sevenplusone:         return "7+1"
        case .sevenplustwo:         return "7+2"
        case .sevenplusthree:       return "7+3"
        case .eightplusone:         return "8+1"
        case .eightplustwo:         return "8+2"
        case .eightplusthree:       return "8+3"
        case .eightplusfour:        return "8+4"
        case .nineplusone:          return "9+1"
        case .nineplustwo:          return "9+2"
        case .nineplusthree:        return "9+3"
        case .nineplusfour:         return "9+4"
        case .nineplusfive:         return "9+5"
        case .nineplussix:          return "9+6"
        case .tenplusone:           return "10+1"
        case .tenplustwo:           return "10+2"
        case .tenplus:              return "10 Üzeri"
        }
    }
    
}


enum EstateType: String, Describer, CaseIterable, Codable {
    case house
    case land
    
    
    func describe() -> String {
        switch self {
        case .house:            return "Konut"
        case .land:             return "Arsa"
        }
    }
}

extension EstateType: CategoryImplementer {
    static func allData() -> [String : Any] {
        return allCases.reduce(into: [String: Any]()) { partialResult, type in
            partialResult[type.describe()] = type.getChilds()
            if type == .land {
                partialResult[type.describe()] = Finalizer.land
            }
            
        }
    }
    
    static func provideData() -> [String : Any] {
        return [:]
    }
    
    func getChilds() -> [String : Any] {
        switch self {
        case .house:
            return HouseType.allData()
        case .land:
            //Arsa ->
            return [:]
        }
    }
    
}
