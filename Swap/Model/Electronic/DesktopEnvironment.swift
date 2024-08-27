//
//  DesktopEnvironment.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 31.07.2024.
//

import Foundation


//MARK: -> Desktop Environment
extension ElectronicProductEnvironment {
    struct DesktopEnvironment {
        //Desktop -> Lenovo -> Modals
        enum ProductType: String, Describer, CaseIterable, Codable, CategoryImplementer {
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
                case .modals:
                    return Brand.allCases.reduce(into: [String: Any]()) { partialResult, brand in
                        partialResult[brand.describe()] = Finalizer.desktop
                    }
                case .equipment:
                    return Equipment.allCases.reduce(into: [String: Any]()) { partialResult, equipment in
                        partialResult[equipment.describe()] = Finalizer.desktopequipment
                    }
                }
            }
            
            case modals
            case equipment
            
            func describe() -> String {
                switch self {
                case .modals:             return "Modeller"
                case .equipment:          return "Ekipmanlar"
                }
            }
        }
        
        
        enum Brand: String, Describer, Codable, CaseIterable {
            case toplama
            case acer
            case aerocool
            case aidata
            case alienware
            case aopen
            case apple
            case arçelik
            case aremon
            case asrock
            case asus
            case avantron
            case beko
            case biggamex
            case blackview
            case casper
            case cbox
            case collect
            case compaq
            case crea
            case dell
            case dente
            case dragos
            case escort
            case esonic
            case exper
            case fujitsu
            case fujitsusiemens
            case gigabyte
            case grundig
            case hnc
            case hometech
            case hp
            case huawei
            case ibm
            case ilife
            case intel
            case izoly
            case keysmart
            case lenovo
            case microsoft
            case msi
            case ottoman
            case packard
            case pegasus
            case philips
            case powergate
            case pro2000
            case quadro
            case queen
            case raspberry
            case rogame
            case rotech
            case rowork
            case samsung
            case shuttle
            case snc
            case sony
            case technopc
            case turbox
            case vestel
            case viewsonic
            case warbox
            case xaser
            case zeiron
            case zotac
            
            
            func describe() -> String {
                switch self {
                case .toplama:            return "Toplama"
                case .acer:               return "Acer"
                case .aerocool:           return "Aerocool"
                case .aidata:             return "Aidata"
                case .alienware:          return "Alienware"
                case .aopen:              return "Aopen"
                case .apple:              return "Apple"
                case .arçelik:            return "Arçelik"
                case .aremon:             return "Aremon"
                case .asrock:             return "ASRock"
                case .asus:               return "Asus"
                case .avantron:           return "Avantron"
                case .beko:               return "Beko"
                case .biggamex:           return "BigGamex"
                case .blackview:          return "Blackview"
                case .casper:             return "Casper"
                case .cbox:               return "Cbox"
                case .collect:            return "Collect"
                case .compaq:             return "Compaq"
                case .crea:               return "Crea"
                case .dell:               return "Dell"
                case .dente:              return "Dente"
                case .dragos:             return "Dragos"
                case .escort:             return "Escort"
                case .esonic:             return "Esonic"
                case .exper:              return "Exper"
                case .fujitsu:            return "Fujitsu"
                case .fujitsusiemens:     return "Fujitsu Siemens"
                case .gigabyte:           return "Gigabyte"
                case .grundig:            return "Grundig"
                case .hnc:                return "HNC"
                case .hometech:           return "Hometech"
                case .hp:                 return "HP"
                case .huawei:             return "Huawei"
                case .ibm:                return "IBM"
                case .ilife:              return "I-Life"
                case .intel:              return "Intel"
                case .izoly:              return "Izoly"
                case .keysmart:           return "Keysmart"
                case .lenovo:             return "Lenovo"
                case .microsoft:          return "Microsoft"
                case .msi:                return "MSI"
                case .ottoman:            return "Ottoman Computer"
                case .packard:            return "Packard Bell"
                case .pegasus:            return "Pegasus"
                case .philips:            return "Philips"
                case .powergate:          return "PowerGate"
                case .pro2000:            return "Pro2000"
                case .quadro:             return "Quadro"
                case .queen:              return "Queen"
                case .raspberry:          return "Raspberry Pi"
                case .rogame:             return "Rogame"
                case .rotech:             return "Rotech"
                case .rowork:             return "Rowork"
                case .samsung:            return "Samsung"
                case .shuttle:            return "Shuttle"
                case .snc:                return "SNC"
                case .sony:               return "Sony"
                case .technopc:           return "Technopc"
                case .turbox:             return "Turbox"
                case .vestel:             return "Vestel"
                case .viewsonic:          return "ViewSonic"
                case .warbox:             return "Warbox"
                case .xaser:              return "Xaser"
                case .zeiron:             return "Zeiron"
                case .zotac:              return "Zotac"
                }
            }
            
        }
        
        
        
        enum Equipment: String, Describer, CaseIterable, Codable {
            case motherboard
            case ocpanel
            case processor
            case ram
            case harddiskinternal
            case ssdinternal
            case displaycard
            case soundcard
            case powersource
            case pckase
            case cddrive
            case dvddrive
            case bluray
            case networkcard
            case tvvideocard
            case fancooler
            case floppydiskdrive
            case pcicard
            case pciexpresscard
            case defectdetectcard
            case powersourcetest
            case lighting
            case mining
            
            func describe() -> String {
                switch self {
                case .motherboard:          return "Anakart"
                case .ocpanel:              return "OC Panel"
                case .processor:            return "İşlemci"
                case .ram:                  return "RAM Bellek"
                case .harddiskinternal:     return "Harddisk (Dahili)"
                case .ssdinternal:          return "SSD (Dahili)"
                case .displaycard:          return "Ekran Kartı"
                case .soundcard:            return "Ses Kartı"
                case .powersource:          return "Güç Kaynağı"
                case .pckase:               return "Kasa"
                case .cddrive:              return "CD Sürücü / Yazıcı"
                case .dvddrive:             return "DVD Sürücü / Yazıcı"
                case .bluray:               return "Blu-ray Sürücü / Yazıcı"
                case .networkcard:          return "Ağ Kartı"
                case .tvvideocard:          return "TV & Video Kartı"
                case .fancooler:            return "Fan & Soğutucu"
                case .floppydiskdrive:      return "Disket Sürücü"
                case .pcicard:              return "PCI Kartlar"
                case .pciexpresscard:       return "PCI Express Kartlar"
                case .defectdetectcard:     return "Arıza Tespit Kartı"
                case .powersourcetest:      return "Güç Kaynağı Test Cihazı"
                case .lighting:             return "Işıklandırma"
                case .mining:               return "Mining Ekipmanları"
                    
                }
            }
        }
    }
    
}



extension ElectronicProductEnvironment.DesktopEnvironment {
    enum CaseType: String, Describer, CaseIterable, Codable {
        case vertical
        case horizontal
        case allinone
        case minipc
        case onecard
        case htpccube
        case htpcslim
        case stickpc
        case terminal
        
        func describe() -> String {
            switch self {
            case .vertical:             return "Dikey (Tower)"
            case .horizontal:           return "Yatay"
            case .allinone:             return "All-in-One"
            case .minipc:               return "Mini PC"
            case .onecard:              return "Tek Kartlı (SBC)"
            case .htpccube:             return "HTPC Cube (Kare)"
            case .htpcslim:             return "HTPC Slim (Mini)"
            case .stickpc:              return "Stick PC"
            case .terminal:             return "Terminal (Client)"
            }
        }
        
    }
}
