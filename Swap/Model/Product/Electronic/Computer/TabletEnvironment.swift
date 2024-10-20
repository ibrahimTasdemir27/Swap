//
//  TabletEnvironment.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 27.08.2024.
//

import Foundation

extension ElectronicProductEnvironment {
    struct TabletEnvironment {
        enum ProductType: String, Describer, CaseIterable, Codable, CategoryImplementer {
            static func allData() -> [String : Any] {
                return ProductType.allCases.reduce(into: [String: Any]()) { partialResult, product in
                    partialResult[product.describe()] = product.getChilds()
                }
            }
            
            static func provideData() -> [String : Any] {
                return [:]
            }
            
            func getChilds() -> [String : Any] {
                switch self {
                case .modals:
                    return Brand.allData()
                case .replacementpart:
                    return ReplacementPart.allCases.reduce(into: [String: Any]()) { partialResult, part in
                        partialResult[part.describe()] = Finalizer.tabletreplacementpart
                    }
                }
            }
            
            case modals
            case replacementpart
            
            func describe() -> String {
                switch self {
                case .modals:                                 return "Modeller"
                case .replacementpart:                        return "Yedek Parça"
                }
            }
        }
        
        enum ReplacementPart: String, Describer, CaseIterable, Codable {
            case defective
            case adapter
            case motherboard
            case battery
            case screen
            case cableflexfilm
            case caseparts
            
            func describe() -> String {
                switch self {
                case .defective:                               return "Arızalı Tablet"
                case .adapter:                                 return "Adaptör"
                case .motherboard:                             return "Anakart"
                case .battery:                                 return "Batarya (Pil)"
                case .screen:                                  return "Ekran"
                case .cableflexfilm:                           return "Kablo & Flexi Film"
                case .caseparts:                               return "Kasa & Parçaları"
                }
            }
        }
        
        enum Brand: String, Describer, Codable, CaseIterable, CategoryImplementer {
            static func allData() -> [String : Any] {
                return Brand.allCases.reduce(into: [String: Any]()) { partialResult, brand in
                    partialResult[brand.describe()] = brand.getChilds()
                }
            }
            
            static func provideData() -> [String : Any] {
                return [:]
            }
            
            func getChilds() -> [String : Any] {
                switch self {
                case .apple:
                    return Apple.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .acer:
                    return Acer.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .ainol:
                    return Ainol.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .alcatel:
                    return Alcatel.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .amazon:
                    return Amazon.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .archos:
                    return Archos.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .artes:
                    return Artes.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .asus:
                    return Asus.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .blackberry:
                    return Blackberry.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .casper:
                    return Casper.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .chuwi:
                    return Chuwi.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .concord:
                    return Concord.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .cube:
                    return Cube.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .dark:
                    return Dark.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .dell:
                    return Dell.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .doogee:
                    return Doogee.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .everest:
                    return Everest.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .excon:
                    return Excon.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .exper:
                    return Exper.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .ezcool:
                    return Ezcool.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .generalmobile:
                    return Generalmobile.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .google:
                    return Google.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .grundig:
                    return Grundig.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .hisense:
                    return Hisense.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .hometech:
                    return Hometech.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .honor:
                    return Honor.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .hp:
                    return Hp.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .htc:
                    return Htc.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .huawei:
                    return Huawei.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .irulu:
                    return Irulu.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .jumper:
                    return Jumper.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .lenovo:
                    return Lenovo.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .lg:
                    return Lg.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .microsoft:
                    return Microsoft.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .motorola:
                    return Motorola.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .msi:
                    return Msi.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .navitech:
                    return Navitech.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .nextbook:
                    return Nextbook.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .nokia:
                    return Nokia.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .onda:
                    return Onda.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .oneplus:
                    return Oneplus.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .onyo:
                    return Onyo.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .oukitel:
                    return Oukitel.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .panasonic:
                    return Panasonic.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .philips:
                    return Philips.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .pipo:
                    return Pipo.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .piranha:
                    return Piranha.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .polaroid:
                    return Polaroid.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .polypad:
                    return Polypad.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .probook:
                    return Probook.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .reeder:
                    return Reeder.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .rowell:
                    return Rowell.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .samsung:
                    return Samsung.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .sony:
                    return Sony.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .sunny:
                    return Sunny.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .syrox:
                    return Syrox.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .tcl:
                    return Tcl.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .teclast:
                    return Teclast.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .toshiba:
                    return Toshiba.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .trident:
                    return Trident.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .turkcell:
                    return Turkcell.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .ulefone:
                    return Ulefone.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .unipad:
                    return Unipad.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .vestel:
                    return Vestel.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .viewsonic:
                    return Viewsonic.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .vivo:
                    return Vivo.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .vodafone:
                    return Vodafone.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .vorcom:
                    return Vorcom.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .welio:
                    return Welio.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .xiaomi:
                    return Xiaomi.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .zte:
                    return Zte.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.tablet
                    }
                case .other:
                    return [ Finalizer.tablet.rawValue : Finalizer.tablet ]
                case .batch:
                    return [ Finalizer.tablet.rawValue : Finalizer.tablet ]
                }
            }
            
            case apple
            case acer
            case ainol
            case alcatel
            case amazon
            case archos
            case artes
            case asus
            case blackberry
            case casper
            case chuwi
            case concord
            case cube
            case dark
            case dell
            case doogee
            case everest
            case excon
            case exper
            case ezcool
            case generalmobile
            case google
            case grundig
            case hisense
            case hometech
            case honor
            case hp
            case htc
            case huawei
            case irulu
            case jumper
            case lenovo
            case lg
            case microsoft
            case motorola
            case msi
            case navitech
            case nextbook
            case nokia
            case onda
            case oneplus
            case onyo
            case oukitel
            case panasonic
            case philips
            case pipo
            case piranha
            case polaroid
            case polypad
            case probook
            case reeder
            case rowell
            case samsung
            case sony
            case sunny
            case syrox
            case tcl
            case teclast
            case toshiba
            case trident
            case turkcell
            case ulefone
            case unipad
            case vestel
            case viewsonic
            case vivo
            case vodafone
            case vorcom
            case welio
            case xiaomi
            case zte
            case other
            case batch
            
            
            
            
            func describe() -> String {
                switch self {
                case .apple:              return "Apple"
                case .acer:               return "Acer"
                case .ainol:              return "Ainol"
                case .alcatel:            return "Alcatel"
                case .amazon:             return "Amazon"
                case .archos:             return "Archos"
                case .artes:              return "Artes"
                case .asus:               return "Asus"
                case .blackberry:         return "BlackBerry"
                case .casper:             return "Casper"
                case .chuwi:              return "Chuwi"
                case .concord:            return "Concord"
                case .cube:               return "Cube"
                case .dark:               return "Dark"
                case .dell:               return "Dell"
                case .doogee:             return "Doogee"
                case .everest:            return "Everest"
                case .excon:              return "Excon"
                case .exper:              return "Exper"
                case .ezcool:             return "Ezcool"
                case .generalmobile:      return "General Mobile"
                case .google:             return "Google"
                case .grundig:            return "Grundig"
                case .hisense:            return "Hisense"
                case .hometech:           return "Hometech"
                case .honor:              return "Honor"
                case .hp:                 return "HP"
                case .htc:                return "HTC"
                case .huawei:             return "Huawei"
                case .irulu:              return "iRulu"
                case .jumper:             return "Jumper"
                case .lenovo:             return "Lenovo"
                case .lg:                 return "LG"
                case .microsoft:          return "Microsoft"
                case .motorola:           return "Motorola"
                case .msi:                return "MSI"
                case .navitech:           return "Navitech"
                case .nextbook:           return "Nextbook"
                case .nokia:              return "Nokia"
                case .onda:               return "Onda"
                case .oneplus:            return "OnePlus"
                case .onyo:               return "Onyo"
                case .oukitel:            return "Oukitel"
                case .panasonic:          return "Panasonic"
                case .philips:            return "Philips"
                case .pipo:               return "Pipo"
                case .piranha:            return "Piranha"
                case .polaroid:           return "Polaroid"
                case .polypad:            return "PolyPad"
                case .probook:            return "Probook"
                case .reeder:             return "Reeder"
                case .rowell:             return "Rowell"
                case .samsung:            return "Samsung"
                case .sony:               return "Sony"
                case .sunny:              return "Sunny"
                case .syrox:              return "Syrox"
                case .tcl:                return "TCL"
                case .teclast:            return "Teclast"
                case .toshiba:            return "Toshiba"
                case .trident:            return "Trident"
                case .turkcell:           return "Turkcell"
                case .ulefone:            return "Ulefone"
                case .unipad:             return "Unipad"
                case .vestel:             return "Vestel"
                case .viewsonic:          return "ViewSonic"
                case .vivo:               return "Vivo"
                case .vodafone:           return "Vodafone"
                case .vorcom:             return "Vorcom"
                case .welio:              return "Welio"
                case .xiaomi:             return "Xiaomi"
                case .zte:                return "ZTE"
                case .other:              return "Diğer"
                case .batch:              return "Toplu Satış"
                }
            }
        }
        
        
        
        
        
