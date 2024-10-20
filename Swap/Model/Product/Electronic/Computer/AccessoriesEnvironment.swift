//
//  ElectronicAccessories.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 27.08.2024.
//

import Foundation

extension ElectronicProductEnvironment {
    struct AccesoriesEnvironment {
        enum ProductType: String, Describer, CaseIterable, Codable, CategoryImplementer {
            case laptop
            case tablet
            case usb
            case repair
            case bag
            case mousepad
            case batch
            
            func describe() -> String {
                switch self {
                case .laptop:       return "Laptop Aksesuarları"
                case .tablet:       return "Tablet / iPad Aksesuarları"
                case .usb:          return "USB Aksesuarlar"
                case .repair:       return "Bakım / Onarım Aksesuarları"
                case .bag:          return "CD & DVD Çantası"
                case .mousepad:     return "Mousepad"
                case .batch:        return "Toplu Satış"
                }
            }
            
            
            static func allData() -> [String : Any] {
                ProductType.allCases.reduce(into: [String: Any]()) { partialResult, accessories in
                    partialResult[accessories.describe()] = accessories.getChilds()
                }
            }
            
            static func provideData() -> [String : Any] {
                return [:]
            }
            
            func getChilds() -> [String : Any] {
                switch self {
                case .laptop:
                    return Laptop.allCases.reduce(into: [String: Any]()) { partialResult, accesories in
                        partialResult[accesories.describe()] = Finalizer.accessorieslaptop
                    }
                case .tablet:
                    return Tablet.allCases.reduce(into: [String: Any]()) { partialResult, accessories in
                        partialResult[accessories.describe()] = Finalizer.accessoriestablet
                    }
                case .usb:
                    return [Finalizer.accessoriesusb.rawValue : Finalizer.accessoriesusb]
                case .repair:
                    return [Finalizer.accessoriesrepair.rawValue : Finalizer.accessoriesrepair]
                case .bag:
                    return [Finalizer.accessoriesbag.rawValue : Finalizer.accessoriesbag]
                case .mousepad:
                    return [Finalizer.accessoriesmousepad.rawValue : Finalizer.accessoriesmousepad]
                case .batch:
                    return [Finalizer.accessoriesbatch.rawValue : Finalizer.accessoriesbatch]
                }
            }
        }
        
        
        enum Laptop: String, Describer, CaseIterable, Codable {
            case bag
            case sheath
            case lock
            case port
            case stand
            case sticker
            
            func describe() -> String {
                switch self {
                case .bag:          return "Çanta"
                case .sheath:       return "Kılıf"
                case .lock:         return "Kilit"
                case .port:         return "Port İstasyonu (Dock)"
                case .stand:        return "Sehpa"
                case .sticker:      return "Sticker"
                }
            }
        }
        
        enum Tablet: String, Describer, CaseIterable, Codable {
            case keyboard
            case dialer
            case converter
            case dock
            case apparatus
            case pencil
            case cardreader
            case sheath
            case protectivefilm
            case conservative
            
            func describe() -> String {
                switch self {
                case .keyboard:        return "Klavye"
                case .dialer:          return "Çevirici"
                case .converter:       return "Dönüştürücü"
                case .dock:            return "Dock"
                case .apparatus:       return "Kablo & Aparat"
                case .pencil:          return "Kalem"
                case .cardreader:      return "Kart okuyucu"
                case .sheath:          return "Kılıf"
                case .protectivefilm:  return "Koruyucu Film"
                case .conservative:    return "Tutucu"
                }
            }
        }
        
        
        
        
    }
}
