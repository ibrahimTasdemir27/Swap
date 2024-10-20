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
    
    
    
    case room
    case autopark
    case heating
    case estatestate
    case houselandregister
    case landregister
    case zonestate
    case kaks
    case sizelimit
    
    case ram
    case hdd
    case ssd
    case displaycard
    case screensize
    case resolution
    case pccasetype
    
    
    case phonescreensize
    case phonememory
    case phoneram
    case phonecolor
    case phonecamera
    case phonefrontcamera
    case operationsystem
    
    
    case productstate
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
            
            
            
            
            
            
            
            //MARK: -> Oda Sayısı
        case .room:
            return Room.allCases.reduce(into: [String: Any]()) { partialResult, room in
                partialResult[room.describe()] = room
            }
            
            
            
            
            
            //MARK: -> Otopark
        case .autopark:
            return AutoPark.allCases.reduce(into: [String: Any]()) { partialResult, autopark in
                partialResult[autopark.describe()] = autopark
            }
            
            
            
            //MARK: -> Isıtma
        case .heating:
            return HeatingType.allCases.reduce(into: [String: Any]()) { partialResult, heating in
                partialResult[heating.describe()] = heating
            }
            
            
            
            
        
            
            
            //MARK: -> Kullanım durumu
        case .estatestate:
            return EstateState.allCases.reduce(into: [String: Any]()) { partialResult, estate in
                partialResult[estate.describe()] = estate
            }
            
            
            
            
            
            //MARK: -> Ev Tapu Durumu
        case .houselandregister:
            return EstateLandRegisterStatus.allCases.reduce(into: [String: Any]()) { partialResult, landRegister in
                partialResult[landRegister.describe()] = landRegister
            }
            
            
            
            
            
            
            //MARK: -> Tapu Durumu
        case .landregister:
            return LandRegisterStatus.allCases.reduce(into: [String: Any]()) { partialResult, landRegister in
                partialResult[landRegister.describe()] = landRegister
            }
            
            
            
            
            
            //MARK: -> İmar durumu
        case .zonestate:
            return ZoneState.allCases.reduce(into: [String: Any]()) { partialResult, zoneState in
                partialResult[zoneState.describe()] = zoneState
            }
            
            
            
            
            
            //MARK: -> KAKS (Emsal)
        case .kaks:
            return KAKS.allCases.reduce(into: [String: Any]()) { partialResult, kaks in
                partialResult[kaks.describe()] = kaks
            }
            
            
            
            
            //MARK: -> Gabari
        case .sizelimit:
            return SizeLimitBuilding.allCases.reduce(into: [String: Any]()) { partialResult, sizeLimit in
                partialResult[sizeLimit.describe()] = sizeLimit
            }
            
            
            
            

            
            //MARK: -> Ram
        case .ram:
            return ElectronicProductEnvironment.ComputerEnvironment.RAM.allCases.reduce(into: [String: Any]()) { partialResult, ram in
                partialResult[ram.describe()] = ram
            }
            
            
            //MARK: -> HDD
        case .hdd:
            return ElectronicProductEnvironment.ComputerEnvironment.HDD.allCases.reduce(into: [String: Any]()) { partialResult, hdd in
                partialResult[hdd.describe()] = hdd
            }
            
            
            //MARK: -> SSD
        case .ssd:
            return ElectronicProductEnvironment.ComputerEnvironment.SSD.allCases.reduce(into: [String: Any]()) { partialResult, ssd in
                partialResult[ssd.describe()] = ssd
            }
            
            
            //MARK: -> Ekran Kartı
        case .displaycard:
            return ElectronicProductEnvironment.ComputerEnvironment.DisplayCard.allCases.reduce(into: [String: Any]()) { partialResult, displayCard in
                partialResult[displayCard.describe()] = displayCard
            }
            
            
            
            //MARK: -> Ekran Boyutu
        case .screensize:
            return ElectronicProductEnvironment.ComputerEnvironment.ScreenSize.allCases.reduce(into: [String: Any]()) { partialResult, screenSize in
                partialResult[screenSize.describe()] = screenSize
            }
            
            
            
            //MARK: -> Ekran Çözünürlüğü
        case .resolution:
            return ElectronicProductEnvironment.NotebookEnvironment.Resolution.allCases.reduce(into: [String: Any]()) { partialResult, resolution in
                partialResult[resolution.describe()] = resolution
            }
            
            
            
            
            
            //MARK: -> Kasa Tipi
        case .pccasetype:
            return ElectronicProductEnvironment.DesktopEnvironment.CaseType.allCases.reduce(into: [String: Any]()) { partialResult, caseType in
                partialResult[caseType.describe()] = caseType
            }
            
            
            
            
            //MARK: -> Telefon Ekran Boyutu
        case .phonescreensize:
            return ElectronicProductEnvironment.PhoneEnvironment.ScreenSize.allCases.reduce(into: [String: Any]()) { partialResult, screenSize in
                partialResult[screenSize.describe()] = screenSize
            }
            
            
            
            //MARK: -> Telefon RAM Bellek
        case .phonememory:
            return ElectronicProductEnvironment.PhoneEnvironment.Memory.allCases.reduce(into: [String: Any]()) { partialResult, memory in
                partialResult[memory.describe()] = memory
            }
            
            
            
            //MARK: -> Telefon RAM Bellek
        case .phoneram:
            return ElectronicProductEnvironment.PhoneEnvironment.RAM.allCases.reduce(into: [String: Any]()) { partialResult, ram in
                partialResult[ram.describe()] = ram
            }
            
            
            
            //MARK: -> Telefon Renk
        case .phonecolor:
            return ElectronicProductEnvironment.PhoneEnvironment.Color.allCases.reduce(into: [String: Any]()) { partialResult, color in
                partialResult[color.describe()] = color
            }
            
            
            //MARK: -> Telefon Kamera
        case .phonecamera:
            return ElectronicProductEnvironment.PhoneEnvironment.MegaPixel.allCases.reduce(into: [String: Any]()) { partialResult, megapx in
                partialResult[megapx.describe()] = megapx
            }
            
            
            
            
            //MARK: -> Telefon Ön Kamera
        case .phonefrontcamera:
            return ElectronicProductEnvironment.PhoneEnvironment.FrontMegaPixel.allCases.reduce(into: [String: Any]()) { partialResult, megapx in
                partialResult[megapx.describe()] = megapx
            }
            
            
            
            
            //MARK: -> İşletim Sistemi
        case .operationsystem:
            return ElectronicProductEnvironment.PhoneEnvironment.OperatingSystem.allCases.reduce(into: [String: Any]()) { partialResult, operatingSystem in
                partialResult[operatingSystem.describe()] = operatingSystem
            }
            
            
            
            
            
            //MARK: -> Ürün Durumu
        case .productstate:
            return ProductStatus.allCases.reduce(into: [String: Any]()) { partialResult, state in
                partialResult[state.describe()] = state
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