        enum Apple: String, Describer, Codable, CaseIterable {
            case iPadAir1
            case iPadAir2
            case iPadAir3
            case iPadAir4
            case iPadAir5
            case iPadAir6
            case iPadmini1
            case iPadmini2
            case iPadmini3
            case iPadmini4
            case iPadmini5
            case iPadmini6
            case iPad1
            case iPad2
            case iPad3
            case iPad4
            case iPad5
            case iPad6
            case iPad7
            case iPad8
            case iPad9
            case iPad10
            case iPadPro1
            case iPadPro2
            case iPadPro3
            case iPadPro4
            case iPadPro5
            case iPadPro6
            case iPadPro7
            
            
            func describe() -> String {
                switch self {
                case .iPadAir1:         return "iPad Air 1"
                case .iPadAir2:         return "iPad Air 2"
                case .iPadAir3:         return "iPad Air 3"
                case .iPadAir4:         return "iPad Air 4"
                case .iPadAir5:         return "iPad Air 5"
                case .iPadAir6:         return "iPad Air 6"
                case .iPadmini1:        return "iPad mini 1"
                case .iPadmini2:        return "iPad mini 2"
                case .iPadmini3:        return "iPad mini 3"
                case .iPadmini4:        return "iPad mini 4"
                case .iPadmini5:        return "iPad mini 5"
                case .iPadmini6:        return "iPad mini 6"
                case .iPad1:            return "iPad 1"
                case .iPad2:            return "iPad 2"
                case .iPad3:            return "iPad 3"
                case .iPad4:            return "iPad 4"
                case .iPad5:            return "iPad 5"
                case .iPad6:            return "iPad 6"
                case .iPad7:            return "iPad 7"
                case .iPad8:            return "iPad 8"
                case .iPad9:            return "iPad 9"
                case .iPad10:           return "iPad 10"
                case .iPadPro1:         return "iPad Pro 1"
                case .iPadPro2:         return "iPad Pro 2"
                case .iPadPro3:         return "iPad Pro 3"
                case .iPadPro4:         return "iPad Pro 4"
                case .iPadPro5:         return "iPad Pro 5"
                case .iPadPro6:         return "iPad Pro 6"
                case .iPadPro7:         return "iPad Pro 7"
                }
            }
        }
        
        
        
        enum Acer: String, Describer, Codable, CaseIterable {
            case chromebooktab10
            case iconiaone7b1770
            case iconiatab10a3a40
            case iconiataba100
            case iconiataba3a30
            case iconiatabb1710
            case iconiaw3810
            case iconiaw4820
            case other
            
            func describe() -> String {
                switch self {
                case .chromebooktab10:      return "Chromebook Tab 10"
                case .iconiaone7b1770:      return "Iconia One 7 B1-770"
                case .iconiatab10a3a40:     return "Iconia Tab 10 A3-A40"
                case .iconiataba100:        return "Iconia Tab A100"
                case .iconiataba3a30:       return "Iconia Tab A3-A30"
                case .iconiatabb1710:       return "Iconia Tab B1-710"
                case .iconiaw3810:          return "Iconia W3-810"
                case .iconiaw4820:          return "Iconia W4-820"
                case .other:                return "Diğer"
                }
            }
        }
        
        
        
        enum Ainol: String, Describer, Codable, CaseIterable {
            case novo5
            
            func describe() -> String {
                switch self {
                case .novo5:                return "Novo 5"
                }
            }
        }
        
        enum Alcatel: String, Describer, Codable, CaseIterable {
            case t17
            case t110
            case t38
            case a3
            case pixi3
            case pixi4
            case pop10
            case smarttab7
            case t10
            case other
            
            func describe() -> String {
                switch self {
                case .t17:                  return "1T 7"
                case .t110:                 return "1T 10"
                case .t38:                  return "3T 8"
                case .a3:                   return "A3"
                case .pixi3:                return "Pixi 3"
                case .pixi4:                return "Pixi 4"
                case .pop10:                return "Pop 10"
                case .smarttab7:            return "Tab 7"
                case .t10:                  return "T10"
                case .other:                return "Diğer"
                }
            }
        }
        
        enum Amazon: String, Describer, Codable, CaseIterable {
            case fire7
            case firehd7
            case firehd8
            case firehd82017
            case firehd10
            case kindlefire
            case kindlefirehd
            
            
            func describe() -> String {
                switch self {
                case .fire7:                return "Fire 7"
                case .firehd7:              return "Fire HD 7"
                case .firehd8:              return "Fire HD 8"
                case .firehd82017:          return "Fire HD 8 (2017)"
                case .firehd10:             return "Fire HD 10"
                case .kindlefire:           return "Kindle Fire"
                case .kindlefirehd:         return "Kindle Fire HD"
                }
            }
        }
        
        
        enum Archos: String, Describer, Codable, CaseIterable {
            case xs101
            case gamepad
            case internettablet
            
            func describe() -> String {
                switch self {
                case .xs101:                return "101 XS"
                case .gamepad:              return "GamePad"
                case .internettablet:       return "Internet Tablet"
                }
            }
        }
        
        enum Artes: String, Describer, Codable, CaseIterable {
            case other
            
            func describe() -> String {
                switch self {
                case .other:                return "Diğer"
                }
            }
        }
        
        
        enum Asus: String, Describer, Codable, CaseIterable {
            case fonepad72014fe170cg
            case fonepad7me372cg
            case fonepad8fe380cg
            case googlenexus7
            case memopad
            case memopad7me70c
            case memopad7me170c
            case memopad7me176c
            case memopad7me176cx
            case memopadhd7me173x
            case memopad8me181c
            case memopad8me181cx
            case memopad10me102a
            case memopad10me103k
            case transformerbookt100
            case transformerbooktrio
            case transformerpadinfinitytf700t
            case transformerpadtf300t
            case vivotabsmartme400c
            case zenpad3s10z500kl
            case zenpad70z370cg
            case zenpad10z300c
            case zenpadc70z170c
            case zenpadc70z170cg
            case zenpads80z580ca
            
            
            func describe() -> String {
                switch self {
                case .fonepad72014fe170cg:          return "Fonepad 7 (2014) FE170CG"
                case .fonepad7me372cg:              return "Fonepad 7 ME372CG"
                case .fonepad8fe380cg:              return "Fonepad 8 FE380CG"
                case .googlenexus7:                 return "Google Nexus 7"
                case .memopad:                      return "MeMO Pad"
                case .memopad7me70c:                return "MeMO Pad 7 ME70C"
                case .memopad7me170c:               return "MeMO Pad 7 ME170C"
                case .memopad7me176c:               return "Memo Pad 7 ME176C"
                case .memopad7me176cx:              return "Memo Pad 7 ME176CX"
                case .memopadhd7me173x:             return "MeMO Pad HD 7 ME173X"
                case .memopad8me181c:               return "MeMO Pad 8 ‏ME181C"
                case .memopad8me181cx:              return "MeMO Pad 8 ME181CX"
                case .memopad10me102a:              return "MeMO Pad 10 ME102A"
                case .memopad10me103k:              return "MeMO Pad 10 ME103K"
                case .transformerbookt100:          return "Transformer Book T100"
                case .transformerbooktrio:          return "Transformer Book Trio"
                case .transformerpadinfinitytf700t: return "Transformer Pad Infinity TF700T"
                case .transformerpadtf300t:         return "Transformer Pad TF300T"
                case .vivotabsmartme400c:           return "VivoTab Smart ME400C"
                case .zenpad3s10z500kl:             return "Zenpad 3S 10 Z500KL"
                case .zenpad70z370cg:               return "ZenPad 7.0 Z370CG"
                case .zenpad10z300c:                return "ZenPad 10 Z300C"
                case .zenpadc70z170c:               return "ZenPad C 7.0 Z170C"
                case .zenpadc70z170cg:              return "ZenPad C 7.0 Z170CG"
                case .zenpads80z580ca:              return "ZenPad S 8.0 Z580CA"
                }
            }
        }
        
        
        enum Blackberry: String, Describer, Codable, CaseIterable {
            case playbook
            
