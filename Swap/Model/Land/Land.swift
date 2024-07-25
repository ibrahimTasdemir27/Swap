//
//  Land.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 24.07.2024.
//

import Foundation

class Land: Product {
    let zoneState: ZoneState
    let sqft: Int
    let islandNo: Int
    let parcelNo: Int
    let sectionNo: Int
    let kaks: KAKS
    let sizeLimit: SizeLimitBuilding
    let perfloor: Bool
    
    
    init(product: Product, zoneState: ZoneState, sqft: Int, islandNo: Int, parcelNo: Int, sectionNo: Int, kaks: KAKS, sizeLimit: SizeLimitBuilding, perfloor: Bool) {
        self.zoneState = zoneState
        self.sqft = sqft
        self.islandNo = islandNo
        self.parcelNo = parcelNo
        self.sectionNo = sectionNo
        self.kaks = kaks
        self.sizeLimit = sizeLimit
        self.perfloor = perfloor
        super.init(product: product)
    }
    
    private enum CodingKeys: CodingKey {
        case zoneState, sqft, islandNo, parcelNo, sectionNo, kaks, sizeLimit, perfloor
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        zoneState = try container.decode(ZoneState.self, forKey: .zoneState)
        sqft = try container.decode(Int.self, forKey: .sqft)
        islandNo = try container.decode(Int.self, forKey: .islandNo)
        parcelNo = try container.decode(Int.self, forKey: .parcelNo)
        sectionNo = try container.decode(Int.self, forKey: .sectionNo)
        kaks = try container.decode(KAKS.self, forKey: .kaks)
        sizeLimit = try container.decode(SizeLimitBuilding.self, forKey: .sizeLimit)
        perfloor = try container.decode(Bool.self, forKey: .perfloor)
        try super.init(from: decoder)
    }
}

@frozen enum SizeLimitBuilding: Describer, CaseIterable, Codable {
    case threefifty
    case sixfifty
    case sevenfifty
    case eightfifty
    case ninefifty
    case elevenfifty
    case twelvefifty
    case fourteenfifty
    case fifteenfifty
    case eighteenfifty
    case twentyonefifty
    case twentyfourfifty
    case twentysevenfifty
    case thirtyfifty
    case thirtysixzero
    case deallocated
    case undefined
    
    func describe() -> String {
        switch self {
        case .threefifty:               return "3.50"
        case .sixfifty:                 return "6.50"
        case .sevenfifty:               return "7.50"
        case .eightfifty:               return "8.50"
        case .ninefifty:                return "9.50"
        case .elevenfifty:              return "11.50"
        case .twelvefifty:              return "12.50"
        case .fourteenfifty:            return "14.50"
        case .fifteenfifty:             return "15.50"
        case .eighteenfifty:            return "18.50"
        case .twentyonefifty:           return "20.50"
        case .twentyfourfifty:          return "24.50"
        case .twentysevenfifty:         return "27.50"
        case .thirtyfifty:              return "30.50"
        case .thirtysixzero:            return "36.00"
        case .deallocated:              return "Serbest"
        case .undefined:                return "Belirtilmemiş"
        }
    }
}



@frozen enum KAKS: Describer, CaseIterable, Codable {
    case zerozerofive
    case zeroten
    case zerofifteen
    case zerotwenty
    case zerotwentyfour
    case zerothirty
    case zerothirtyfive
    case zerofourth
    case zerofourthfive
    case zerofifty
    case zerosixty
    case zeroseventy
    case zeroseventyfive
    case zeroeighty
    case zeroninety
    case zeroninetyfive
    case one
    case onezerofive
    case oneten
    case onefifteen
    case onetwenty
    case onetwentyfive
    case onethirty
    case onethirtyfive
    case onefourth
    case onefourthfive
    case onefifty
    case onefiftyfive
    case onesixty
    case oneseventyfive
    case oneeighty
    case oneninety
    case two
    case twozeroseven
    case twoten
    case twofifteen
    case twothirty
    case twofourth
    case twofifty
    case twoeighty
    case three
    case threetwenty
    case threethirty
    case five
    case tentwenty
    case fifteenthirty
    case undefined
    
    
    
