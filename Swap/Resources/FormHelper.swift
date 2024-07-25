//
//  FormHelper.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import Foundation

enum FormTypeEnum {
    case city
    case town(city: String)
    case shiftType
    case caseType
    case tractionType
    case fuelType
    case color
    case yesno(raw: String)
    
    func getForm() -> [String: Any] {
        switch self {
            
            
            
            //MARK: -> Şehir
        case .city:
            return AdressResource().adressDict.keys.sorted(by: <).reduce(into: [String: Any]()) { partialResult, city in
                partialResult[city] = city
            }
            
            
            
            
            
            
            
            
            //MARK: -> İlçe
        case .town(let city):
            return (AdressResource().adressDict[city] ?? []).reduce(into: [String: Any]()) { partialResult, towns in
                partialResult[towns] = towns
            }
            
            
            
            
            
            

            //MARK: -> Vites
        case .shiftType:
            return CarShiftType.allCases.reduce(into: [String: Any]()) { partialResult, shiftType in
                partialResult[shiftType.describe()] = shiftType
            }
            
            
            
            
            
            
            //MARK: -> Kasa Tipi
        case .caseType:
            return CarCaseType.allCases.reduce(into: [String: Any]()) { partialResult, caseType in
                partialResult[caseType.describe()] = caseType
            }
            
            
            
            
            
            
            
            //MARK: -> Çekiş
        case .tractionType:
            return CarTractionType.allCases.reduce(into: [String: Any]()) { partialResult, tractionType in
                partialResult[tractionType.describe()] = tractionType
            }
            
            
            
            
            
            //MARK: -> Yakıt
        case .fuelType:
            return CarFuelType.allCases.reduce(into: [String: Any]()) { partialResult, fuelType in
                partialResult[fuelType.describe()] = fuelType
            }
            
            
            
            
            
            
            //MARK: -> Renk
        case .color:
            return ProductColor.allCases.reduce(into: [String: Any]()) { partialResult, color in
                partialResult[color.describe()] = color
            }
            
            
            
            
            
            
            
            
            //MARK: -> Boolean
        case .yesno:
            return [
                "Var": true,
                "Yok": false
            ]
            
            
            
            
        }
    }
}