            func describe() -> String {
                switch self {
                case .playbook:                     return "PlayBook"
                }
            }
        }
        
        enum Casper: String, Describer, Codable, CaseIterable {
            case nirvanan200
            case nirvanan210
            case nirvanan220
            case nirvanan240
            case nirvanan310
            case vial8
            case vial10
            case vial20
            case vial30
            case vial40
            case vias7
            case vias8
            case vias10
            case vias20
            case vias28
            case vias30
            case vias38
            case vias40
            case vias48
            case viat3
            case viat5
            case viat7
            case viat7d
            case viat8
            case viat9w
            case viat17
            case viat18w
            case viat27
            case viat41
            case other
            
            
            func describe() -> String {
                switch self {
                case .nirvanan200:              return "Nirvana N200"
                case .nirvanan210:              return "Nirvana N210"
                case .nirvanan220:              return "Nirvana N220"
                case .nirvanan240:              return "Nirvana N240"
                case .nirvanan310:              return "Nirvana N310"
                case .vial8:                    return "VIA L8"
                case .vial10:                   return "VIA L10"
                case .vial20:                   return "VIA L20"
                case .vial30:                   return "VIA L30"
                case .vial40:                   return "VIA L40"
                case .vias7:                    return "VIA S7"
                case .vias8:                    return "VIA S8"
                case .vias10:                   return "VIA S10"
                case .vias20:                   return "VIA S20"
                case .vias28:                   return "VIA S28"
                case .vias30:                   return "VIA S30"
                case .vias38:                   return "VIA S38"
                case .vias40:                   return "VIA S40"
                case .vias48:                   return "VIA S48"
                case .viat3:                    return "VIA T3"
                case .viat5:                    return "VIA T5"
                case .viat7:                    return "VIA T7"
                case .viat7d:                   return "VIA T7D"
                case .viat8:                    return "VIA T8"
                case .viat9w:                   return "VIA T9W"
                case .viat17:                   return "VIA T17"
                case .viat18w:                  return "VIA T18W"
                case .viat27:                   return "VIA T27"
                case .viat41:                   return "VIA T41"
                case .other:                    return "Diğer"
                }
            }
        }
        
        enum Chuwi: String, Describer, Codable, CaseIterable {
            case hi10
            case other
            func describe() -> String {
                switch self {
                case .hi10:                      return "Hi10"
                case .other:                     return "Diğer"
                }
            }
        }
        
        enum Concord: String, Describer, Codable, CaseIterable {
            case plus
            case silveredition
            case other
            
            func describe() -> String {
                switch self {
                case .plus:                         return "Plus +"
                case .silveredition:                return "Silver Edition"
                case .other:                        return "Diğer"
                }
            }
        }
        
        enum Cube: String, Describer, Codable, CaseIterable {
            case iwork
            
            func describe() -> String {
                switch self {
                case .iwork:                        return "iWork"
                }
            }
        }
        
        enum Dark: String, Describer, Codable, CaseIterable {
            case other
            
            func describe() -> String {
                switch self {
                case .other:                        return "Diğer"
                }
            }
        }
        
        enum Dell: String, Describer, Codable, CaseIterable {
            case latitude10
            case venue8
            case venue11pro
            case xps10
            case other
            
            func describe() -> String {
                switch self {
                case .latitude10:                     return "Latitude 10"
                case .venue8:                         return "Venue 8"
                case .venue11pro:                     return "Venue 11 Pro"
                case .xps10:                          return "XPS 10"
                case .other:                          return "Diğer"
                }
            }
        }
        
        enum Doogee: String, Describer, Codable, CaseIterable {
            case t20
            
            func describe() -> String {
                switch self {
                case .t20:                            return "T 20"
                }
            }
        }
        
        enum Everest: String, Describer, Codable, CaseIterable {
            case digilanddl7006kb
            case everpaddc705
            case everpaddc802
            case everpaddc1028
            case everpaddc1112
            case everpaddc9714
            case everpadmomo20s
            case everpadsc712
            case other
            
            func describe() -> String {
                switch self {
                case .digilanddl7006kb:                 return "Digiland DL7006-KB"
                case .everpaddc705:                     return "Everpad DC-705"
                case .everpaddc802:                     return "Everpad DC-802"
                case .everpaddc1028:                    return "Everpad DC-1028"
                case .everpaddc1112:                    return "Everpad DC-1112"
                case .everpaddc9714:                    return "Everpad DC-9714"
                case .everpadmomo20s:                   return "Everpad Momo 20S"
                case .everpadsc712:                     return "Everpad SC-712"
                case .other:                            return "Diğer"
                }
            }
        }
        
        enum Excon: String, Describer, Codable, CaseIterable {
            case other
            
            func describe() -> String {
                switch self {
                case .other:                            return "Diğer"
                }
            }
        }
        
        enum Exper: String, Describer, Codable, CaseIterable {
            case easypade7han
            case easypadh7d
            case easypadh7g
            case easypadh7s
            case easypadp10an
            case easypadp10ems
            case easypadt7c
            case easypadt7q
            
            func describe() -> String {
                switch self {
                case .easypade7han:                      return "Easypad E7HAN"
                case .easypadh7d:                        return "Easypad H7D"
                case .easypadh7g:                        return "EasyPad H7G"
                case .easypadh7s:                        return "EasyPad H7S"
                case .easypadp10an:                      return "Easypad P10AN"
                case .easypadp10ems:                     return "Easypad P10EMS"
                case .easypadt7c:                        return "EasyPad T7C"
                case .easypadt7q:                        return "EasyPad T7Q"
                }
            }
        }
        
        enum Ezcool: String, Describer, Codable, CaseIterable {
            case smarttouch9hdmi
            
            func describe() -> String {
                switch self {
                case .smarttouch9hdmi:                  return "Smart Touch 9 HDMI"
                }
            }
        }
        
        enum Generalmobile: String, Describer, Codable, CaseIterable {
            case etab
            case etab4
            case etab5
            case etab10
            case discoverytab83g
            case other
            
            func describe() -> String {
                switch self {
                case .etab:                              return "e-Tab"
                case .etab4:                             return "e-Tab 4"
                case .etab5:                             return "e-Tab 5"
                case .etab10:                            return "e-Tab 10"
                case .discoverytab83g:                   return "Discovery Tab8 3G"
                case .other:                             return "Diğer"
                }
            }
        }
        
        enum Google: String, Describer, Codable, CaseIterable {
            case pixelc
            
            func describe() -> String {
                switch self {
                case .pixelc:                           return "Pixel C"
                }
            }
        }
        
        enum Grundig: String, Describer, Codable, CaseIterable {
            case grtb10w2
            
            func describe() -> String {
                switch self {
                case .grtb10w2:                         return "GR-TB10-W2"
                }
            }
        }
        
        enum Hisense: String, Describer, Codable, CaseIterable {
            case sero8
            
            func describe() -> String {
                switch self {
                case .sero8:                            return "Sero 8"
                }
            }
        }
        
        enum Hometech: String, Describer, Codable, CaseIterable {
            case alfa10mb
            case alfa7rc
            case alfa8rc
            case alfa8sl
            case ht7
            case ht7rt
            case ht8c
            case ht8m
            case ht10mt
            case ht101b
            case premiumtab7ips
            case premiumtab9
            case quadtab10
            case tab7
            case t715
            case ultratab8
            case w835
            case wi10
            case wi101
            case other
            
