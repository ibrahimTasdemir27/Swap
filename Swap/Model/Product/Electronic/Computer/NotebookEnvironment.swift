//
//  NotebookEnvironment.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 31.07.2024.
//

import Foundation


//MARK: -> Notebook Environment
extension ElectronicProductEnvironment {
    struct NotebookEnvironment {
        enum Brand: String, Describer, Codable, CaseIterable {
            case monster
            case hometech
            
            func describe() -> String {
                switch self {
                case .monster:          return "Monster"
                case .hometech:         return "HomeTech(HT)"
                }
            }
        }
        
        
        //Notebook -> Monster -> Equipment
        enum ProductType: String, Describer, Codable, CaseIterable, CategoryImplementer {
            static func allData() -> [String : Any] {
                return allCases.reduce(into: [String: Any]()) { partialResult, type in
                    partialResult[type.describe()] = type.getChilds()
                }
            }
            
            static func provideData() -> [String : Any] {
                return [:]
            }
            
            func getChilds() -> [String : Any] {
                switch self {
                case .laptop:
                    return Brand.allCases.reduce(into: [String: Any]()) { partialResult, brand in
                        partialResult[brand.describe()] = Finalizer.notebook
                    }
                case .equipment:
                    return Equipment.allCases.reduce(into: [String: Any]()) { partialResult, equipment in
                        partialResult[equipment.describe()] = Finalizer.notebookequipment
                    }
                case .replacementpart:
                    return ReplacementPart.allCases.reduce(into: [String: Any]()) { partialResult, part in
                        partialResult[part.describe()] = Finalizer.notebookreplacementpart
                    }
                }
            }
            
            case laptop
            case equipment
            case replacementpart
            
            func describe() -> String {
                switch self {
                case .laptop:            return "Laptop"
                case .equipment:         return "Donanım"
                case .replacementpart:   return "Yedek Parça"
                }
            }
        }
        
        enum Equipment: String, Describer, CaseIterable, Codable {
            case processor
            case harddisk
            case pcmcia
            case ram
            case ssd
            case cddrive
            case dvddrive
            case bluray
            
            func describe() -> String {
                switch self {
                case .processor:        return "İşlemci"
                case .harddisk:         return "Harddisk"
                case .pcmcia:           return "PCMCIA Kartlar"
                case .ram:              return "RAM Bellek"
                case .ssd:              return "SSD (Solid State Drive)"
                case .cddrive:          return "CD Sürücü"
                case .dvddrive:         return "DVD Sürücü"
                case .bluray:           return "Blu-ray Sürücü"
                }
            }
        }
        
        
        
        enum ReplacementPart: String, Describer, CaseIterable, Codable {
            case defectivenotebook
            case adapter
            case networkcard
            case motherboard
            case antenna
            case battery
            case biosbattery
            case bluetoothcard
            case internalspeaker
            case internalcamera
            case screenlcd
            case displaycard
            case flexcable
            case inverter
            case caseparts
            case keyboard
            case hinge
            case modem
            case fingerprint
            case soundcard
            case coolerfan
            case socket
            case touchpad
            case chipset
            
            func describe() -> String {
                switch self {
                case .defectivenotebook:    return "Arızalı Laptop"
                case .adapter:              return "Adaptör"
                case .networkcard:          return "Ağ Kartı"
                case .motherboard:          return "Anakart"
                case .antenna:              return "Anten"
                case .battery:              return "Batarya"
                case .biosbattery:          return "Bios Pili"
                case .bluetoothcard:        return "Bluetooth Kart"
                case .internalspeaker:      return "Dahili Hoparlör"
                case .internalcamera:       return "Dahili Kamera"
                case .screenlcd:            return "Ekran (LCD Panel)"
                case .displaycard:          return "Ekran Kartı"
                case .flexcable:            return "Flex Kablo"
                case .inverter:             return "İnvertör"
                case .caseparts:            return "Kasa & Parçaları"
                case .keyboard:             return "Klavye"
                case .hinge:                return "Menteşe"
                case .modem:                return "Modem"
                case .fingerprint:          return "Parmak İzi Okuyucu"
                case .soundcard:            return "Ses Kartı"
                case .coolerfan:            return "Soğutucu Fan"
                case .socket:               return "Soket"
                case .touchpad:             return "Touch Pad"
                case .chipset:              return "Yonga Seti"
                    
                }
                
            }
        }
    }
}



extension ElectronicProductEnvironment.NotebookEnvironment {
    enum Resolution: String, Describer, CaseIterable, Codable {
        case cross1280800
        case cross1366768
        case cross1440900
        case cross1600900
        case cross19201080
        case cross19201200
        case cross20481536
        case cross21601440
        case cross23401440
        case cross25601440
        case cross25601600
        case cross28801800
        case cross32001800
        case cross34562234
        case cross38402160
        
        
        func describe() -> String {
            switch self {
            case .cross1280800:        return "1280 x 800"
            case .cross1366768:        return "1366 x 768"
            case .cross1440900:        return "1440 x 900"
            case .cross1600900:        return "1600 x 900"
            case .cross19201080:       return "1920 x 1080"
            case .cross19201200:       return "1920 x 1200"
            case .cross20481536:       return "2048 x 1536"
            case .cross21601440:       return "2160 x 1440"
            case .cross23401440:       return "2340 x 1440"
            case .cross25601440:       return "2560 x 1440"
            case .cross25601600:       return "2560 x 1600"
            case .cross28801800:       return "2880 x 1800"
            case .cross32001800:       return "3200 x 1800"
            case .cross34562234:       return "3456 x 2234"
            case .cross38402160:       return "3840 x 2160"
            }
        }
    }
}
