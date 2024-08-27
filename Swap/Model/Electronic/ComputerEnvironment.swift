//
//  ComputerEnvironment.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 31.07.2024.
//

import Foundation


//MARK: -> Computer Environment
extension ElectronicProductEnvironment {
    
    class BaseComputer: ElectronicProduct {
        let processor: String
        let brand: String
        let state: ProductStatus
        let ram: ElectronicProductEnvironment.ComputerEnvironment.RAM
        let hdd: ElectronicProductEnvironment.ComputerEnvironment.HDD
        let ssd: ElectronicProductEnvironment.ComputerEnvironment.SSD
        let displaycard: ElectronicProductEnvironment.ComputerEnvironment.DisplayCard
        let screenSize: ElectronicProductEnvironment.ComputerEnvironment.ScreenSize
        
        init(electronic: ElectronicProduct,
             processor: String,
             brand: String,
             state: ProductStatus,
             ram: ElectronicProductEnvironment.ComputerEnvironment.RAM,
             hdd: ElectronicProductEnvironment.ComputerEnvironment.HDD,
             ssd: ElectronicProductEnvironment.ComputerEnvironment.SSD,
             displayCard: ElectronicProductEnvironment.ComputerEnvironment.DisplayCard,
             screenSize: ElectronicProductEnvironment.ComputerEnvironment.ScreenSize
        ) {
            self.processor = processor
            self.brand = brand
            self.state = state
            self.ram = ram
            self.hdd = hdd
            self.ssd = ssd
            self.displaycard = displayCard
            self.screenSize = screenSize
            super.init(electronic: electronic)
        }
        
        init(computer: BaseComputer) {
            processor = computer.processor
            brand = computer.brand
            state = computer.state
            ram = computer.ram
            hdd = computer.hdd
            ssd = computer.ssd
            displaycard = computer.displaycard
            screenSize = computer.screenSize
            super.init(electronic: computer)
        }
        