            func describe() -> String {
                switch self {
                case .alfa10mb:                           return "Alfa 10MB"
                case .alfa7rc:                            return "Alfa 7RC"
                case .alfa8rc:                            return "Alfa 8RC"
                case .alfa8sl:                            return "Alfa 8SL"
                case .ht7:                                return "HT 7"
                case .ht7rt:                              return "HT 7RT"
                case .ht8c:                               return "HT 8C"
                case .ht8m:                               return "HT 8M"
                case .ht10mt:                             return "HT 10MT"
                case .ht101b:                             return "HT 101B"
                case .premiumtab7ips:                     return "Premium Tab 7 Ips"
                case .premiumtab9:                        return "Premium Tab 9"
                case .quadtab10:                          return "Quad Tab10"
                case .tab7:                               return "Tab7"
                case .t715:                               return "T715"
                case .ultratab8:                          return "Ultra Tab 8"
                case .w835:                               return "W835"
                case .wi10:                               return "Wi 10"
                case .wi101:                              return "Wi 101"
                case .other:                              return "Diğer"
                }
            }
        }
        
        enum Honor: String, Describer, Codable, CaseIterable {
            case pad8
            case pad9
            case padx8
            case padx9
            
            func describe() -> String {
                switch self {
                case .pad8:                                return "Pad 8"
                case .pad9:                                return "Pad 9"
                case .padx8:                               return "Pad X8"
                case .padx9:                               return "Pad X9"
                }
            }
        }
        
        enum Hp: String, Describer, Codable, CaseIterable {
            case elitebookrevolve810g2
            case elitepad900g1
            case elitepad1000g2
            case envy8note
            case pavilionx2
            case protablet408g1
            case protablet608g1
            case prox2612g1
            case slate2
            case stream7tablet
            case other
            
            func describe() -> String {
                switch self {
                case .elitebookrevolve810g2:                    return "EliteBook Revolve 810 G2"
                case .elitepad900g1:                            return "ElitePad 900 G1"
                case .elitepad1000g2:                           return "ElitePad 1000 G2"
                case .envy8note:                                return "Envy 8 Note"
                case .pavilionx2:                               return "Pavilion X2"
                case .protablet408g1:                           return "Pro Tablet 408 G1"
                case .protablet608g1:                           return "Pro Tablet 608 G1"
                case .prox2612g1:                               return "Pro X2 612 G1"
                case .slate2:                                   return "Slate 2"
                case .stream7tablet:                            return "Stream 7 Tablet"
                case .other:                                    return "Diğer"
                }
            }
        }
        
        enum Htc: String, Describer, Codable, CaseIterable {
            case nexus9
            
            func describe() -> String {
                switch self {
                case .nexus9:                                   return "Nexus 9"
                }
            }
        }
        
        enum Huawei: String, Describer, Codable, CaseIterable {
            case enjoytablet2
            case matepadt10
            case matepadt10s
            case mediapad
            case matepad104
            case matepad108
            case matepad115
            case matepad112021
            case matepad112023
            case matepadair
            case matepadpro
            case matepadpro132
            case matepadse104
            case matepadt8
            case mediapad10fhd
            case mediapad10link
            case mediapadm3lite8
            case mediapadm510
            case mediapadt180
            case mediapadt110
            case mediapadt370
            case mediapadt310
            case mediapadt510
            case other
            
            func describe() -> String {
                switch self {
                case .enjoytablet2:                                 return "Enjoy Tablet 2"
                case .matepadt10:                                   return "MatePad T10"
                case .matepadt10s:                                  return "MatePad T10s"
                case .mediapad:                                     return "MediaPad"
                case .matepad104:                                   return "MatePad 10.4"
                case .matepad108:                                   return "MatePad 10.8"
                case .matepad115:                                   return "MatePad 11.5"
                case .matepad112021:                                return "MatePad 11 (2021)"
                case .matepad112023:                                return "MatePad 11 (2023)"
                case .matepadair:                                   return "MatePad Air"
                case .matepadpro:                                   return "MatePad Pro"
                case .matepadpro132:                                return "MatePad Pro 13.2"
                case .matepadse104:                                 return "MatePad SE 10.4"
                case .matepadt8:                                    return "MatePad T8"
                case .mediapad10fhd:                                return "MediaPad 10 FHD"
                case .mediapad10link:                               return "MediaPad 10 Link"
                case .mediapadm3lite8:                              return "MediaPad M3 Lite 8"
                case .mediapadm510:                                 return "MediaPad M5 10"
                case .mediapadt180:                                 return "MediaPad T1 8.0"
                case .mediapadt110:                                 return "MediaPad T1 10"
                case .mediapadt370:                                 return "MediaPad T3 7.0"
                case .mediapadt310:                                 return "MediaPad T3 10"
                case .mediapadt510:                                 return "MediaPad T5 10"
                case .other:                                        return "Diğer"
                }
            }
        }
        
        enum Irulu: String, Describer, Codable, CaseIterable {
            case other
            
            func describe() -> String {
                switch self {
                case .other:                                        return "Diğer"
                }
            }
        }
        
        enum Jumper: String, Describer, Codable, CaseIterable {
            case other
            
            func describe() -> String {
                switch self {
                case .other:                                        return "Diğer"
                }
            }
        }
        
        enum Lenovo: String, Describer, Codable, CaseIterable {
            case a730a3300
            case a850a5500
            case a1070a7600
            case ideapad
            case ideapada10
            case ideataba3000
            case ideatabs6000
            case ideatabs6000h
            case lepads2007
            case miix2
            case miix10
            case tabs8
            case tab2a710
            case tab2a720
            case tab2a730
            case tab2a850
            case tab2a1030
            case tab2a1070f
            case tab37
            case tab37essential
            case tab38
            case tab310
            case tab48
            case tab48plus
            case tab7
            case tab7essential
            case tab10
            case tabe10
            case tabm7
            case tabm8
            case tabm9
            case tabm10
            case tabm10hd
            case tabm10fhdplus
            case tabp10
            case tabp11
            case tabp11gen2
            case tabp11plus
            case tabp11progen2
            case tabp12
            case tabp12pro
            case thinkpad
            case thinkpadtable2
            case thinkpadx12detachable
            case thinkpadx1tablet
            case yogabook
            case yogatablet8
            case yogatablet10
            case yogatablet10hd
            case yogatablet2101
            case yogatablet213
            case yogatab11
            
            func describe() -> String {
                switch self {
                case .a730a3300:                            return "A7-30 A3300"
                case .a850a5500:                            return "A8-50 A5500"
                case .a1070a7600:                           return "A10-70 A7600"
                case .ideapad:                              return "IdeaPad"
                case .ideapada10:                           return "IdeaPad A10"
                case .ideataba3000:                         return "IdeaTab A3000"
                case .ideatabs6000:                         return "IdeaTab S6000"
                case .ideatabs6000h:                        return "IdeaTab S6000H"
                case .lepads2007:                           return "LePad S2007"
                case .miix2:                                return "Miix 2"
                case .miix10:                               return "Miix 10"
                case .tabs8:                                return "Tab S8"
                case .tab2a710:                             return "Tab 2 A7-10"
                case .tab2a720:                             return "Tab 2 A7-20"
                case .tab2a730:                             return "Tab 2 A7-30"
                case .tab2a850:                             return "Tab 2 A8-50"
                case .tab2a1030:                            return "Tab 2 A10-30"
                case .tab2a1070f:                           return "Tab 2 A10-70F"
                case .tab37:                                return "Tab3 7"
                case .tab37essential:                       return "Tab3 7 Essential"
                case .tab38:                                return "Tab3 8"
                case .tab310:                               return "Tab3 10"
                case .tab48:                                return "Tab 4 8"
                case .tab48plus:                            return "Tab 4 8 Plus"
                case .tab7:                                 return "Tab 7"
                case .tab7essential:                        return "Tab 7 Essential"
                case .tab10:                                return "Tab 10"
                case .tabe10:                               return "Tab E10"
                case .tabm7:                                return "Tab M7"
                case .tabm8:                                return "Tab M8"
                case .tabm9:                                return "Tab M9"
                case .tabm10:                               return "Tab M10"
                case .tabm10hd:                             return "Tab M10 (HD)"
                case .tabm10fhdplus:                        return "Tab M10 FHD Plus"
                case .tabp10:                               return "Tab P10"
                case .tabp11:                               return "Tab P11"
                case .tabp11gen2:                           return "Tab P11 Gen 2"
                case .tabp11plus:                           return "Tab P11 Plus"
                case .tabp11progen2:                        return "Tab P11 Pro Gen 2"
                case .tabp12:                               return "Tab P12"
                case .tabp12pro:                            return "Tab P12 Pro"
                case .thinkpad:                             return "ThinkPad"
                case .thinkpadtable2:                       return "ThinkPad Tablet 2"
                case .thinkpadx12detachable:                return "ThinkPad X12 Detachable"
                case .thinkpadx1tablet:                     return "ThinkPad X1 Tablet"
                case .yogabook:                             return "Yoga Book"
                case .yogatablet8:                          return "Yoga Tablet 8"
                case .yogatablet10:                         return "Yoga Tablet 10"
                case .yogatablet10hd:                       return "Yoga Tablet 10 HD+"
                case .yogatablet2101:                       return "Yoga Tablet 2 10.1"
                case .yogatablet213:                        return "Yoga Tablet 2 13"
                case .yogatab11:                            return "Yoga Tab 11"
                }
            }
        }
        