    func describe() -> String {
        switch self {
        case .zerozerofive:                 return "0.05"
        case .zeroten:                      return "0.10"
        case .zerofifteen:                  return "0.15"
        case .zerotwenty:                   return "0.20"
        case .zerotwentyfour:               return "0.24"
        case .zerothirty:                   return "0.30"
        case .zerothirtyfive:               return "0.35"
        case .zerofourth:                   return "0.40"
        case .zerofourthfive:               return "0.45"
        case .zerofifty:                    return "0.50"
        case .zerosixty:                    return "0.60"
        case .zeroseventy:                  return "0.70"
        case .zeroseventyfive:              return "0.75"
        case .zeroeighty:                   return "0.80"
        case .zeroninety:                   return "0.90"
        case .zeroninetyfive:               return "0.95"
        case .one:                          return "1.0"
        case .onezerofive:                  return "1.05"
        case .oneten:                       return "1.10"
        case .onefifteen:                   return "1.15"
        case .onetwenty:                    return "1.20"
        case .onetwentyfive:                return "1.25"
        case .onethirty:                    return "1.30"
        case .onethirtyfive:                return "1.35"
        case .onefourth:                    return "1.40"
        case .onefourthfive:                return "1.45"
        case .onefifty:                     return "1.50"
        case .onefiftyfive:                 return "1.55"
        case .onesixty:                     return "1.60"
        case .oneseventyfive:               return "1.70"
        case .oneeighty:                    return "1.80"
        case .oneninety:                    return "1.90"
        case .two:                          return "2.0"
        case .twozeroseven:                 return "2.07"
        case .twoten:                       return "2.10"
        case .twofifteen:                   return "2.15"
        case .twothirty:                    return "2.30"
        case .twofourth:                    return "2.40"
        case .twofifty:                     return "2.50"
        case .twoeighty:                    return "2.80"
        case .three:                        return "3.0"
        case .threetwenty:                  return "3.20"
        case .threethirty:                  return "3.30"
        case .five:                         return "5.0"
        case .tentwenty:                    return "10.20"
        case .fifteenthirty:                return "15.30"
        case .undefined:                    return "Belirtilmemiş"
        }
    }
}

@frozen enum ZoneState: Describer, CaseIterable, Codable {
    case island
    case lejant
    case terrain
    case gardenvineyard
    case warehouse
    case education
    case energystorage
    case house
    case various
    case privateuse
    case health
    case industry
    case greenhouse
    case protectedarea
    case sports
    case field
    case fieldplusvineyard
    case commercial
    case commercialplushouse
    case collectivehouse
    case tourism
    case tourismplushouse
    case tourismpluscommercial
    case villa
    case olive
    
    
    func describe() -> String {
        switch self {
        case .island:                   return "Ada"
        case .lejant:                   return "A-Lejant"
        case .terrain:                  return "Arazi"
        case .gardenvineyard:           return "Bağ & Bahçe"
        case .warehouse:                return "Depo & Antrepo"
        case .education:                return "Eğitim"
        case .energystorage:            return "Enerji Depolama"
        case .house:                    return "Konut"
        case .various:                  return "Muhtelif"
        case .privateuse:               return "Özel Kullanım"
        case .health:                   return "Sağlık"
        case .industry:                 return "Sanayi"
        case .greenhouse:               return "Sera"
        case .protectedarea:            return "Sit Alanı"
        case .sports:                   return "Spor"
        case .field:                    return "Tarla"
        case .fieldplusvineyard:        return "Tarla + Bağ"
        case .commercial:               return "Ticari"
        case .commercialplushouse:      return "Ticari + Konut"
        case .collectivehouse:          return "Toplu Konut"
        case .tourism:                  return "Turizm"
        case .tourismplushouse:         return "Turizm + Konut"
        case .tourismpluscommercial:    return "Turizm + Ticari"
        case .villa:                    return "Villa"
        case .olive:                    return "Zeytinlik"
        }
    }
    
}