        private enum CodingKeys: CodingKey {
            case processor, brand, state, ram, hdd, ssd, displaycard, screenSize
        }
        
        
        required init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            processor = try container.decode(String.self, forKey: .processor)
            brand = try container.decode(String.self, forKey: .brand)
            state = try container.decode(ProductStatus.self, forKey: .state)
            ram = try container.decode(ElectronicProductEnvironment.ComputerEnvironment.RAM.self, forKey: .ram)
            hdd = try container.decode(ElectronicProductEnvironment.ComputerEnvironment.HDD.self, forKey: .hdd)
            ssd = try container.decode(ElectronicProductEnvironment.ComputerEnvironment.SSD.self, forKey: .ssd)
            displaycard = try container.decode(ElectronicProductEnvironment.ComputerEnvironment.DisplayCard.self, forKey: .displaycard)
            screenSize = try container.decode(ElectronicProductEnvironment.ComputerEnvironment.ScreenSize.self, forKey: .screenSize)
            try super.init(from: decoder)
        }
    }
    
    struct ComputerEnvironment {
        enum ComputerCategory: String, Describer, Codable, CaseIterable, CategoryImplementer {
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
                case .notebook:
                    return NotebookEnvironment.ProductType.allData()
                case .desktop:
                    return DesktopEnvironment.ProductType.allData()
                case .tablet:
                    return TabletEnvironment.ProductType.allData()
                case .accessory:
                    return AccesoriesEnvironment.ProductType.allData()
                case .monitor:   break
                    
                }
                
                return [:]
            }
            
            case notebook
            case desktop
            case tablet
            case accessory
            case monitor
            
            
            func describe() -> String {
                switch self {
                case .notebook:         return "Notebook"
                case .desktop:          return "Masaüstü"
                case .tablet:           return "Tablet"
                case .accessory:        return "Aksesuar"
                case .monitor:          return "Monitör"
                }
            }
        }
        
        
        
        enum RAM: String, Describer, CaseIterable, Codable {
            case mb128under
            case mb128
            case mb256
            case mb512
            case gb1
            case gb2
            case gb4
            case gb6
            case gb8
            case gb10
            case gb12
            case gb16
            case gb18
            case gb24
            case gb32
            case gb36
            case gb48
            case gb64
            case gb96
            case gb128
            
            
            func describe() -> String {
                switch self {
                case .mb128under:       return "128 MB Altı"
                case .mb128:            return "128 MB"
                case .mb256:            return "256 MB"
                case .mb512:            return "512 MB"
                case .gb1:              return "1 GB"
                case .gb2:              return "2 GB"
                case .gb4:              return "4 GB"
                case .gb6:              return "6 GB"
                case .gb8:              return "8 GB"
                case .gb10:             return "10 GB"
                case .gb12:             return "12 GB"
                case .gb16:             return "16 GB"
                case .gb18:             return "18 GB"
                case .gb24:             return "24 GB"
                case .gb32:             return "32 GB"
                case .gb36:             return "36 GB"
                case .gb48:             return "48 GB"
                case .gb64:             return "64 GB"
                case .gb96:             return "96 GB"
                case .gb128:            return "128 GB"
                    
                    
                }
            }
        }
        
        
        enum HDD: String, Describer, CaseIterable, Codable {
            case none
            case gb20under
            case gb30
            case gb40
            case gb60
            case gb64
            case gb80
            case gb100
            case gb120
            case gb128
            case gb160
            case gb200
            case gb250
            case gb256
            case gb320
            case gb400
            case gb500
            case gb512
            case gb640
            case gb750
            case tb1
            case tb2
            case tb3up
            
            
            
            func describe() -> String {
                switch self {
                case .none:                return "Yok"
                case .gb20under:           return "20 GB ve altı"
                case .gb30:                return "30 GB"
                case .gb40:                return "40 GB"
                case .gb60:                return "60 GB"
                case .gb64:                return "64 GB"
                case .gb80:                return "80 GB"
                case .gb100:               return "100 GB"
                case .gb120:               return "120 GB"
                case .gb128:               return "128 GB"
                case .gb160:               return "160 GB"
                case .gb200:               return "200 GB"
                case .gb250:               return "250 GB"
                case .gb256:               return "256 GB"
                case .gb320:               return "320 GB"
                case .gb400:               return "400 GB"
                case .gb500:               return "500 GB"
                case .gb512:               return "512 GB"
                case .gb640:               return "640 GB"
                case .gb750:               return "750 GB"
                case .tb1:                 return "1 TB"
                case .tb2:                 return "2 TB"
                case .tb3up:               return "3 TB ve üstü"
                }
            }
        }
        
        
        
        enum SSD: String, Describer, CaseIterable, Codable {
            case none
            case gb8
            case gb16
            case gb32
            case gb64
            case gb120
            case gb128
            case gb240
            case gb256
            case gb360
            case gb512
            case tb1
            case tb2
            case tb4
            case tb8
            
            
            func describe() -> String {
                switch self {
                case .none:             return "Yok"
                case .gb8:              return "8 GB"
                case .gb16:             return "16 GB"
                case .gb32:             return "32 GB"
                case .gb64:             return "64 GB"
                case .gb120:            return "120 GB"
                case .gb128:            return "128 GB"
                case .gb240:            return "240 GB"
                case .gb256:            return "256 GB"
                case .gb360:            return "360 GB"
                case .gb512:            return "512 GB"
                case .tb1:              return "1 TB"
                case .tb2:              return "2 TB"
                case .tb4:              return "4 TB"
                case .tb8:              return "8 TB"
                }
            }
        }
        
        enum DisplayCard: String, Describer, CaseIterable, Codable {
            case shared
            case mb64under
            case mb128
            case mb256
            case mb328
            case mb512
            case mb768
            case gb1half
            case gb1
            case gb2
            case gb3
            case gb4
            case gb6
            case gb8
            case gb12
            case gb16
            case gb18
            case gb24
            case gb30
            case gb38
            case gb40
            
            
            func describe() -> String {
                switch self {
                case .shared:               return "Paylaşımlı"
                case .mb64under:            return "64 MB ve altı"
                case .mb128:                return "128 MB"
                case .mb256:                return "256 MB"
                case .mb328:                return "328 MB"
                case .mb512:                return "512 MB"
                case .mb768:                return "768 MB"
                case .gb1half:              return "1.5 GB"
                case .gb1:                  return "1 GB"
                case .gb2:                  return "2 GB"
                case .gb3:                  return "3 GB"
                case .gb4:                  return "4 GB"
                case .gb6:                  return "6 GB"
                case .gb8:                  return "8 GB"
                case .gb12:                 return "12 GB"
                case .gb16:                 return "16 GB"
                case .gb18:                 return "18 GB"
                case .gb24:                 return "24 GB"
                case .gb30:                 return "30 GB"
                case .gb38:                 return "38 GB"
                case .gb40:                 return "40 GB"
                }
            }
        }
    
        enum ScreenSize: String, Describer, CaseIterable, Codable {
            case size12half
            case size1hal
            case size14
            case size15
            case size16
            case size17
            case size18half
            case size19
            case size20
            case size21half
            case size22
            case size23point6
            case size23point8
            case size24
            case size25half
            case size25
            case size26
            case size27
            case size28
            case size30
            case size31half
            case size32
            case size34
            case size35
            case size37half
            case size40
            case size42half
            case size43
            case size46
            case size49
            case none
            case defect
            
            
            func describe() -> String {
                switch self {
                case .size12half:        return "12.5\""
                case .size1hal:          return "12\""
                case .size14:            return "14\""
                case .size15:            return "15\""
                case .size16:            return "16\""
                case .size17:            return "17\""
                case .size18half:        return "18.5\""
                case .size19:            return "19\""
                case .size20:            return "20\""
                case .size21half:        return "21.5\""
                case .size22:            return "22\""
                case .size23point6:      return "23.6\""
                case .size23point8:      return "23.8\""
                case .size24:            return "24\""
                case .size25half:        return "25.5\""
                case .size25:            return "25\""
                case .size26:            return "26\""
                case .size27:            return "27\""
                case .size28:            return "28\""
                case .size30:            return "30\""
                case .size31half:        return "31.5\""
                case .size32:            return "32\""
                case .size34:            return "34\""
                case .size35:            return "35\""
                case .size37half:        return "37.5\""
                case .size40:            return "40\""
                case .size42half:        return "42.5\""
                case .size43:            return "43\""
                case .size46:            return "46\""
                case .size49:            return "49\""
                case .none:              return "Ekransız"
                case .defect:            return "Ekranı Bozuk"
                }
            }
        }
    }
    
}