        enum Lg: String, Describer, Codable, CaseIterable {
            case gpad70v400
            case gpad83v500
            
            func describe() -> String {
                switch self {
                case .gpad70v400:                           return "G Pad 7.0 V400"
                case .gpad83v500:                           return "G Pad 8.3 V500"
                }
            }
        }
        
        enum Microsoft: String, Describer, Codable, CaseIterable {
            case surface
            case surface2
            case surface3
            case surfacepro
            case surfacepro3
            case surfacepro4
            case surfacepro5
            case surfacepro6
            case surfacepro7
            case surfacepro7plus
            case surfacepro8
            case surfacepro9
            case surfacepro10
            
            func describe() -> String {
                switch self {
                case .surface:                               return "Surface"
                case .surface2:                              return "Surface 2"
                case .surface3:                              return "Surface 3"
                case .surfacepro:                            return "Surface Pro"
                case .surfacepro3:                           return "Surface Pro 3"
                case .surfacepro4:                           return "Surface Pro 4"
                case .surfacepro5:                           return "Surface Pro 5"
                case .surfacepro6:                           return "Surface Pro 6"
                case .surfacepro7:                           return "Surface Pro 7"
                case .surfacepro7plus:                       return "Surface Pro 7 Plus"
                case .surfacepro8:                           return "Surface Pro 8"
                case .surfacepro9:                           return "Surface Pro 9"
                case .surfacepro10:                          return "Surface Pro 10"
                }
            }
        }
        
        enum Motorola: String, Describer, Codable, CaseIterable {
            case xoom
            case xoomwithwifi
            
            func describe() -> String {
                switch self {
                case .xoom:                                   return "Xoom"
                case .xoomwithwifi:                           return "Xoom with Wi-Fi"
                }
            }
        }
        
        enum Msi: String, Describer, Codable, CaseIterable {
            case other
            
            func describe() -> String {
                switch self {
                case .other:                                  return "Diğer"
                }
            }
        }
        
        enum Navitech: String, Describer, Codable, CaseIterable {
            case neotabs130
            
            func describe() -> String {
                switch self {
                case .neotabs130:                             return "NeoTab S130"
                }
            }
        }
        
        enum Nextbook: String, Describer, Codable, CaseIterable {
            case nxw10qc32g
            
            func describe() -> String {
                switch self {
                case .nxw10qc32g:                              return "NXW10QC32G"
                }
            }
        }
        
        enum Nokia: String, Describer, Codable, CaseIterable {
            case n1
            
            func describe() -> String {
                switch self {
                case .n1:                                       return "N1"
                }
            }
        }
        
        enum Onda: String, Describer, Codable, CaseIterable {
            case other
            
            func describe() -> String {
                switch self {
                case .other:                                    return "Diğer"
                }
            }
        }
        
        enum Oneplus: String, Describer, Codable, CaseIterable {
            case padgo
            
            func describe() -> String {
                switch self {
                case .padgo:                                    return "Pad Go"
                }
            }
        }
        
        enum Onyo: String, Describer, Codable, CaseIterable {
            case prospace
            
            func describe() -> String {
                switch self {
                case .prospace:                                  return "Prospace"
                }
            }
        }
        
        enum Oukitel: String, Describer, Codable, CaseIterable {
            case rt2
            
            func describe() -> String {
                switch self {
                case .rt2:                                       return "RT2"
                }
            }
        }
        
        enum Panasonic: String, Describer, Codable, CaseIterable {
            case fzb2
            case fzg1
            case toughpadfza1
            case toughpadfzm1
            
            func describe() -> String {
                switch self {
                case .fzb2:                                       return "FZ-B2"
                case .fzg1:                                       return "FZ-G1"
                case .toughpadfza1:                               return "Toughpad FZ-A1"
                case .toughpadfzm1:                               return "Toughpad FZ-M1"
                }
            }
        }
        
        enum Philips: String, Describer, Codable, CaseIterable {
            case m9pro
            case m9x
            case m10
            
            func describe() -> String {
                switch self {
                case .m9pro:                                        return "M9 Pro"
                case .m9x:                                          return "M9X"
                case .m10:                                          return "M10"
                }
            }
        }
        
        enum Pipo: String, Describer, Codable, CaseIterable {
            case other
            
            func describe() -> String {
                switch self {
                case .other:                                        return "Diğer"
                }
            }
        }
        
        enum Piranha: String, Describer, Codable, CaseIterable {
            case aristoqtab
            case business3tab
            case gpsbusinesstab
            case pro2tab
            case windowstab8001
            case zoomtab
            case other
            
            func describe() -> String {
                switch self {
                case .aristoqtab:                                    return "Aristo Q Tab"
                case .business3tab:                                  return "Business 3 Tab"
                case .gpsbusinesstab:                                return "GPS Business Tab"
                case .pro2tab:                                       return "Pro 2 Tab"
                case .windowstab8001:                                return "Windows Tab 8001"
                case .zoomtab:                                       return "Zoom Tab"
                case .other:                                         return "Diğer"
                }
            }
        }
        
        enum Polaroid: String, Describer, Codable, CaseIterable {
            case kidstablet2
            
            func describe() -> String {
                switch self {
                case .kidstablet2:                                  return "Kids Tablet 2"
                }
            }
        }
        
        enum Polypad: String, Describer, Codable, CaseIterable {
            case modal1010ips
            case modal1018
            case c504
            case w10
            case other
            
            func describe() -> String {
                switch self {
                case .modal1010ips:                                   return "1010 IPS"
                case .modal1018:                                      return "1018"
                case .c504:                                           return "C504"
                case .w10:                                            return "W-10"
                case .other:                                          return "Diğer"
                }
            }
        }
        
        enum Probook: String, Describer, Codable, CaseIterable {
            case prbt120
            case prbt755
            case other
            
            func describe() -> String {
                switch self {
                case .prbt120:                                        return "PRBT120"
                case .prbt755:                                        return "PRBT755"
                case .other:                                          return "Diğer"
                }
            }
        }
        
        enum Reeder: String, Describer, Codable, CaseIterable {
            case a7iquad
            case a8
            case a8i
            case a8iq2
            case a8iquad
            case a10ixair
            case m7
            case m7go
            case m7plus
            case m7s
            case m8go
            case m8plus
            case m10go
            case m10plus
            case m10pro
            case m10s
            case reedpad3
            case reedpadx
            case other
            
            func describe() -> String {
                switch self {
                case .a7iquad:                                          return "A7i Quad"
                case .a8:                                               return "A8"
                case .a8i:                                              return "A8i"
                case .a8iq2:                                            return "A8i Q2"
                case .a8iquad:                                          return "A8i Quad"
                case .a10ixair:                                         return "A10iX Air"
                case .m7:                                               return "M7"
                case .m7go:                                             return "M7 Go"
                case .m7plus:                                           return "M7 Plus"
                case .m7s:                                              return "M7S"
                case .m8go:                                             return "M8 Go"
                case .m8plus:                                           return "M8 Plus"
                case .m10go:                                            return "M10 Go"
                case .m10plus:                                          return "M10 Plus"
                case .m10pro:                                           return "M10 Pro"
                case .m10s:                                             return "M10S"
                case .reedpad3:                                         return "Reedpad 3"
                case .reedpadx:                                         return "Reedpad X"
                case .other:                                            return "Diğer"
                }
            }
        }
        
        
        enum Rowell: String, Describer, Codable, CaseIterable {
            case other
            
            func describe() -> String {
                switch self {
                case .other:                                            return "Diğer"
                }
            }
        }
        
        enum Samsung: String, Describer, Codable, CaseIterable {
            case ativ300ttab3
            case ativ500t
            case ativ700t
            case galaxybookw620
            case galaxybookw627
            case galaxybookw720
            case galaxynote8n5100
            case galaxynote8n5105
            case galaxynote8n5110
            case galaxynote10n8000
            case galaxynote10n8005
            case galaxynote10n8010
            case galaxynote10n8013
            case galaxynote10p600
            case galaxynote10p602
            case galaxynoteprop902
            case galaxynoteprop900
            case galaxytab70plusp6200
            case galaxytab70plusp6210
            case galaxytab70p6800
            case galaxytab70p6810
            case galaxytab80p7300
            case galaxytab101vp7100
            case galaxytab101p7500
            case galaxytab101p7510
            case galaxytab270p3110
            case galaxytab270p3113
            case galaxytab2101p5100
            case galaxytab2101p5110
            case galaxytab2101p5113
            case galaxytab370litet110
            case galaxytab3lite70t111
            case galaxytab370litet113
            case galaxytab370wifit210
            case galaxytab3703gt212
            case galaxytab380wifit310
            case galaxytab3101p5200
            case galaxytab3101wifip5210
            case galaxytab3vt116
            case galaxytab470t230
            case galaxytab4703gt232
            case galaxytab470ltet235
            case galaxytab480t332
            case galaxytab4101t530
            case galaxytab4101t532
            case galaxytab4101t533
            case galaxytab4101ltet535
            case galaxytaba60t280
            case galaxytaba70t280
            case galaxytaba70t285
            case galaxytaba70t500
            case galaxytaba70t507
            case galaxytaba80ltet297
            case galaxytaba80p200
            case galaxytaba80p205
            case galaxytaba80t290
            case galaxytaba80t295
            case galaxytaba80t350
            case galaxytaba80t380
            case galaxytaba80t385
            case galaxytaba84t307
            case galaxytaba97p550
            case galaxytaba97t555
            case galaxytaba101p580
            case galaxytaba101p587
            case galaxytaba101t510
            case galaxytaba101t515
            case galaxytaba101t517
            case galaxytaba101t580
            case galaxytaba101t587
            case galaxytaba105t590
            case galaxytaba105t595
            case galaxytaba7104t500
            case galaxytaba7104t505
            case galaxytaba7104t509
            case galaxytaba7litet220
            case galaxytaba7litet225
            case galaxytaba7litet227
            case galaxytaba8105x200
            case galaxytaba8105x205
            case galaxytaba9x210
            case galaxytaba9x215
            case galaxytaba9x216
            case galaxytaba9x110
            case galaxytaba9x115
            case galaxytaba9x117
            case galaxytabactiveprot547
            case galaxytabactive2
            case galaxytabactive3
            case galaxytabactive4pro
            case galaxytabe96t560
            case galaxytabe96t561
            case galaxytabe96t562
            case galaxytabp1000
            case galaxytabpro84t320
            case galaxytabpro101t520
            case galaxytabprosw700
            case galaxytabs84t700
            case galaxytabs105t800
            case galaxytabs105t807
            case galaxytabs280t710
            case galaxytabs280t715
            case galaxytabs297t810
            case galaxytabs297t815
            case galaxytabs297t817
            case galaxytabs297t818
            case galaxytabs397t820
            case galaxytabs397t825
            case galaxytabs4105t830
            case galaxytabs4105t835
            case galaxytabs5et720
            case galaxytabs5et727
            case galaxytabs6litep610
            case galaxytabs6litep613
            case galaxytabs6litep615
            case galaxytabs6litep617
            case galaxytabs6litep619
            case galaxytabs6t860
            case galaxytabs7t870
            case galaxytabs7t875
            case galaxytabs7t970
            case galaxytabs7t976
            case galaxytabs7fet730
            case galaxytabs7fet736
            case galaxytabs7fet737
            case galaxytabs8x800
            case galaxytabs8x806
            case galaxytabs8x700
            case galaxytabs8x706
            case galaxytabs8ultrax900
            case galaxytabs9x810
            case galaxytabs9x816
            case galaxytabs9x710
            case galaxytabs9x716
            case galaxytabs9ultrax910
            case galaxytabs9ultrax916
            case galaxytabs9fex510
            case galaxytabs9fex516
            case galaxytabs9fex610
            case galaxytabs9fex616
            case galaxyviewt670
            case googlenexus10
            case slatepc
            
            func describe() -> String {
                switch self {
                case .ativ300ttab3:                             return "Galaxy Note 10.1 P600"
                case .ativ500t:                                 return "Galaxy Note 10.1 P602"
                case .ativ700t:                                 return "Galaxy Note Pro P902"
                case .galaxybookw620:                           return "Galaxy Note Pro 12.2 P900"
                case .galaxybookw627:                           return "Galaxy Tab 7.0 Plus P6200"
                case .galaxybookw720:                           return "Galaxy Tab 7.0 Plus P6210"
                case .galaxynote8n5100:                         return "Galaxy Tab 7.7 P6800"
                case .galaxynote8n5105:                         return "Galaxy Tab 7.7 P6810"
                case .galaxynote8n5110:                         return "Galaxy Tab 8.9 P7300"
                case .galaxynote10n8000:                        return "Galaxy Tab 10.1v P7100"
                case .galaxynote10n8005:                        return "Galaxy Tab 10.1 P7500"
                case .galaxynote10n8010:                        return "Galaxy Tab 10.1 P7510"
                case .galaxynote10n8013:                        return "Galaxy Tab2 7.0 P3110"
                case .galaxynote10p600:                         return "Galaxy Tab2 7.0 P3113"
                case .galaxynote10p602:                         return "Galaxy Tab2 10.1 P5100"
                case .galaxynoteprop902:                        return "Galaxy Tab2 10.1 P5110"
                case .galaxynoteprop900:                        return "Galaxy Tab2 10.1 P5113"
                case .galaxytab70plusp6200:                     return "Galaxy Tab3 7.0 Lite T110"
                case .galaxytab70plusp6210:                     return "Galaxy Tab3 Lite 7.0 T111"
                case .galaxytab70p6800:                         return "Galaxy Tab3 7.0 Lite T113"
                case .galaxytab70p6810:                         return "Galaxy Tab3 7.0 WiFi T210"
                case .galaxytab80p7300:                         return "Galaxy Tab3 7.0 3G T212"
                case .galaxytab101vp7100:                       return "Galaxy Tab3 8.0 Wi-Fi T310"
                case .galaxytab101p7500:                        return "Galaxy Tab3 10.1 P5200"
                case .galaxytab101p7510:                        return "Galaxy Tab3 10.1 Wifi P5210"
                case .galaxytab270p3110:                        return "Galaxy Tab3 V T116"
                case .galaxytab270p3113:                        return "Galaxy Tab4 7.0 T230"
                case .galaxytab2101p5100:                       return "Galaxy Tab4 7.0 3G T232"
                case .galaxytab2101p5110:                       return "Galaxy Tab4 7.0 LTE T235"
                case .galaxytab2101p5113:                       return "Galaxy Tab4 8.0 T332"
                case .galaxytab370litet110:                     return "Galaxy Tab4 10.1 T530"
                case .galaxytab3lite70t111:                     return "Galaxy Tab4 10.1 T532"
                case .galaxytab370litet113:                     return "Galaxy Tab4 10.1 T533"
                case .galaxytab370wifit210:                     return "Galaxy Tab4 10.1 LTE T535"
                case .galaxytab3703gt212:                       return "Galaxy Tab A 6.0 T280"
                case .galaxytab380wifit310:                     return "Galaxy Tab A 7.0 T280"
                case .galaxytab3101p5200:                       return "Galaxy Tab A 7.0 T285"
                case .galaxytab3101wifip5210:                   return "Galaxy Tab A 7.0 T500"
                case .galaxytab3vt116:                          return "Galaxy Tab A 7.0 T507"
                case .galaxytab470t230:                         return "Galaxy Tab A 8.0 LTE T297"
                case .galaxytab4703gt232:                       return "Galaxy Tab A 8.0 P200"
                case .galaxytab470ltet235:                      return "Galaxy Tab A 8.0 P205"
                case .galaxytab480t332:                         return "Galaxy Tab A 8.0 T290"
                case .galaxytab4101t530:                        return "Galaxy Tab A 8.0 T295"
                case .galaxytab4101t532:                        return "Galaxy Tab A 8.0 T350"
                case .galaxytab4101t533:                        return "Galaxy Tab A 8.0 T380"
                case .galaxytab4101ltet535:                     return "Galaxy Tab A 8.0 T385"
                case .galaxytaba60t280:                         return "Galaxy Tab A 8.4 T307"
                case .galaxytaba70t280:                         return "Galaxy Tab A 9.7 P550"
                case .galaxytaba70t285:                         return "Galaxy Tab A 9.7 T555"
                case .galaxytaba70t500:                         return "Galaxy Tab A 10.1 P580"
                case .galaxytaba70t507:                         return "Galaxy Tab A 10.1 P587"
                case .galaxytaba80ltet297:                      return "Galaxy Tab A 10.1 T510"
                case .galaxytaba80p200:                         return "Galaxy Tab A 10.1 T515"
                case .galaxytaba80p205:                         return "Galaxy Tab A 10.1 T517"
                case .galaxytaba80t290:                         return "Galaxy Tab A 10.1 T580"
                case .galaxytaba80t295:                         return "Galaxy Tab A 10.1 T587"
                case .galaxytaba80t350:                         return "Galaxy Tab A 10.5 T590"
                case .galaxytaba80t380:                         return "Galaxy Tab A 10.5 T595"
                case .galaxytaba80t385:                         return "Galaxy Tab A7 10.4 T500"
                case .galaxytaba84t307:                         return "Galaxy Tab A7 10.4 T505"
                case .galaxytaba97p550:                         return "Galaxy Tab A7 10.4 T509"
                case .galaxytaba97t555:                         return "Galaxy Tab A7 Lite T220"
                case .galaxytaba101p580:                        return "Galaxy Tab A7 Lite T225"
                case .galaxytaba101p587:                        return "Galaxy Tab A7 Lite T227"
                case .galaxytaba101t510:                        return "Galaxy Tab A8 10.5 X200"
                case .galaxytaba101t515:                        return "Galaxy Tab A8 10.5 X205"
                case .galaxytaba101t517:                        return "Galaxy Tab A9+ X210"
                case .galaxytaba101t580:                        return "Galaxy Tab A9+ X215"
                case .galaxytaba101t587:                        return "Galaxy Tab A9+ X216"
                case .galaxytaba105t590:                        return "Galaxy Tab A9 X110"
                case .galaxytaba105t595:                        return "Galaxy Tab A9 X115"
                case .galaxytaba7104t500:                       return "Galaxy Tab A9 X117"
                case .galaxytaba7104t505:                       return "Galaxy Tab Active Pro T547"
                case .galaxytaba7104t509:                       return "Galaxy Tab Active 2"
                case .galaxytaba7litet220:                      return "Galaxy Tab Active 3"
                case .galaxytaba7litet225:                      return "Galaxy Tab Active 4 Pro"
                case .galaxytaba7litet227:                      return "Galaxy Tab E 9.6 T560"
                case .galaxytaba8105x200:                       return "Galaxy Tab E 9.6 T561"
                case .galaxytaba8105x205:                       return "Galaxy Tab E 9.6 T562"
                case .galaxytaba9x210:                          return "Galaxy Tab P1000"
                case .galaxytaba9x215:                          return "Galaxy Tab Pro 8.4 T320"
                case .galaxytaba9x216:                          return "Galaxy Tab Pro 10.1 T520"
                case .galaxytaba9x110:                          return "Galaxy Tab Pro S W700"
                case .galaxytaba9x115:                          return "Galaxy Tab S 8.4 T700"
                case .galaxytaba9x117:                          return "Galaxy Tab S 10.5 T800"
                case .galaxytabactiveprot547:                   return "Galaxy Tab S 10.5 T807"
                case .galaxytabactive2:                         return "Galaxy Tab S2 8.0 T710"
                case .galaxytabactive3:                         return "Galaxy Tab S2 8.0 T715"
                case .galaxytabactive4pro:                      return "Galaxy Tab S2 9.7 T810"
                case .galaxytabe96t560:                         return "Galaxy Tab S2 9.7 T815"
                case .galaxytabe96t561:                         return "Galaxy Tab S2 9.7 T817"
                case .galaxytabe96t562:                         return "Galaxy Tab S2 9.7 T818"
                case .galaxytabp1000:                           return "Galaxy Tab S3 9.7 T820"
                case .galaxytabpro84t320:                       return "Galaxy Tab S3 9.7 T825"
                case .galaxytabpro101t520:                      return "Galaxy Tab S4 10.5 T830"
                case .galaxytabprosw700:                        return "Galaxy Tab S4 10.5 T835"
                case .galaxytabs84t700:                         return "Galaxy Tab S5e T720"
                case .galaxytabs105t800:                        return "Galaxy Tab S5e T727"
                case .galaxytabs105t807:                        return "Galaxy Tab S6 Lite P610"
                case .galaxytabs280t710:                        return "Galaxy Tab S6 Lite P613"
                case .galaxytabs280t715:                        return "Galaxy Tab S6 Lite P615"
                case .galaxytabs297t810:                        return "Galaxy Tab S6 Lite P617"
                case .galaxytabs297t815:                        return "Galaxy Tab S6 Lite P619"
                case .galaxytabs297t817:                        return "Galaxy Tab S6 T860"
                case .galaxytabs297t818:                        return "Galaxy Tab S7 T870"
                case .galaxytabs397t820:                        return "Galaxy Tab S7 T875"
                case .galaxytabs397t825:                        return "Galaxy Tab S7+ T970"
                case .galaxytabs4105t830:                       return "Galaxy Tab S7+ T976"
                case .galaxytabs4105t835:                       return "Galaxy Tab S7 FE T730"
                case .galaxytabs5et720:                         return "Galaxy Tab S7 FE T736"
                case .galaxytabs5et727:                         return "Galaxy Tab S7 FE T737"
                case .galaxytabs6litep610:                      return "Galaxy Tab S8+ X800"
                case .galaxytabs6litep613:                      return "Galaxy Tab S8+ X806"
                case .galaxytabs6litep615:                      return "Galaxy Tab S8 X700"
                case .galaxytabs6litep617:                      return "Galaxy Tab S8 X706"
                case .galaxytabs6litep619:                      return "Galaxy Tab S8 Ultra X900"
                case .galaxytabs6t860:                          return "Galaxy Tab S9+ X810"
                case .galaxytabs7t870:                          return "Galaxy Tab S9+ X816"
                case .galaxytabs7t875:                          return "Galaxy Tab S9 X710"
                case .galaxytabs7t970:                          return "Galaxy Tab S9 X716"
                case .galaxytabs7t976:                          return "Galaxy Tab S9 Ultra X910"
                case .galaxytabs7fet730:                        return "Galaxy Tab S9 Ultra X916"
                case .galaxytabs7fet736:                        return "Galaxy Tab S9 FE X510"
                case .galaxytabs7fet737:                        return "Galaxy Tab S9 FE X516"
                case .galaxytabs8x800:                          return "Galaxy Tab S9 FE+ X610"
                case .galaxytabs8x806:                          return "Galaxy Tab S9 FE+ X616"
                case .galaxytabs8x700:                          return "Galaxy View T670"
                case .galaxytabs8x706:                          return "Google Nexus 10"
                case .galaxytabs8ultrax900:                     return "Slate PC"
                case .galaxytabs9x810:                          return "Galaxy Note 10.1 P600"
                case .galaxytabs9x816:                          return "Galaxy Note 10.1 P602"
                case .galaxytabs9x710:                          return "Galaxy Note Pro P902"
                case .galaxytabs9x716:                          return "Galaxy Note Pro 12.2 P900"
                case .galaxytabs9ultrax910:                     return "Galaxy Tab 7.0 Plus P6200"
                case .galaxytabs9ultrax916:                     return "Galaxy Tab 7.0 Plus P6210"
                case .galaxytabs9fex510:                        return "Galaxy Tab 7.7 P6800"
                case .galaxytabs9fex516:                        return "Galaxy Tab 7.7 P6810"
                case .galaxytabs9fex610:                        return "Galaxy Tab 8.9 P7300"
                case .galaxytabs9fex616:                        return "Galaxy Tab 10.1v P7100"
                case .galaxyviewt670:                           return "Galaxy Tab 10.1 P7500"
                case .googlenexus10:                            return "Galaxy Tab 10.1 P7510"
                case .slatepc:                                  return "Galaxy Tab2 7.0 P3110"
                }
            }
        }
        
        enum Sony: String, Describer, Codable, CaseIterable {
            case tablets
            case tablets3g
            case vaioduo13
            case vaiotap11
            case xperiatabletz
            case xperiatabletzlte
            case xperiaz2tablet
            case xperiaz2tabletlte
            
            func describe() -> String {
                switch self {
                case .tablets:                                  return "Tablet S"
                case .tablets3g:                                return "Tablet S 3G"
                case .vaioduo13:                                return "VAIO Duo 13"
                case .vaiotap11:                                return "VAIO Tap 11"
                case .xperiatabletz:                            return "Xperia Tablet Z"
                case .xperiatabletzlte:                         return "Xperia Tablet Z LTE"
                case .xperiaz2tablet:                           return "Xperia Z2 Tablet"
                case .xperiaz2tabletlte:                        return "Xperia Z2 Tablet LTE"
                }
            }
        }
        
        enum Sunny: String, Describer, Codable, CaseIterable {
            case other
            
            func describe() -> String {
                switch self {
                case .other:                                    return "Diğer"
                }
            }
        }
        
        
        enum Syrox: String, Describer, Codable, CaseIterable {
            case other
            
            func describe() -> String {
                switch self {
                case .other:                                    return "Diğer"
                }
            }
        }
        
        enum Tcl: String, Describer, Codable, CaseIterable {
            case tab10max
            case nxtpaper10s
            case tab7lite
            
            func describe() -> String {
                switch self {
                case .tab10max:                                  return "10 Tab Max"
                case .nxtpaper10s:                               return "Nxtpaper 10s"
                case .tab7lite:                                  return "Tab 7 Lite"
                }
            }
        }
        
        enum Teclast: String, Describer, Codable, CaseIterable {
            case other
            
            func describe() -> String {
                switch self {
                case .other:                                    return "Diğer"
                }
            }
        }
        
        enum Toshiba: String, Describer, Codable, CaseIterable {
            case satellitew30dta104
            
            func describe() -> String {
                switch self {
                case .satellitew30dta104:                       return "Satellite W30DT-A-104"
                }
            }
        }
        
        enum Trident: String, Describer, Codable, CaseIterable {
            case tpad
            
            func describe() -> String {
                switch self {
                case .tpad:                                     return "TPAD"
                }
            }
        }
        
        enum Turkcell: String, Describer, Codable, CaseIterable {
            case ttablet
            
            func describe() -> String {
                switch self {
                case .ttablet:                                  return "T Tablet"
                }
            }
        }
        
        enum Ulefone: String, Describer, Codable, CaseIterable {
            case armorpad2
            
            func describe() -> String {
                switch self {
                case .armorpad2:                                return "Armor Pad 2"
                }
            }
        }
        
        enum Unipad: String, Describer, Codable, CaseIterable {
            case smarttablet
            
            func describe() -> String {
                switch self {
                case .smarttablet:                              return "Smart Tablet"
                }
            }
        }
        
        enum Vestel: String, Describer, Codable, CaseIterable {
            case vtab7lite2
            case vtab7lite3
            case vtab10
            case vtab1041
            case vtab7010
            case vtab7020a
            case vtab7025
            case vtab7810
            case vtab8010
            case vtabz2
            case other
            
            func describe() -> String {
                switch self {
                case .vtab7lite2:                                   return "V Tab 7 Lite 2"
                case .vtab7lite3:                                   return "V Tab 7 Lite 3"
                case .vtab10:                                       return "V Tab 10"
                case .vtab1041:                                     return "V Tab 1041"
                case .vtab7010:                                     return "V Tab 7010"
                case .vtab7020a:                                    return "V Tab 7020A"
                case .vtab7025:                                     return "V Tab 7025"
                case .vtab7810:                                     return "V Tab 7810"
                case .vtab8010:                                     return "V Tab 8010"
                case .vtabz2:                                       return "V Tab Z2"
                case .other:                                        return "Diğer"
                }
            }
        }
        
        enum Viewsonic: String, Describer, Codable, CaseIterable {
            case viewpad10
            
            func describe() -> String {
                switch self {
                case .viewpad10:                                    return "ViewPad 10"
                }
            }
        }
        
        enum Vivo: String, Describer, Codable, CaseIterable {
            case pad2
            
            func describe() -> String {
                switch self {
                case .pad2:                                         return "Pad 2"
                }
            }
        }
        
        enum Vodafone: String, Describer, Codable, CaseIterable {
            case smarttab2
            case smarttab3
            case smarttabmini6
            case smarttab10
            
            func describe() -> String {
                switch self {
                case .smarttab2:                                     return "Smart Tab 2"
                case .smarttab3:                                     return "Smart Tab 3"
                case .smarttabmini6:                                 return "Smart Tab Mini 6"
                case .smarttab10:                                    return "Smart Tab 10"
                }
            }
        }
        
        enum Vorcom: String, Describer, Codable, CaseIterable {
            case s7
            case ultrapad
            case s12
            case ultimate
            case sxpro
            
            func describe() -> String {
                switch self {
                case .s7:                                             return "S7"
                case .ultrapad:                                       return "Ultrapad"
                case .s12:                                            return "S12"
                case .ultimate:                                       return "Ultimate"
                case .sxpro:                                          return "SX Pro"
                }
            }
        }
        
        enum Welio: String, Describer, Codable, CaseIterable {
            case stf1301p
            case tabm108
            
            func describe() -> String {
                switch self {
                case .stf1301p:                                       return "ST F1301P"
                case .tabm108:                                        return "Tab M108"
                }
            }
        }
        
        enum Xiaomi: String, Describer, Codable, CaseIterable {
            case mipad3
            case mipad4
            case pad5
            case pad5pro124
            case pad6
            case pad6pro
            case redmipad
            case redmipadpro
            case redmipadse
            
            func describe() -> String {
                switch self {
                case .mipad3:                                         return "Mi Pad 3"
                case .mipad4:                                         return "Mi Pad 4"
                case .pad5:                                           return "Pad 5"
                case .pad5pro124:                                     return "Pad 5 Pro 12.4"
                case .pad6:                                           return "Pad 6"
                case .pad6pro:                                        return "Pad 6 Pro"
                case .redmipad:                                       return "Redmi Pad"
                case .redmipadpro:                                    return "Redmi Pad Pro"
                case .redmipadse:                                     return "Redmi Pad SE"
                }
            }
        }
        
        
        enum Zte: String, Describer, Codable, CaseIterable {
            case other
            
            func describe() -> String {
                switch self {
                case .other:                                          return "Diğer"
                }
            }
        }
        
        
    }
}
