//
//  PhoneEnvironment.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 27.08.2024.
//

import Foundation

extension ElectronicProductEnvironment {
    struct PhoneEnvironment {
        
        enum ProductType: String, CaseIterable, Codable, CategoryImplementer {
            static func allData() -> [String : Any] {
                return ProductType.allCases.reduce(into: [String: Any]()) { partialResult, product in
                    partialResult[product.describe()] = product.getChilds()
                }
            }
            
            static func provideData() -> [String : Any] {
                [:]
            }
            
            func getChilds() -> [String : Any] {
                switch self {
                case .models:
                    return Brand.allCases.reduce(into: [String: Any]()) { partialResult, brand in
                        partialResult[brand.describe()] = brand.getChilds()
                    }
                case .accessories:
                    return Accesories.allCases.reduce(into: [String: Any]()) { partialResult, accessories in
                        partialResult[accessories.describe()] = Finalizer.phoneaccessories
                    }
                case .replacementpart:
                    return ReplacementPart.allCases.reduce(into: [String: Any]()) { partialResult, replacementpart in
                        partialResult[replacementpart.describe()] = Finalizer.phonereplacementpart
                    }
                case .operators:
                    return Operators.allCases.reduce(into: [String: Any]()) { partialResult, operators in
                        partialResult[operators.describe()] = Finalizer.phoneoperators
                    }
                case .wearingtech:
                    return WearableTechnology.allCases.reduce(into: [String: Any]()) { partialResult, wearabletech in
                        partialResult[wearabletech.describe()] = wearabletech.getChilds()
                    }
                }
            }
            
            case models
            case accessories
            case replacementpart
            case operators
            case wearingtech
            
            func describe() -> String {
                switch self {
                case .models:             return "Modeller"
                case .accessories:        return "Aksesuarlar"
                case .replacementpart:    return "Yedek Parça"
                case .operators:          return "Numara"
                case .wearingtech:        return "Giyilebilir Teknoloji"
                }
            }
        }
        
        enum Accesories: String, Describer, Codable, CaseIterable {
            case bluetoothheadset
            case wiredheadphone
            case cover
            case screenprotector
            case charger
            case cableapparatus
            case converterconverter
            case incarholder
            case dockstand
            case memorycard
            case lid
            case modulecamera
            case lens
            case airtag
            case bluetoothproducts
            case selfiestick
            case emptybox
            case smartkey
            case speakerexternal
            case penstylus
            case maintenancerepairproducts
            case modelmobilephone
            case signalbooster
            case sticker
            case bulksale
            
            func describe() -> String {
                switch self {
                case .bluetoothheadset:             return "Bluetooth Kulaklık"
                case .wiredheadphone:               return "Kablolu Kulaklık"
                case .cover:                        return "Kılıf"
                case .screenprotector:              return "Ekran Koruyucu"
                case .charger:                      return "Şarj Cihazı"
                case .cableapparatus:               return "Kablo & Aparat"
                case .converterconverter:           return "Çevirici & Dönüştürücü"
                case .incarholder:                  return "Araç İçi Tutucu"
                case .dockstand:                    return "Dock & Stand"
                case .memorycard:                   return "Hafıza Kartı"
                case .lid:                          return "Kapak"
                case .modulecamera:                 return "Modül Kamera"
                case .lens:                         return "Lens"
                case .airtag:                       return "AirTag"
                case .bluetoothproducts:            return "Bluetooth Ürünler"
                case .selfiestick:                  return "Selfie Çubuğu"
                case .emptybox:                     return "Boş Kutu"
                case .smartkey:                     return "Akıllı Tuş"
                case .speakerexternal:              return "Hoparlör (Harici)"
                case .penstylus:                    return "Kalem (Stylus)"
                case .maintenancerepairproducts:    return "Bakım & Onarım Ürünleri"
                case .modelmobilephone:             return "Maket Cep Telefonu"
                case .signalbooster:                return "Sinyal Güçlendirici"
                case .sticker:                      return "Sticker (Çıkartma)"
                case .bulksale:                     return "Toplu Satış"
                }
            }
        }
        
        enum ReplacementPart: String, Describer, CaseIterable, Codable {
            case faultymobilephone
            case motherboard
            case antenna
            case battery
            case builtinflash
            case internalspeakerheadphone
            case builtincamera
            case internalmicrophone
            case screen
            case flexcable
            case casecover
            case simcardslot
            case socket
            case vibrationmotor
            case key
            case bulksale
            
            func describe() -> String {
                switch self {
                case .faultymobilephone:            return "Arızalı Cep Telefonu"
                case .motherboard:                  return "Anakart"
                case .antenna:                      return "Anten"
                case .battery:                      return "Batarya"
                case .builtinflash:                 return "Dahili Flaş"
                case .internalspeakerheadphone:     return "Dahili Hoparlör / Kulaklık"
                case .builtincamera:                return "Dahili Kamera"
                case .internalmicrophone:           return "Dahili Mikrofon"
                case .screen:                       return "Ekran"
                case .flexcable:                    return "Fleks Kablo"
                case .casecover:                    return "Kasa / Kapak"
                case .simcardslot:                  return "SIM Kart Yuvası"
                case .socket:                       return "Soket"
                case .vibrationmotor:               return "Titreşim Motoru"
                case .key:                          return "Tuş"
                case .bulksale:                     return "Toplu Satış"
                }
            }
        }
    
        enum Operators: String, Describer, CaseIterable, Codable {
            case netgsm
            case turkcell
            case türktelekom
            case vodafone
            case sabithat
            case taraftarnumarası
            
            func describe() -> String {
                switch self {
                case .netgsm:                       return "Netgsm"
                case .turkcell:                     return "Turkcell"
                case .türktelekom:                  return "Türk Telekom"
                case .vodafone:                     return "Vodafone"
                case .sabithat:                     return "Sabit Hat"
                case .taraftarnumarası:             return "Taraftar Numarası"
                }
            }
        }
        
        enum WearableTechnology: String, Describer, CaseIterable, Codable, CategoryImplementer {
            static func allData() -> [String : Any] {
                return WearableTechnology.allCases.reduce(into: [String: Any]()) { partialResult, category in
                    partialResult[category.describe()] = category.getChilds()
                }
            }
            
            static func provideData() -> [String : Any] {
                [:]
            }
            
            func getChilds() -> [String : Any] {
                switch self {
                case .smartwatch:
                    return WearableTechnologyEnvironment.SmartWatch.allCases.reduce(into: [String: Any]()) { partialResult, brand in
                        partialResult[brand.describe()] = Finalizer.wearabletech
                    }
                case .smartbracelet:
                    return WearableTechnologyEnvironment.SmartBracelet.allCases.reduce(into: [String: Any]()) { partialResult, brand in
                        partialResult[brand.describe()] = Finalizer.wearabletech
                    }
                case .smartglasses:
                    return WearableTechnologyEnvironment.SmartBracelet.allCases.reduce(into: [String: Any]()) { partialResult, brand in
                        partialResult[brand.describe()] = Finalizer.wearabletech
                    }
                case .vrglasses:
                    return WearableTechnologyEnvironment.SmartBracelet.allCases.reduce(into: [String: Any]()) { partialResult, brand in
                        partialResult[brand.describe()] = Finalizer.wearabletech
                    }
                case .accessoriesspareparts:
                    return WearableTechnologyEnvironment.SmartBracelet.allCases.reduce(into: [String: Any]()) { partialResult, brand in
                        partialResult[brand.describe()] = Finalizer.wearabletech
                    }
                }
            }
            
            case smartwatch
            case smartbracelet
            case smartglasses
            case vrglasses
            case accessoriesspareparts
            
            func describe() -> String {
                switch self {
                case .smartwatch:                   return "Akıllı Saat"
                case .smartbracelet:                return "Akıllı Bileklik"
                case .smartglasses:                 return "Akıllı Gözlük"
                case .vrglasses:                    return "VR Gözlük"
                case .accessoriesspareparts:        return "Aksesuar & Yedek Parça"
                }
            }
            
            
        }
        
        struct WearableTechnologyEnvironment {
            
            enum SmartWatch: String, Describer, CaseIterable, Codable {
                case afc
                case alcatel
                case amazfit
                case applewatch
                case appscomm
                case bilicra
                case casio
                case citizen
                case diesel
                case dijikid
                case emporioarmani
                case fitbit
                case fossil
                case frederiqueconstant
                case garmin
                case google
                case honor
                case huawei
                case kingboss
                case kingwear
                case kospet
                case lemfo
                case lg
                case linktech
                case mibro
                case michaelkors
                case mobvoiticwatch
                case montblanc
                case onewatch
                case oppo
                case polar
                case powerwatch
                case qcy
                case quark
                case reebok
                case reeder
                case robor
                case samsung
                case sony
                case suunto
                case swissmilitary
                case sword
                
                func describe() -> String {
                    switch self {
                    case .afc:                   return "AFC"
                    case .alcatel:               return "Alcatel"
                    case .amazfit:               return "Amazfit"
                    case .applewatch:            return "Apple Watch"
                    case .appscomm:              return "Appscomm"
                    case .bilicra:               return "Bilicra"
                    case .casio:                 return "Casio"
                    case .citizen:               return "Citizen"
                    case .diesel:                return "Diesel"
                    case .dijikid:               return "Dijikid"
                    case .emporioarmani:         return "Emporio Armani"
                    case .fitbit:                return "Fitbit"
                    case .fossil:                return "Fossil"
                    case .frederiqueconstant:    return "Frederique Constant"
                    case .garmin:                return "Garmin"
                    case .google:                return "Google"
                    case .honor:                 return "Honor"
                    case .huawei:                return "Huawei"
                    case .kingboss:              return "Kingboss"
                    case .kingwear:              return "Kingwear"
                    case .kospet:                return "Kospet"
                    case .lemfo:                 return "Lemfo"
                    case .lg:                    return "LG"
                    case .linktech:              return "LinkTech"
                    case .mibro:                 return "Mibro"
                    case .michaelkors:           return "Michael Kors"
                    case .mobvoiticwatch:        return "Mobvoi Ticwatch"
                    case .montblanc:             return "Montblanc"
                    case .onewatch:              return "One Watch"
                    case .oppo:                  return "Oppo"
                    case .polar:                 return "Polar"
                    case .powerwatch:            return "Powerwatch"
                    case .qcy:                   return "QCY"
                    case .quark:                 return "Quark"
                    case .reebok:                return "Reebok"
                    case .reeder:                return "Reeder"
                    case .robor:                 return "Robor"
                    case .samsung:               return "Samsung"
                    case .sony:                  return "Sony"
                    case .suunto:                return "Suunto"
                    case .swissmilitary:         return "Swiss Military"
                    case .sword:                 return "Sword"
                    }
                }
            }
            
            enum SmartBracelet: String, Describer, CaseIterable, Codable {
                case other
                
                func describe() -> String {
                    switch self {
                    case .other:                return "Diğer"
                    }
                }
            }
            
            enum SmartGlasses: String, Describer, CaseIterable, Codable {
                case other
                
                func describe() -> String {
                    switch self {
                    case .other:                return "Diğer"
                    }
                }
            }
        
            enum VRGlasses: String, Describer, CaseIterable, Codable {
                case other
                
                func describe() -> String {
                    switch self {
                    case .other:                return "Diğer"
                    }
                }
            }
    
            enum AccessoriesSpareParts: String, Describer, CaseIterable, Codable {
                case other
                
                func describe() -> String {
                    switch self {
                    case .other:                return "Diğer"
                    }
                }
            }
        }
        
        enum Brand: String, Describer, CaseIterable, Codable, CategoryImplementer {
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
                case .acer:
                    return Acer.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .agm:
                    return Agm.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .alcatel:
                    return Alcatel.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .apple:
                    return Apple.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .aselsan:
                    return Aselsan.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .asus:
                    return Asus.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .aveatürktelekom:
                    return Aveatürktelekom.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .benqsiemens:
                    return Benqsiemens.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .blackberry:
                    return Blackberry.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .blackview:
                    return Blackview.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .casper:
                    return Casper.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .cat:
                    return Cat.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .concord:
                    return Concord.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .cubot:
                    return Cubot.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .digiphone:
                    return Digiphone.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .doogee:
                    return Doogee.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .elephone:
                    return Elephone.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .escort:
                    return Escort.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .fossibot:
                    return Fossibot.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .generalmobile:
                    return Generalmobile.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .google:
                    return Google.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .haier:
                    return Haier.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .hiking:
                    return Hiking.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .honor:
                    return Honor.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .hotwav:
                    return Hotwav.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .hp:
                    return Hp.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .htc:
                    return Htc.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .huawei:
                    return Huawei.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .iiif150:
                    return Iiif150.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .infinix:
                    return Infinix.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .kaan:
                    return Kaan.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .lenovo:
                    return Lenovo.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .letvleeco:
                    return Letvleeco.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .lg:
                    return Lg.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .meizu:
                    return Meizu.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .microsoft:
                    return Microsoft.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .motorola:
                    return Motorola.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .nio:
                    return Nio.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .nokia:
                    return Nokia.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .nothing:
                    return Nothing.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .omix:
                    return Omix.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .oneplus:
                    return Oneplus.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .oppo:
                    return Oppo.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .oukitel:
                    return Oukitel.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .ovion:
                    return Ovion.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .palm:
                    return Palm.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .panasonic:
                    return Panasonic.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .philips:
                    return Philips.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .piranha:
                    return Piranha.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .preo:
                    return Preo.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .qin:
                    return Qin.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .quatro:
                    return Quatro.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .razer:
                    return Razer.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .realme:
                    return Realme.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .reeder:
                    return Reeder.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .royole:
                    return Royole.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .samsung:
                    return Samsung.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .sharp:
                    return Sharp.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .sony:
                    return Sony.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .sonyericsson:
                    return Sonyericsson.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .tagheuer:
                    return Tagheuer.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .tcl:
                    return Tcl.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .tecno:
                    return Tecno.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .tplink:
                    return Tplink.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .trident:
                    return Trident.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .turkcell:
                    return Turkcell.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .ulefone:
                    return Ulefone.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .umidigi:
                    return Umidigi.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .unihertz:
                    return Unihertz.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .vertu:
                    return Vertu.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .vestel:
                    return Vestel.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .vivo:
                    return Vivo.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .vodafone:
                    return Vodafone.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .xiaomi:
                    return Xiaomi.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .xor:
                    return Xor.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .yota:
                    return Yota.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .zte:
                    return Zte.allCases.reduce(into: [String: Any]()) { partialResult, model in
                        partialResult[model.describe()] = Finalizer.phone
                    }
                case .toplusatış:
                    return [ Finalizer.phone.rawValue : Finalizer.phone ]
                case .other:
                    return [ Finalizer.phone.rawValue : Finalizer.phone ]
                }
            }
            
            
            case acer
            case agm
            case alcatel
            case apple
            case aselsan
            case asus
            case aveatürktelekom
            case benqsiemens
            case blackberry
            case blackview
            case casper
            case cat
            case concord
            case cubot
            case digiphone
            case doogee
            case elephone
            case escort
            case fossibot
            case generalmobile
            case google
            case haier
            case hiking
            case honor
            case hotwav
            case hp
            case htc
            case huawei
            case iiif150
            case infinix
            case kaan
            case lenovo
            case letvleeco
            case lg
            case meizu
            case microsoft
            case motorola
            case nio
            case nokia
            case nothing
            case omix
            case oneplus
            case oppo
            case oukitel
            case ovion
            case palm
            case panasonic
            case philips
            case piranha
            case preo
            case qin
            case quatro
            case razer
            case realme
            case reeder
            case royole
            case samsung
            case sharp
            case sony
            case sonyericsson
            case tagheuer
            case tcl
            case tecno
            case tplink
            case trident
            case turkcell
            case ulefone
            case umidigi
            case unihertz
            case vertu
            case vestel
            case vivo
            case vodafone
            case xiaomi
            case xor
            case yota
            case zte
            case toplusatış
            case other
            
            func describe() -> String {
                switch self {
                case .acer:                                         return "Acer"
                case .agm:                                          return "AGM"
                case .alcatel:                                      return "Alcatel"
                case .apple:                                        return "Apple"
                case .aselsan:                                      return "Aselsan"
                case .asus:                                         return "Asus"
                case .aveatürktelekom:                              return "Avea Türk Telekom"
                case .benqsiemens:                                  return "BenQ Siemens"
                case .blackberry:                                   return "BlackBerry"
                case .blackview:                                    return "Blackview"
                case .casper:                                       return "Casper"
                case .cat:                                          return "CAT"
                case .concord:                                      return "Concord"
                case .cubot:                                        return "Cubot"
                case .digiphone:                                    return "Digiphone"
                case .doogee:                                       return "Doogee"
                case .elephone:                                     return "Elephone"
                case .escort:                                       return "Escort"
                case .fossibot:                                     return "Fossibot"
                case .generalmobile:                                return "General Mobile"
                case .google:                                       return "Google"
                case .haier:                                        return "Haier"
                case .hiking:                                       return "Hiking"
                case .honor:                                        return "Honor"
                case .hotwav:                                       return "Hotwav"
                case .hp:                                           return "HP"
                case .htc:                                          return "HTC"
                case .huawei:                                       return "Huawei"
                case .iiif150:                                      return "IIIF150"
                case .infinix:                                      return "Infinix"
                case .kaan:                                         return "Kaan"
                case .lenovo:                                       return "Lenovo"
                case .letvleeco:                                    return "LeTV LeEco"
                case .lg:                                           return "LG"
                case .meizu:                                        return "Meizu"
                case .microsoft:                                    return "Microsoft"
                case .motorola:                                     return "Motorola"
                case .nio:                                          return "NIO"
                case .nokia:                                        return "Nokia"
                case .nothing:                                      return "Nothing"
                case .omix:                                         return "Omix"
                case .oneplus:                                      return "OnePlus"
                case .oppo:                                         return "Oppo"
                case .oukitel:                                      return "Oukitel"
                case .ovion:                                        return "Ovion"
                case .palm:                                         return "Palm"
                case .panasonic:                                    return "Panasonic"
                case .philips:                                      return "Philips"
                case .piranha:                                      return "Piranha"
                case .preo:                                         return "Preo"
                case .qin:                                          return "Qin"
                case .quatro:                                       return "Quatro"
                case .razer:                                        return "Razer"
                case .realme:                                       return "Realme"
                case .reeder:                                       return "Reeder"
                case .royole:                                       return "Royole"
                case .samsung:                                      return "Samsung"
                case .sharp:                                        return "Sharp"
                case .sony:                                         return "Sony"
                case .sonyericsson:                                 return "Sony Ericsson"
                case .tagheuer:                                     return "Tag Heuer"
                case .tcl:                                          return "TCL"
                case .tecno:                                        return "Tecno"
                case .tplink:                                       return "TP-Link"
                case .trident:                                      return "Trident"
                case .turkcell:                                     return "Turkcell"
                case .ulefone:                                      return "Ulefone"
                case .umidigi:                                      return "Umidigi"
                case .unihertz:                                     return "Unihertz"
                case .vertu:                                        return "Vertu"
                case .vestel:                                       return "Vestel"
                case .vivo:                                         return "Vivo"
                case .vodafone:                                     return "Vodafone"
                case .xiaomi:                                       return "Xiaomi"
                case .xor:                                          return "XOR"
                case .yota:                                         return "Yota"
                case .zte:                                          return "ZTE"
                case .toplusatış:                                   return "Toplu Satış"
                case .other:                                        return "Diğer"
                }
            }
        }
        
        
        
        
        
        enum Acer: String, Describer, CaseIterable, Codable {
            case betouche200
            
            func describe() -> String {
                switch self {
                case .betouche200:                                  return "BeTouch E200"
                }
            }
        }
        
        enum Agm: String, Describer, CaseIterable, Codable {
            case g2guardian
            
            func describe() -> String {
                switch self {
                case .g2guardian:                                   return "G2 Guardian"
                }
            }
        }

        enum Alcatel: String, Describer, CaseIterable, Codable {
            case modal1
            case modal1s
            case modal35052y
            case modal3v
            case modal3x2019
            case modal3x2020
            case modal5
            case modal1066d
            case modal2020x
            case modal2057d
            case modal3088
            case a3
            case idol2s
            case mandarinaduckmoon
            case onetouch2007
            case onetouch2008g
            case onetouch2010
            case onetouch2012
            case onetouch835
            case onetoucheasy
            case onetouchpocket
            case ot808
            case ot880
            case otv570
            case pop4s
            case shinelite
            case x1
            case yahoo

            func describe() -> String {
                switch self {
                case .modal1:                 return "1"
                case .modal1s:                return "1s"
                case .modal35052y:            return "3 (5052Y)"
                case .modal3v:                return "3v"
                case .modal3x2019:            return "3X (2019)"
                case .modal3x2020:            return "3X (2020)"
                case .modal5:                 return "5"
                case .modal1066d:             return "1066D"
                case .modal2020x:             return "2020 X"
                case .modal2057d:             return "2057D"
                case .modal3088:              return "3088"
                case .a3:                     return "A3"
                case .idol2s:                 return "Idol 2 S"
                case .mandarinaduckmoon:      return "Mandarina Duck Moon"
                case .onetouch2007:           return "One Touch 2007"
                case .onetouch2008g:          return "One Touch 2008G"
                case .onetouch2010:           return "One Touch 2010"
                case .onetouch2012:           return "One Touch 2012"
                case .onetouch835:            return "One Touch 835"
                case .onetoucheasy:           return "One Touch Easy"
                case .onetouchpocket:         return "One Touch Pocket"
                case .ot808:                  return "OT-808"
                case .ot880:                  return "OT-880"
                case .otv570:                 return "OT-V570"
                case .pop4s:                  return "Pop 4S"
                case .shinelite:              return "Shine Lite"
                case .x1:                     return "X1"
                case .yahoo:                  return "Yahoo"
                }
            }
        }
        
        enum Apple: String, Describer, CaseIterable, Codable {
            case iphone2g
            case iphone3g
            case iphone3gs
            case iphone4
            case iphone4s
            case iphone5
            case iphone5s
            case iphone5c
            case iphone6
            case iphone6plus
            case iphone6s
            case iphone6splus
            case iphonese1nesil
            case iphonese2nesil
            case iphonese3nesil
            case iphone7
            case iphone7plus
            case iphone8
            case iphone8plus
            case iphonex
            case iphonexs
            case iphonexsmax
            case iphonexr
            case iphone11
            case iphone11pro
            case iphone11promax
            case iphone12
            case iphone12mini
            case iphone12pro
            case iphone12promax
            case iphone13
            case iphone13mini
            case iphone13pro
            case iphone13promax
            case iphone14
            case iphone14plus
            case iphone14pro
            case iphone14promax
            case iphone15
            case iphone15plus
            case iphone15pro
            case iphone15promax
            
            func describe() -> String {
                switch self {
                case .iphone2g:             return "iPhone 2G"
                case .iphone3g:             return "iPhone 3G"
                case .iphone3gs:            return "iPhone 3GS"
                case .iphone4:              return "iPhone 4"
                case .iphone4s:             return "iPhone 4S"
                case .iphone5:              return "iPhone 5"
                case .iphone5s:             return "iPhone 5S"
                case .iphone5c:             return "iPhone 5C"
                case .iphone6:              return "iPhone 6"
                case .iphone6plus:          return "iPhone 6 Plus"
                case .iphone6s:             return "iPhone 6S"
                case .iphone6splus:         return "iPhone 6S Plus"
                case .iphonese1nesil:       return "iPhone SE (1. Nesil)"
                case .iphonese2nesil:       return "iPhone SE (2. Nesil)"
                case .iphonese3nesil:       return "iPhone SE (3. Nesil)"
                case .iphone7:              return "iPhone 7"
                case .iphone7plus:          return "iPhone 7 Plus"
                case .iphone8:              return "iPhone 8"
                case .iphone8plus:          return "iPhone 8 Plus"
                case .iphonex:              return "iPhone X"
                case .iphonexs:             return "iPhone XS"
                case .iphonexsmax:          return "iPhone XS Max"
                case .iphonexr:             return "iPhone XR"
                case .iphone11:             return "iPhone 11"
                case .iphone11pro:          return "iPhone 11 Pro"
                case .iphone11promax:       return "iPhone 11 Pro Max"
                case .iphone12:             return "iPhone 12"
                case .iphone12mini:         return "iPhone 12 Mini"
                case .iphone12pro:          return "iPhone 12 Pro"
                case .iphone12promax:       return "iPhone 12 Pro Max"
                case .iphone13:             return "iPhone 13"
                case .iphone13mini:         return "iPhone 13 Mini"
                case .iphone13pro:          return "iPhone 13 Pro"
                case .iphone13promax:       return "iPhone 13 Pro Max"
                case .iphone14:             return "iPhone 14"
                case .iphone14plus:         return "iPhone 14 Plus"
                case .iphone14pro:          return "iPhone 14 Pro"
                case .iphone14promax:       return "iPhone 14 Pro Max"
                case .iphone15:             return "iPhone 15"
                case .iphone15plus:         return "iPhone 15 Plus"
                case .iphone15pro:          return "iPhone 15 Pro"
                case .iphone15promax:       return "iPhone 15 Pro Max"
                }
            }
        }
        
        enum Aselsan: String, Describer, CaseIterable, Codable {
            case modal1919
            case modal1920
            
            func describe() -> String {
                switch self {
                case .modal1919:           return "1919"
                case .modal1920:           return "1920"
                }
            }
        }
        
        enum Asus: String, Describer, CaseIterable, Codable {
            case garminasusnuvifonem20
            case p526
            case rogphoneiizs660kl
            case rogphone3strix
            case rogphone3zs661ks
            case rogphone5
            case rogphone5s
            case rogphone6
            case rogphone6d
            case rogphone6dultimate
            case rogphone6pro
            case rogphone7
            case rogphone8
            case rogphone8pro
            case zenfone2
            case zenfone2laser
            case zenfone3maxzc520tl
            case zenfone3smaxzc521tl
            case zenfone3zoomze553kl
            case zenfone4
            case zenfone4maxpluszc554kl
            case zenfone4maxzc554kl
            case zenfone4selfielitezb553kl
            case zenfone5
            case zenfone5litea502cg
            case zenfone5ze620kl
            case zenfone6
            case zenfone8flip
            case zenfone10
            case zenfone11ultra
            case zenfonegozb450kl
            case zenfonelivezb501kl
            case zenfonemaxzc550kl
            case zenfonemaxplusm1zb570tl
            case zenfonemaxplusm2zb634kl
            case zenfonemaxprom1zb601kl
            case zenfonemaxprom2zb631kl
            case zenfoneselfiezd551kl
            
            func describe() -> String {
                switch self {
                case .garminasusnuvifonem20:      return "Garmin-Asus nuvifone M20"
                case .p526:                       return "P526"
                case .rogphoneiizs660kl:          return "ROG Phone II ZS660KL"
                case .rogphone3strix:             return "ROG Phone 3 Strix"
                case .rogphone3zs661ks:           return "ROG Phone 3 ZS661KS"
                case .rogphone5:                  return "ROG Phone 5"
                case .rogphone5s:                 return "ROG Phone 5s"
                case .rogphone6:                  return "ROG Phone 6"
                case .rogphone6d:                 return "ROG Phone 6D"
                case .rogphone6dultimate:         return "ROG Phone 6D Ultimate"
                case .rogphone6pro:               return "ROG Phone 6 Pro"
                case .rogphone7:                  return "ROG Phone 7"
                case .rogphone8:                  return "ROG Phone 8"
                case .rogphone8pro:               return "ROG Phone 8 Pro"
                case .zenfone2:                   return "ZenFone 2"
                case .zenfone2laser:              return "ZenFone 2 Laser"
                case .zenfone3maxzc520tl:         return "Zenfone 3 Max ZC520TL"
                case .zenfone3smaxzc521tl:        return "Zenfone 3s Max ZC521TL"
                case .zenfone3zoomze553kl:        return "Zenfone 3 Zoom ZE553KL"
                case .zenfone4:                   return "ZenFone 4"
                case .zenfone4maxpluszc554kl:     return "Zenfone 4 Max Plus ZC554KL"
                case .zenfone4maxzc554kl:         return "Zenfone 4 Max ZC554KL"
                case .zenfone4selfielitezb553kl:  return "Zenfone 4 Selfie Lite ZB553KL"
                case .zenfone5:                   return "ZenFone 5"
                case .zenfone5litea502cg:         return "ZenFone 5 Lite A502CG"
                case .zenfone5ze620kl:            return "Zenfone 5 ZE620KL"
                case .zenfone6:                   return "ZenFone 6"
                case .zenfone8flip:               return "Zenfone 8 Flip"
                case .zenfone10:                  return "Zenfone 10"
                case .zenfone11ultra:             return "Zenfone 11 Ultra"
                case .zenfonegozb450kl:           return "Zenfone Go ZB450KL"
                case .zenfonelivezb501kl:         return "Zenfone Live ZB501KL"
                case .zenfonemaxzc550kl:          return "ZenFone Max ZC550KL"
                case .zenfonemaxplusm1zb570tl:    return "Zenfone Max Plus (M1) ZB570TL"
                case .zenfonemaxplusm2zb634kl:    return "Zenfone Max Plus (M2) ZB634KL"
                case .zenfonemaxprom1zb601kl:     return "Zenfone Max Pro (M1) ZB601KL"
                case .zenfonemaxprom2zb631kl:     return "Zenfone Max Pro (M2) ZB631KL"
                case .zenfoneselfiezd551kl:       return "ZenFone Selfie ZD551KL"
                }
            }
        }
        
        enum Aveatürktelekom: String, Describer, CaseIterable, Codable {
            case intouch2
            case intouch4
            case tt175
            
            func describe() -> String {
                switch self {
                case .intouch2:                   return "inTouch 2"
                case .intouch4:                   return "inTouch 4"
                case .tt175:                      return "TT175"
                }
            }
        }
                
        enum Benqsiemens: String, Describer, CaseIterable, Codable {
            case a38
            case a52
            case a60
            case a70
            case af51
            case c25
            case c55
            case c65
            case c72
            case c75
            case cf61
            case cf110
            case cl71
            case cl75
            case cx65
            case cx75
            case e61
            case e71
            case ef71
            case ef81
            case el71
            case m55
            case m65
            case m75
            case m300
            case mc60
            case me45
            case p50
            case s3
            case s7
            case s25
            case s55
            case s65
            case s75
            case s88
            case sl45
            case sl45i
            case sl55
            case sl75
            case st60
            case sx1
            case sx45
            case sxg75
            case t33
            case xelibri2
            case other

            func describe() -> String {
                switch self {
                case .a38:               return "A38"
                case .a52:               return "A52"
                case .a60:               return "A60"
                case .a70:               return "A70"
                case .af51:              return "AF51"
                case .c25:               return "C25"
                case .c55:               return "C55"
                case .c65:               return "C65"
                case .c72:               return "C72"
                case .c75:               return "C75"
                case .cf61:              return "CF61"
                case .cf110:             return "CF110"
                case .cl71:              return "CL71"
                case .cl75:              return "CL75"
                case .cx65:              return "CX65"
                case .cx75:              return "CX75"
                case .e61:               return "E61"
                case .e71:               return "E71"
                case .ef71:              return "EF71"
                case .ef81:              return "EF81"
                case .el71:              return "EL71"
                case .m55:               return "M55"
                case .m65:               return "M65"
                case .m75:               return "M75"
                case .m300:              return "M300"
                case .mc60:              return "MC60"
                case .me45:              return "ME45"
                case .p50:               return "P50"
                case .s3:                return "S3"
                case .s7:                return "S7"
                case .s25:               return "S25"
                case .s55:               return "S55"
                case .s65:               return "S65"
                case .s75:               return "S75"
                case .s88:               return "S88"
                case .sl45:              return "SL45"
                case .sl45i:             return "SL45i"
                case .sl55:              return "SL55"
                case .sl75:              return "SL75"
                case .st60:              return "ST60"
                case .sx1:               return "SX1"
                case .sx45:              return "SX45"
                case .sxg75:             return "SXG75"
                case .t33:               return "T33"
                case .xelibri2:          return "Xelibri 2"
                case .other:             return "Diğer"
                }
            }
        }
        
        enum Blackberry: String, Describer, CaseIterable, Codable {
            case modal7100g
            case modal7130g
            case modal8100
            case modal8110pearl
            case modal8220pearlflip
            case modal8320curve
            case modal8520curve
            case modal8700g
            case modal8820
            case modal9000bold
            case modal9220curve
            case modal9300curve
            case modal9320curve
            case modal9360curve
            case modal9380curve
            case modal9500storm
            case modal9700bold
            case modal9720
            case modal9780bold
            case modal9790bold
            case modal9800torch
            case modal9860torch
            case modal9900bold
            case classicq20
            case dtek50
            case keyone
            case key2
            case key2le
            case p9981porschedesign
            case p9982porschedesign
            case p9983porschedesign
            case passport
            case priv
            case q5
            case q10
            case z10
            case z30
            
            func describe() -> String {
                switch self {
                case .modal7100g:            return "7100G"
                case .modal7130g:            return "7130G"
                case .modal8100:             return "8100"
                case .modal8110pearl:        return "8110 Pearl"
                case .modal8220pearlflip:    return "8220 Pearl Flip"
                case .modal8320curve:        return "8320 Curve"
                case .modal8520curve:        return "8520 Curve"
                case .modal8700g:            return "8700G"
                case .modal8820:             return "8820"
                case .modal9000bold:         return "9000 Bold"
                case .modal9220curve:        return "9220 Curve"
                case .modal9300curve:        return "9300 Curve"
                case .modal9320curve:        return "9320 Curve"
                case .modal9360curve:        return "9360 Curve"
                case .modal9380curve:        return "9380 Curve"
                case .modal9500storm:        return "9500 Storm"
                case .modal9700bold:         return "9700 Bold"
                case .modal9720:             return "9720"
                case .modal9780bold:         return "9780 Bold"
                case .modal9790bold:         return "9790 Bold"
                case .modal9800torch:        return "9800 Torch"
                case .modal9860torch:        return "9860 Torch"
                case .modal9900bold:         return "9900 Bold"
                case .classicq20:            return "Classic Q20"
                case .dtek50:                return "DTEK50"
                case .keyone:                return "Keyone"
                case .key2:                  return "Key2"
                case .key2le:                return "Key2 LE"
                case .p9981porschedesign:    return "P9981 Porsche Design"
                case .p9982porschedesign:    return "P9982 Porsche Design"
                case .p9983porschedesign:    return "P9983 Porsche Design"
                case .passport:              return "Passport"
                case .priv:                  return "Priv"
                case .q5:                    return "Q5"
                case .q10:                   return "Q10"
                case .z10:                   return "Z10"
                case .z30:                   return "Z30"
                }
            }
        }
    
        enum Blackview: String, Describer, CaseIterable, Codable {
            case bl5000
            case bl6000pro
            case bl9000
            case bl9000pro
            case bv6200pro
            case bv6800pro
            case bv8800
            case bv8900
            case bv8900pro
            case bv9900pro
            case n6000
            case p10000pro
            
            func describe() -> String {
                switch self {
                case .bl5000:               return "BL5000"
                case .bl6000pro:            return "BL6000 Pro"
                case .bl9000:               return "BL9000"
                case .bl9000pro:            return "BL9000 Pro"
                case .bv6200pro:            return "BV6200 Pro"
                case .bv6800pro:            return "BV6800 Pro"
                case .bv8800:               return "BV8800"
                case .bv8900:               return "BV8900"
                case .bv8900pro:            return "BV8900 Pro"
                case .bv9900pro:            return "BV9900 Pro"
                case .n6000:                return "N6000"
                case .p10000pro:            return "P10000 Pro"
                }
            }
        }
        
        enum Casper: String, Describer, CaseIterable, Codable {
            case viaa1
            case viaa1plus
            case viaa2
            case viaa3
            case viaa3plus
            case viaa4
            case viaa40
            case viae1
            case viae2
            case viae3
            case viae30
            case viae30plus
            case viae4
            case viaf1
            case viaf2
            case viaf20
            case viaf3
            case viaf30
            case viaf30plus
            case viag1
            case viag1plus
            case viag3
            case viag4
            case viag5
            case viam1
            case viam2
            case viam3
            case viam4
            case viam30
            case viap2
            case viap3
            case vias
            case viav3
            case viav5
            case viav6
            case viav6x
            case viav9
            case viax20
            case viax30
            case viax30plus
            case viax40
            
            func describe() -> String {
                switch self {
                case .viaa1:              return "VIA A1"
                case .viaa1plus:          return "VIA A1 Plus"
                case .viaa2:              return "VIA A2"
                case .viaa3:              return "VIA A3"
                case .viaa3plus:          return "VIA A3 Plus"
                case .viaa4:              return "VIA A4"
                case .viaa40:             return "VIA A40"
                case .viae1:              return "VIA E1"
                case .viae2:              return "VIA E2"
                case .viae3:              return "VIA E3"
                case .viae30:             return "VIA E30"
                case .viae30plus:         return "VIA E30 Plus"
                case .viae4:              return "VIA E4"
                case .viaf1:              return "VIA F1"
                case .viaf2:              return "VIA F2"
                case .viaf20:             return "VIA F20"
                case .viaf3:              return "VIA F3"
                case .viaf30:             return "VIA F30"
                case .viaf30plus:         return "VIA F30 Plus"
                case .viag1:              return "VIA G1"
                case .viag1plus:          return "VIA G1 Plus"
                case .viag3:              return "VIA G3"
                case .viag4:              return "VIA G4"
                case .viag5:              return "VIA G5"
                case .viam1:              return "VIA M1"
                case .viam2:              return "VIA M2"
                case .viam3:              return "VIA M3"
                case .viam4:              return "VIA M4"
                case .viam30:             return "VIA M30"
                case .viap2:              return "VIA P2"
                case .viap3:              return "VIA P3"
                case .vias:               return "VIA S"
                case .viav3:              return "VIA V3"
                case .viav5:              return "VIA V5"
                case .viav6:              return "VIA V6"
                case .viav6x:             return "VIA V6x"
                case .viav9:              return "VIA V9"
                case .viax20:             return "VIA X20"
                case .viax30:             return "VIA X30"
                case .viax30plus:         return "VIA X30 Plus"
                case .viax40:             return "VIA X40"
                }
            }
        }
        
        enum Cat: String, Describer, CaseIterable, Codable {
            case b15
            case b25
            case b35
            case b40
            case s22flip
            case s42h
            case s53
            case s60
            case s61
            case s62pro
            case s75
            
            func describe() -> String {
                switch self {
                case .b15:               return "B15"
                case .b25:               return "B25"
                case .b35:               return "B35"
                case .b40:               return "B40"
                case .s22flip:           return "S22 Flip"
                case .s42h:              return "S42 H+"
                case .s53:               return "S53"
                case .s60:               return "S60"
                case .s61:               return "S61"
                case .s62pro:            return "S62 Pro"
                case .s75:               return "S75"
                }
            }
        }

        enum Concord: String, Describer, CaseIterable, Codable {
            case other
            
            func describe() -> String {
                switch self {
                case .other:             return "Diğer"
                }
            }
        }
        
        enum Cubot: String, Describer, CaseIterable, Codable {
            case kingkong7
            case kingkongax
            case kingkongmini3
            case kingkongpower
            case kingkongstar
            case x70
            
            func describe() -> String {
                switch self {
                case .kingkong7:         return "KingKong 7"
                case .kingkongax:        return "KingKong AX"
                case .kingkongmini3:     return "KingKong Mini 3"
                case .kingkongpower:     return "KingKong Power"
                case .kingkongstar:      return "KingKong Star"
                case .x70:               return "X70"
                }
            }
        }
        
        enum Digiphone: String, Describer, CaseIterable, Codable {
            case k700
            case other
            
            func describe() -> String {
                switch self {
                case .k700:              return "K700"
                case .other:             return "Diğer"
                }
            }
        }
    
        enum Doogee: String, Describer, CaseIterable, Codable {
            case dk10
            case s100
            case s100pro
            case s110
            case s35
            case s40
            case s59pro
            case s88plus
            case s88pro
            case s95pro
            case s96gt
            case s98
            case smini
            case v20
            case v20pro
            case v20s
            case v30
            case v30pro
            case v30t
            case v31gt
            case vmax
            case x5
            case other
            
            func describe() -> String {
                switch self {
                case .dk10:              return "DK10"
                case .s100:              return "S100"
                case .s100pro:           return "S100 Pro"
                case .s110:              return "S110"
                case .s35:               return "S 35"
                case .s40:               return "S40"
                case .s59pro:            return "S59 Pro"
                case .s88plus:           return "S88 Plus"
                case .s88pro:            return "S88 Pro"
                case .s95pro:            return "S95 Pro"
                case .s96gt:             return "S96 GT"
                case .s98:               return "S98"
                case .smini:             return "S mini"
                case .v20:               return "V20"
                case .v20pro:            return "V20 Pro"
                case .v20s:              return "V20S"
                case .v30:               return "V30"
                case .v30pro:            return "V30 Pro"
                case .v30t:              return "V30T"
                case .v31gt:             return "V31GT"
                case .vmax:              return "V Max"
                case .x5:                return "X5"
                case .other:             return "Diğer"
                }
            }
        }
        
        enum Elephone: String, Describer, CaseIterable, Codable {
            case p8
            case other
            func describe() -> String {
                switch self {
                case .p8:                return "P8"
                case .other:             return "Diğer"
                }
            }
        }
        
        enum Escort: String, Describer, CaseIterable, Codable {
            case other
            
            func describe() -> String {
                switch self {
                case .other:             return "Diğer"
                }
            }
        }
        
        enum Fossibot: String, Describer, CaseIterable, Codable {
            case f102
            
            func describe() -> String {
                switch self {
                case .f102:              return "F102"
                }
            }
        }
        
        enum Generalmobile: String, Describer, CaseIterable, Codable {
            case g4androidone
            case g4androidonedual
            case discovery
            case discovery2
            case discovery2mini
            case discoveryair
            case discoveryelite
            case dst01
            case dst10
            case dst12
            case dst250
            case dst350
            case dst500
            case dst1907fenerbahce
            case dst3gsmart
            case dstbusiness
            case dstdiamond
            case dstdiamondbar
            case dstsense
            case dstq100
            case dstq200
            case gm5
            case gm5plus
            case gm5plusd
            case gm6
            case gm6d
            case gm8
            case gm8go
            case gm9go
            case gm9plus
            case gm9pro
            case gm10
            case gm20
            case gm20pro
            case gm21
            case gm21plus
            case gm21pro
            case gm22
            case gm22plus
            case gm22pro
            case gm22s
            case gm23
            case gm23se
            case gm24pro
            case gmphoenix5g
            case other
            
            func describe() -> String {
                switch self {
                case .g4androidone:             return "4G Android One"
                case .g4androidonedual:         return "4G Android One Dual"
                case .discovery:                return "Discovery"
                case .discovery2:               return "Discovery 2"
                case .discovery2mini:           return "Discovery 2 Mini"
                case .discoveryair:             return "Discovery Air"
                case .discoveryelite:           return "Discovery Elite"
                case .dst01:                    return "DST 01"
                case .dst10:                    return "DST 10"
                case .dst12:                    return "DST 12"
                case .dst250:                   return "DST 250"
                case .dst350:                   return "DST 350"
                case .dst500:                   return "DST 500"
                case .dst1907fenerbahce:        return "DST 1907 Fenerbahçe"
                case .dst3gsmart:               return "DST 3G Smart"
                case .dstbusiness:              return "DST Business"
                case .dstdiamond:               return "DST Diamond"
                case .dstdiamondbar:            return "DST Diamond Bar"
                case .dstsense:                 return "DST Sense"
                case .dstq100:                  return "DST Q100"
                case .dstq200:                  return "DST Q200"
                case .gm5:                      return "GM 5"
                case .gm5plus:                  return "GM 5 Plus"
                case .gm5plusd:                 return "GM 5 Plus D"
                case .gm6:                      return "GM 6"
                case .gm6d:                     return "GM 6 D"
                case .gm8:                      return "GM 8"
                case .gm8go:                    return "GM 8 Go"
                case .gm9go:                    return "GM 9 Go"
                case .gm9plus:                  return "GM 9 Plus"
                case .gm9pro:                   return "GM 9 Pro"
                case .gm10:                     return "GM 10"
                case .gm20:                     return "GM 20"
                case .gm20pro:                  return "GM 20 Pro"
                case .gm21:                     return "GM 21"
                case .gm21plus:                 return "GM 21 Plus"
                case .gm21pro:                  return "GM 21 Pro"
                case .gm22:                     return "GM 22"
                case .gm22plus:                 return "GM 22 Plus"
                case .gm22pro:                  return "GM 22 Pro"
                case .gm22s:                    return "GM 22S"
                case .gm23:                     return "GM 23"
                case .gm23se:                   return "GM 23 SE"
                case .gm24pro:                  return "GM 24 Pro"
                case .gmphoenix5g:              return "GM Phoenix 5G"
                case .other:                    return "Diğer"
                }
            }
        }
        
        enum Google: String, Describer, CaseIterable, Codable {
            case pixelfold
            case pixelxl
            case pixel2xl
            case pixel3
            case pixel3a
            case pixel3xl
            case pixel4
            case pixel4a
            case pixel4a5g
            case pixel4xl
            case pixel5
            case pixel5a5g
            case pixel6
            case pixel6a
            case pixel6pro
            case pixel7
            case pixel7a
            case pixel7pro
            case pixel8
            case pixel8pro
            case pixel9proxl
            
            func describe() -> String {
                switch self {
                case .pixelfold:          return "Pixel Fold"
                case .pixelxl:            return "Pixel XL"
                case .pixel2xl:           return "Pixel 2 XL"
                case .pixel3:             return "Pixel 3"
                case .pixel3a:            return "Pixel 3a"
                case .pixel3xl:           return "Pixel 3 XL"
                case .pixel4:             return "Pixel 4"
                case .pixel4a:            return "Pixel 4a"
                case .pixel4a5g:          return "Pixel 4a 5G"
                case .pixel4xl:           return "Pixel 4 XL"
                case .pixel5:             return "Pixel 5"
                case .pixel5a5g:          return "Pixel 5a 5G"
                case .pixel6:             return "Pixel 6"
                case .pixel6a:            return "Pixel 6a"
                case .pixel6pro:          return "Pixel 6 Pro"
                case .pixel7:             return "Pixel 7"
                case .pixel7a:            return "Pixel 7a"
                case .pixel7pro:          return "Pixel 7 Pro"
                case .pixel8:             return "Pixel 8"
                case .pixel8pro:          return "Pixel 8 Pro"
                case .pixel9proxl:        return "Pixel 9 Pro XL"
                }
            }
        }
        
        enum Haier: String, Describer, CaseIterable, Codable {
            case w858
            
            func describe() -> String {
                switch self {
                case .w858:               return "W 858"
                }
            }
        }
        
        enum Hiking: String, Describer, CaseIterable, Codable {
            case a15
            case a19
            case a21
            case a22
            case a23
            case a26
            case a27
            case a28
            case a40
            case a41
            case a42
            case a43
            case a48
            case a50
            case x9
            case x11
            case other
            
            func describe() -> String {
                switch self {
                case .a15:              return "A15"
                case .a19:              return "A19"
                case .a21:              return "A21"
                case .a22:              return "A22"
                case .a23:              return "A23"
                case .a26:              return "A26"
                case .a27:              return "A27"
                case .a28:              return "A28"
                case .a40:              return "A40"
                case .a41:              return "A41"
                case .a42:              return "A42"
                case .a43:              return "A43"
                case .a48:              return "A48"
                case .a50:              return "A50"
                case .x9:               return "X9"
                case .x11:              return "X11"
                case .other:            return "Diğer"
                }
            }
        }
        
        enum Honor: String, Describer, CaseIterable, Codable {
            case model5xgr5
            case model6apro
            case model6x
            case model7
            case model7a
            case model7c
            case model7s
            case model8
            case model8a
            case model8c
            case model8pro
            case model8s
            case model8x
            case model9lite
            case model9x
            case model10
            case model10lite
            case model20
            case model20lite
            case model20pro
            case model30
            case model50
            case model70
            case model90
            case model90lite
            case model100pro
            case model200
            case model200pro
            case magic3pro
            case magic4pro
            case magic4ultimate
            case magic5pro
            case magic5ultimate
            case magic6pro
            case magic6rsrporschedesign
            case magic6ultimate
            case magicv2
            case magicv2rsrporschedesign
            case magicv3
            case magicvflip
            case magicvs
            case note10
            case play
            case vpurse
            case view20
            case x7a
            case x8
            case x9a
            case x9b
            case x10max
            
            func describe() -> String {
                switch self {
                case .model5xgr5:              return "5X (GR5)"
                case .model6apro:              return "6A (Pro)"
                case .model6x:                 return "6X"
                case .model7:                  return "7"
                case .model7a:                 return "7A"
                case .model7c:                 return "7C"
                case .model7s:                 return "7S"
                case .model8:                  return "8"
                case .model8a:                 return "8A"
                case .model8c:                 return "8C"
                case .model8pro:               return "8 Pro"
                case .model8s:                 return "8S"
                case .model8x:                 return "8X"
                case .model9lite:              return "9 Lite"
                case .model9x:                 return "9X"
                case .model10:                 return "10"
                case .model10lite:             return "10 Lite"
                case .model20:                 return "20"
                case .model20lite:             return "20 Lite"
                case .model20pro:              return "20 Pro"
                case .model30:                 return "30"
                case .model50:                 return "50"
                case .model70:                 return "70"
                case .model90:                 return "90"
                case .model90lite:             return "90 Lite"
                case .model100pro:             return "100 Pro"
                case .model200:                return "200"
                case .model200pro:             return "200 Pro"
                case .magic3pro:               return "Magic 3 Pro"
                case .magic4pro:               return "Magic 4 Pro"
                case .magic4ultimate:          return "Magic 4 Ultimate"
                case .magic5pro:               return "Magic 5 Pro"
                case .magic5ultimate:          return "Magic 5 Ultimate"
                case .magic6pro:               return "Magic 6 Pro"
                case .magic6rsrporschedesign:  return "Magic 6 RSR Porsche Design"
                case .magic6ultimate:          return "Magic 6 Ultimate"
                case .magicv2:                 return "Magic V2"
                case .magicv2rsrporschedesign: return "Magic V2 RSR Porsche Design"
                case .magicv3:                 return "Magic V3"
                case .magicvflip:              return "Magic V Flip"
                case .magicvs:                 return "Magic VS"
                case .note10:                  return "Note 10"
                case .play:                    return "Play"
                case .vpurse:                  return "V Purse"
                case .view20:                  return "View 20"
                case .x7a:                     return "X7A"
                case .x8:                      return "X8"
                case .x9a:                     return "X9a"
                case .x9b:                     return "X9b"
                case .x10max:                  return "X10 Max"
                }
            }
        }
        
        enum Hotwav: String, Describer, CaseIterable, Codable {
            case cyber13pro
            case cyberx
            case note13pro
            
            func describe() -> String {
                switch self {
                case .cyber13pro:               return "Cyber 13 Pro"
                case .cyberx:                   return "Cyber X"
                case .note13pro:                return "Note 13 Pro"
                }
            }
        }
        
        enum Hp: String, Describer, CaseIterable, Codable {
            case elitex3
            case hw6915
            case ipaq500
            case ipaq614c
            case ipaq6900
            case ipaqdatamessenger
            case rw6815
            case other
            
            func describe() -> String {
                switch self {
                case .elitex3:             return "Elite x3"
                case .hw6915:              return "HW 6915"
                case .ipaq500:             return "iPAQ 500"
                case .ipaq614c:            return "iPAQ 614c"
                case .ipaq6900:            return "iPAQ 6900"
                case .ipaqdatamessenger:   return "iPAQ Data Messenger"
                case .rw6815:              return "RW 6815"
                case .other:               return "Diğer"
                }
            }
        }
        
        enum Htc: String, Describer, CaseIterable, Codable {
            case advantagex7510
            case chacha
            case desire
            case desire20pro
            case desire320
            case desire500
            case desire526g
            case desire620g
            case desire626g
            case desire816
            case desire816gdualsim
            case desire820
            case desire820g
            case desire825
            case desire828
            case desire830
            case desireeye
            case desires
            case desiresv
            case desirez
            case explorer
            case incredibles
            case onem7
            case onem8
            case onem8s
            case onem9
            case onem9plus
            case onemini
            case ones9
            case onesv
            case onev
            case p4350
            case qteks200
            case sensation
            case sensationxe
            case touchp3450
            case toucht3333
            case touchdiamond2
            case touchpro
            case touchpro2
            case u11
            case u11plus
            case u11eyes
            case u12
            case uplay
            case uultra
            case wildfire
            case wildfires
            case windowsphone8srio
            case windowsphone8xaccord
            
            func describe() -> String {
                switch self {
                case .advantagex7510:       return "Advantage X7510"
                case .chacha:               return "ChaCha"
                case .desire:               return "Desire"
                case .desire20pro:          return "Desire 20 Pro"
                case .desire320:            return "Desire 320"
                case .desire500:            return "Desire 500"
                case .desire526g:           return "Desire 526G+"
                case .desire620g:           return "Desire 620G"
                case .desire626g:           return "Desire 626G"
                case .desire816:            return "Desire 816"
                case .desire816gdualsim:    return "Desire 816G dual sim"
                case .desire820:            return "Desire 820"
                case .desire820g:           return "Desire 820G+"
                case .desire825:            return "Desire 825"
                case .desire828:            return "Desire 828"
                case .desire830:            return "Desire 830"
                case .desireeye:            return "Desire Eye"
                case .desires:              return "Desire S"
                case .desiresv:             return "Desire SV"
                case .desirez:              return "Desire Z"
                case .explorer:             return "Explorer"
                case .incredibles:          return "Incredible S"
                case .onem7:                return "One M7"
                case .onem8:                return "One M8"
                case .onem8s:               return "One M8s"
                case .onem9:                return "One M9"
                case .onem9plus:            return "One M9+"
                case .onemini:              return "One Mini"
                case .ones9:                return "One S9"
                case .onesv:                return "One SV"
                case .onev:                 return "One V"
                case .p4350:                return "P4350"
                case .qteks200:             return "Qtek S200"
                case .sensation:            return "Sensation"
                case .sensationxe:          return "Sensation XE"
                case .touchp3450:           return "Touch (P3450)"
                case .toucht3333:           return "Touch 2 (T3333)"
                case .touchdiamond2:        return "Touch Diamond2"
                case .touchpro:             return "Touch Pro"
                case .touchpro2:            return "Touch Pro 2"
                case .u11:                  return "U11"
                case .u11plus:              return "U11+"
                case .u11eyes:              return "U11 Eyes"
                case .u12:                  return "U12+"
                case .uplay:                return "U Play"
                case .uultra:               return "U Ultra"
                case .wildfire:             return "Wildfire"
                case .wildfires:            return "Wildfire S"
                case .windowsphone8srio:    return "Windows Phone 8S Rio"
                case .windowsphone8xaccord: return "Windows Phone 8X Accord"
                }
            }
        }
        
        enum Huawei: String, Describer, CaseIterable, Codable {
            case ascendg6
            case ascendg7
            case ascendp7
            case ascendg500
            case ascendg610
            case ascendg700
            case ascendmate7
            case ascendmate8
            case ascendy300
            case enjoy7plus
            case g8
            case gr3
            case gr5
            case gr52017
            case gr5mini
            case gt3honor5c
            case mate9
            case mate9pro
            case mate10
            case mate10lite
            case mate10pro
            case mate20
            case mate20lite
            case mate20pro
            case mate20rsporschedesign
            case mate20x
            case mate30pro
            case mate40pro
            case mate40rsporschedesign
            case mate50
            case mate50pro
            case mate50rsporschedesign
            case mate60pro
            case mate60proplus
            case mate60rsultimate
            case matersporschedesign
            case mates
            case matexs
            case matexs2
            case matex3
            case matex5
            case nova
            case nova3ipsmart
            case nova5t
            case nova7i
            case nova8i
            case nova9
            case nova9se
            case nova10
            case nova10pro
            case nova10se
            case nova11
            case nova11pro
            case nova12s
            case novaplus
            case novay70
            case novay90
            case novay91
            case p8
            case p8lite
            case p8lite2017
            case p8max
            case p9
            case p9lite
            case p9lite2017
            case p9litemini
            case p10
            case p10lite
            case p10plus
            case p20
            case p20lite
            case p20pro
            case p30
            case p30lite
            case p30pro
            case p40
            case p40lite
            case p40litee
            case p40pro
            case p40proplus
            case p50pocket
            case p50pro
            case p60art
            case p60pro
            case pocket2
            case psmart
            case psmart2019
            case psmart2021
            case psmartpro
            case psmarts
            case psmartz
            case pura70
            case pura70pro
            case pura70ultra
            case u1280
            case y3ii
            case y5ii
            case y5lite
            case y5p
            case y5prime2018
            case y52019
            case y62018
            case y62019
            case y6ii
            case y6p
            case y6pro
            case y6s2019
            case y7
            case y72018
            case y72019
            case y7prime
            case y7prime2018
            case y7prime2019
            case y7pro2018
            case y92019enjoy9plus
            case y9prime2019
            
            func describe() -> String {
                switch self {
                case .ascendg6:                 return "Ascend G6"
                case .ascendg7:                 return "Ascend G7"
                case .ascendp7:                 return "Ascend P7"
                case .ascendg500:               return "Ascend G500"
                case .ascendg610:               return "Ascend G610"
                case .ascendg700:               return "Ascend G700"
                case .ascendmate7:              return "Ascend Mate 7"
                case .ascendmate8:              return "Ascend Mate 8"
                case .ascendy300:               return "Ascend Y300"
                case .enjoy7plus:               return "Enjoy 7 Plus"
                case .g8:                       return "G8"
                case .gr3:                      return "GR3"
                case .gr5:                      return "GR5"
                case .gr52017:                  return "GR5 2017"
                case .gr5mini:                  return "GR5 Mini"
                case .gt3honor5c:               return "GT3 Honor 5c"
                case .mate9:                    return "Mate 9"
                case .mate9pro:                 return "Mate 9 Pro"
                case .mate10:                   return "Mate 10"
                case .mate10lite:               return "Mate 10 Lite"
                case .mate10pro:                return "Mate 10 Pro"
                case .mate20:                   return "Mate 20"
                case .mate20lite:               return "Mate 20 Lite"
                case .mate20pro:                return "Mate 20 Pro"
                case .mate20rsporschedesign:    return "Mate 20 RS Porsche Design"
                case .mate20x:                  return "Mate 20 X"
                case .mate30pro:                return "Mate 30 Pro"
                case .mate40pro:                return "Mate 40 Pro"
                case .mate40rsporschedesign:    return "Mate 40 RS Porsche Design"
                case .mate50:                   return "Mate 50"
                case .mate50pro:                return "Mate 50 Pro"
                case .mate50rsporschedesign:    return "Mate 50 RS Porsche Design"
                case .mate60pro:                return "Mate 60 Pro"
                case .mate60proplus:            return "Mate 60 Pro Plus"
                case .mate60rsultimate:         return "Mate 60 RS Ultimate"
                case .matersporschedesign:      return "Mate RS Porsche Design"
                case .mates:                    return "Mate S"
                case .matexs:                   return "Mate XS"
                case .matexs2:                  return "Mate XS 2"
                case .matex3:                   return "Mate X3"
                case .matex5:                   return "Mate X5"
                case .nova:                     return "Nova"
                case .nova3ipsmart:             return "Nova 3i (P Smart+)"
                case .nova5t:                   return "Nova 5T"
                case .nova7i:                   return "Nova 7i"
                case .nova8i:                   return "Nova 8i"
                case .nova9:                    return "Nova 9"
                case .nova9se:                  return "Nova 9 SE"
                case .nova10:                   return "Nova 10"
                case .nova10pro:                return "Nova 10 Pro"
                case .nova10se:                 return "Nova 10 SE"
                case .nova11:                   return "Nova 11"
                case .nova11pro:                return "Nova 11 Pro"
                case .nova12s:                  return "Nova 12s"
                case .novaplus:                 return "Nova Plus"
                case .novay70:                  return "Nova Y70"
                case .novay90:                  return "Nova Y90"
                case .novay91:                  return "Nova Y91"
                case .p8:                       return "P8"
                case .p8lite:                   return "P8 Lite"
                case .p8lite2017:               return "P8 Lite (2017)"
                case .p8max:                    return "P8 Max"
                case .p9:                       return "P9"
                case .p9lite:                   return "P9 Lite"
                case .p9lite2017:               return "P9 Lite (2017)"
                case .p9litemini:               return "P9 Lite Mini"
                case .p10:                      return "P10"
                case .p10lite:                  return "P10 Lite"
                case .p10plus:                  return "P10 Plus"
                case .p20:                      return "P20"
                case .p20lite:                  return "P20 Lite"
                case .p20pro:                   return "P20 Pro"
                case .p30:                      return "P30"
                case .p30lite:                  return "P30 Lite"
                case .p30pro:                   return "P30 Pro"
                case .p40:                      return "P40"
                case .p40lite:                  return "P40 Lite"
                case .p40litee:                 return "P40 Lite E"
                case .p40pro:                   return "P40 Pro"
                case .p40proplus:               return "P40 Pro Plus"
                case .p50pocket:                return "P50 Pocket"
                case .p50pro:                   return "P50 Pro"
                case .p60art:                   return "P60 Art"
                case .p60pro:                   return "P60 Pro"
                case .pocket2:                  return "Pocket 2"
                case .psmart:                   return "P Smart"
                case .psmart2019:               return "P Smart (2019)"
                case .psmart2021:               return "P Smart (2021)"
                case .psmartpro:                return "P Smart Pro"
                case .psmarts:                  return "P Smart S"
                case .psmartz:                  return "P Smart Z"
                case .pura70:                   return "Pura 70"
                case .pura70pro:                return "Pura 70 Pro"
                case .pura70ultra:              return "Pura 70 Ultra"
                case .u1280:                    return "U1280"
                case .y3ii:                     return "Y3 II"
                case .y5ii:                     return "Y5 II"
                case .y5lite:                   return "Y5 Lite"
                case .y5p:                      return "Y5p"
                case .y5prime2018:              return "Y5 Prime (2018)"
                case .y52019:                   return "Y5 (2019)"
                case .y62018:                   return "Y6 (2018)"
                case .y62019:                   return "Y6 (2019)"
                case .y6ii:                     return "Y6 II"
                case .y6p:                      return "Y6p"
                case .y6pro:                    return "Y6 Pro"
                case .y6s2019:                  return "Y6s (2019)"
                case .y7:                       return "Y7"
                case .y72018:                   return "Y7 (2018)"
                case .y72019:                   return "Y7 (2019)"
                case .y7prime:                  return "Y7 Prime"
                case .y7prime2018:              return "Y7 Prime (2018)"
                case .y7prime2019:              return "Y7 Prime (2019)"
                case .y7pro2018:                return "Y7 Pro (2018)"
                case .y92019enjoy9plus:         return "Y9 (2019) / Enjoy 9 Plus"
                case .y9prime2019:              return "Y9 Prime (2019)"
                }
            }
        }
        
        enum Iiif150: String, Describer, CaseIterable, Codable {
            case air1pro
            case air1ultra
            case b2ultra
            case raptor
            
            func describe() -> String {
                switch self {
                case .air1pro:                     return "Air1 Pro"
                case .air1ultra:                return "Air1 Ultra+"
                case .b2ultra:                  return "B2 Ultra"
                case .raptor:                   return "Raptor"
                }
            }
        }

        enum Infinix: String, Describer, CaseIterable, Codable {
            case gt10pro
            case gt20pro
            case hot8
            case hot9
            case hot9play
            case hot10
            case hot10lite
            case hot10play
            case hot10t
            case hot11play
            case hot11s
            case hot12
            case hot12pro
            case hot20
            case hot20i
            case hot30
            case hot30i
            case hot30play
            case hot40
            case hot40pro
            case note7
            case note7lite
            case note8
            case note8i
            case note10
            case note10pro
            case note11
            case note11pro
            case note12
            case note1296
            case note12pro
            case note12vip
            case note30
            case note30pro
            case note30vip
            case note40pro
            case s5
            case s5pro
            case smart5
            case smart7
            case smart8
            case smart8hd
            case smart8pro
            case smarthd
            case zero8
            case zero8i
            case zerox
            case zeroxpro
            case zero20
            case zero30
            case zero305g
            case zeroultra
            
            func describe() -> String {
                switch self {
                case .gt10pro:           return "GT 10 Pro"
                case .gt20pro:           return "GT 20 Pro"
                case .hot8:              return "Hot 8"
                case .hot9:              return "Hot 9"
                case .hot9play:          return "Hot 9 Play"
                case .hot10:             return "Hot 10"
                case .hot10lite:         return "Hot 10 Lite"
                case .hot10play:         return "Hot 10 Play"
                case .hot10t:            return "Hot 10T"
                case .hot11play:         return "Hot 11 Play"
                case .hot11s:            return "Hot 11s"
                case .hot12:             return "Hot 12"
                case .hot12pro:          return "Hot 12 Pro"
                case .hot20:             return "Hot 20"
                case .hot20i:            return "Hot 20i"
                case .hot30:             return "Hot 30"
                case .hot30i:            return "Hot 30i"
                case .hot30play:         return "Hot 30 Play"
                case .hot40:             return "Hot 40"
                case .hot40pro:          return "Hot 40 Pro"
                case .note7:             return "Note 7"
                case .note7lite:         return "Note 7 Lite"
                case .note8:             return "Note 8"
                case .note8i:            return "Note 8i"
                case .note10:            return "Note 10"
                case .note10pro:         return "Note 10 Pro"
                case .note11:            return "Note 11"
                case .note11pro:         return "Note 11 Pro"
                case .note12:            return "Note 12"
                case .note1296:          return "Note 12 96"
                case .note12pro:         return "Note 12 Pro"
                case .note12vip:         return "Note 12 Vip"
                case .note30:            return "Note 30"
                case .note30pro:         return "Note 30 Pro"
                case .note30vip:         return "Note 30 Vip"
                case .note40pro:         return "Note 40 Pro"
                case .s5:                return "S5"
                case .s5pro:             return "S5 Pro"
                case .smart5:            return "Smart 5"
                case .smart7:            return "Smart 7"
                case .smart8:            return "Smart 8"
                case .smart8hd:          return "Smart 8 HD"
                case .smart8pro:         return "Smart 8 Pro"
                case .smarthd:           return "Smart HD"
                case .zero8:             return "Zero 8"
                case .zero8i:            return "Zero 8i"
                case .zerox:             return "Zero X"
                case .zeroxpro:          return "Zero X Pro"
                case .zero20:            return "Zero 20"
                case .zero30:            return "Zero 30"
                case .zero305g:          return "Zero 30 5G"
                case .zeroultra:         return "Zero Ultra"
                }
            }
        }
        
        enum Kaan: String, Describer, CaseIterable, Codable {
            case a1
            case n2
            
            func describe() -> String {
                switch self {
                case .a1:                return "A1"
                case .n2:                return "N2"
                }
            }
        }
        
        enum Lenovo: String, Describer, CaseIterable, Codable {
            case a319
            case a369i
            case a806goldenwarriora8
            case a7000
            case a7010vibek4note
            case k3note
            case k5
            case k5note
            case k5plus
            case k6
            case k6note
            case k6power
            case k8
            case legion2pro
            case legionduel
            case legiony70
            case legiony90
            case p2
            case p70
            case s60
            case s90
            case vibeca2020
            case vibep1
            case vibep1m
            case vibep1turbo
            case vibes1
            case vibes1lite
            case vibeshotz90
            case vibex2
            case vibez2prok920
            case zukz2pro
            
            func describe() -> String {
                switch self {
                case .a319:                 return "A319"
                case .a369i:                return "A369i"
                case .a806goldenwarriora8:  return "A806 Golden Warrior A8"
                case .a7000:                return "A7000"
                case .a7010vibek4note:      return "A7010 Vibe K4 Note"
                case .k3note:               return "K3 Note"
                case .k5:                   return "K5"
                case .k5note:               return "K5 Note"
                case .k5plus:               return "K5 Plus"
                case .k6:                   return "K6"
                case .k6note:               return "K6 Note"
                case .k6power:              return "K6 Power"
                case .k8:                   return "K8"
                case .legion2pro:           return "Legion 2 Pro"
                case .legionduel:           return "Legion Duel"
                case .legiony70:            return "Legion Y70"
                case .legiony90:            return "Legion Y90"
                case .p2:                   return "P2"
                case .p70:                  return "P70"
                case .s60:                  return "S60"
                case .s90:                  return "S90"
                case .vibeca2020:           return "Vibe C A2020"
                case .vibep1:               return "Vibe P1"
                case .vibep1m:              return "Vibe P1m"
                case .vibep1turbo:          return "Vibe P1 Turbo"
                case .vibes1:               return "Vibe S1"
                case .vibes1lite:           return "Vibe S1 Lite"
                case .vibeshotz90:          return "Vibe Shot Z90"
                case .vibex2:               return "Vibe X2"
                case .vibez2prok920:        return "Vibe Z2 Pro K920"
                case .zukz2pro:             return "ZUK Z2 Pro"
                }
            }
        }
        
        enum Letvleeco: String, Describer, CaseIterable, Codable {
            case x600le1
            case x910lemaxpro
            case lemax2
            
            func describe() -> String {
                switch self {
                case .x600le1:              return "X600 Le 1"
                case .x910lemaxpro:         return "X910 Le Max Pro"
                case .lemax2:               return "Le Max 2"}
            }
        }
        
        enum Lg: String, Describer, CaseIterable, Codable {
            case aka
            case aristo2
            case beaconmn270
            case chocolateplatinumke800
            case cookiekp500
            case egot500
            case gflexd958
            case gflex2h955
            case g2d802
            case g3d855
            case g3beat
            case g3duald856
            case g3stylusd690
            case g4beat
            case g4h815
            case g4h818
            case g4ch525n
            case g4stylush540
            case g4stylush630
            case g5h850
            case g5se
            case g6h870
            case g7fit
            case g7thinqg710
            case g8sthinq
            case k5x220
            case k82017
            case k8k350n
            case k8x300
            case k102017
            case k10k420n
            case k10lte
            case k11
            case k20
            case k40s
            case k41s
            case k50
            case k61
            case k62
            case l70d320
            case l80d370
            case l80d380
            case l90d405
            case lbellod331
            case leonh340n
            case newchocolatebl40
            case nexus4e960
            case nexus5d821
            case optimusgt540
            case optimus3dp920
            case optimus4xhdp880
            case optimus7e900
            case optimusblackp970
            case optimusge975
            case optimusgproe986
            case optimusl42e440
            case optimusl7p705
            case optimusmep350
            case optimussole730
            case pradap940
            case q6
            case q60
            case q7
            case shineke770
            case shineke970
            case stylus2plusk530
            case stylus2k520
            case v10
            case v20
            case v40thinq
            case viewtyku990
            case wing5g
            case winkqwertyc305
            case winkt310
            case winkwifit310i
            case xscreen
            case b1300
            case b2100
            case bl20
            case c2500
            case e612
            case g1600
            case g7100
            case gb102
            case gb106
            case gb110
            case gb190
            case gd330
            case gd880
            case gd910
            case gw300
            case gx500
            case kf510
            case kf750
            case kg220
            case kg270
            case kg300
            case kg370
            case kg800
            case km900arena
            case kp100
            case kp105
            case kp110
            case kp202
            case kp220
            case kt520
            case m6100
            case qstylusplus
            case u8110
            case u960
            case v30plus
            case v50thinq
            case velvet
            
            func describe() -> String {
                switch self {
                case .aka:                      return "AKA"
                case .aristo2:                  return "Aristo 2"
                case .beaconmn270:              return "Beacon MN270"
                case .chocolateplatinumke800:   return "Chocolate Platinum KE800"
                case .cookiekp500:              return "Cookie KP500"
                case .egot500:                  return "Ego T500"
                case .gflexd958:                return "G Flex D958"
                case .gflex2h955:               return "G Flex 2 H955"
                case .g2d802:                   return "G2 D802"
                case .g3d855:                   return "G3 D855"
                case .g3beat:                   return "G3 Beat"
                case .g3duald856:               return "G3 Dual D856"
                case .g3stylusd690:             return "G3 Stylus D690"
                case .g4beat:                   return "G4 Beat"
                case .g4h815:                   return "G4 H815"
                case .g4h818:                   return "G4 H818"
                case .g4ch525n:                 return "G4c H525n"
                case .g4stylush540:             return "G4 Stylus H540"
                case .g4stylush630:             return "G4 Stylus H630"
                case .g5h850:                   return "G5 H850"
                case .g5se:                     return "G5 SE"
                case .g6h870:                   return "G6 H870"
                case .g7fit:                    return "G7 Fit"
                case .g7thinqg710:              return "G7 ThinQ G710"
                case .g8sthinq:                 return "G8s ThinQ"
                case .k5x220:                   return "K5 X220"
                case .k82017:                   return "K8 (2017)"
                case .k8k350n:                  return "K8 K350N"
                case .k8x300:                   return "K8 X300"
                case .k102017:                  return "K10 (2017)"
                case .k10k420n:                 return "K10 K420N"
                case .k10lte:                   return "K10 LTE"
                case .k11:                      return "K11"
                case .k20:                      return "K20"
                case .k40s:                     return "K40S"
                case .k41s:                     return "K41S"
                case .k50:                      return "K50"
                case .k61:                      return "K61"
                case .k62:                      return "K62"
                case .l70d320:                  return "L70 D320"
                case .l80d370:                  return "L80 D370"
                case .l80d380:                  return "L80 D380"
                case .l90d405:                  return "L90 D405"
                case .lbellod331:               return "L Bello D331"
                case .leonh340n:                return "Leon H340N"
                case .newchocolatebl40:         return "New Chocolate BL40"
                case .nexus4e960:               return "Nexus 4 E960"
                case .nexus5d821:               return "Nexus 5 D821"
                case .optimusgt540:             return "Optimus GT540"
                case .optimus3dp920:            return "Optimus 3D P920"
                case .optimus4xhdp880:          return "Optimus 4X HD P880"
                case .optimus7e900:             return "Optimus 7 E900"
                case .optimusblackp970:         return "Optimus Black P970"
                case .optimusge975:             return "Optimus G E975"
                case .optimusgproe986:          return "Optimus G Pro E986"
                case .optimusl42e440:           return "Optimus L4 2 E440"
                case .optimusl7p705:            return "Optimus L7 P705"
                case .optimusmep350:            return "Optimus Me P350"
                case .optimussole730:           return "Optimus Sol E730"
                case .pradap940:                return "Prada P940"
                case .q6:                       return "Q6"
                case .q60:                      return "Q60"
                case .q7:                       return "Q7+"
                case .shineke770:               return "Shine KE770"
                case .shineke970:               return "Shine KE970"
                case .stylus2plusk530:          return "Stylus 2 Plus K530"
                case .stylus2k520:              return "Stylus 2 K520"
                case .v10:                      return "V10"
                case .v20:                      return "V20"
                case .v40thinq:                 return "V40 ThinQ"
                case .viewtyku990:              return "Viewty KU990"
                case .wing5g:                   return "Wing 5G"
                case .winkqwertyc305:           return "Wink Qwerty C305"
                case .winkt310:                 return "Wink T310"
                case .winkwifit310i:            return "Wink Wi-Fi T310i"
                case .xscreen:                  return "X Screen"
                case .b1300:                    return "B1300"
                case .b2100:                    return "B2100"
                case .bl20:                     return "BL20"
                case .c2500:                    return "C2500"
                case .e612:                     return "E612"
                case .g1600:                    return "G1600"
                case .g7100:                    return "G7100"
                case .gb102:                    return "GB102"
                case .gb106:                    return "GB106"
                case .gb110:                    return "GB110"
                case .gb190:                    return "GB190"
                case .gd330:                    return "GD330"
                case .gd880:                    return "GD880"
                case .gd910:                    return "GD910"
                case .gw300:                    return "GW300"
                case .gx500:                    return "GX500"
                case .kf510:                    return "KF510"
                case .kf750:                    return "KF750"
                case .kg220:                    return "KG220"
                case .kg270:                    return "KG270"
                case .kg300:                    return "KG300"
                case .kg370:                    return "KG370"
                case .kg800:                    return "KG800"
                case .km900arena:               return "KM900 Arena"
                case .kp100:                    return "KP100"
                case .kp105:                    return "KP105"
                case .kp110:                    return "KP110"
                case .kp202:                    return "KP202"
                case .kp220:                    return "KP220"
                case .kt520:                    return "KT520"
                case .m6100:                    return "M6100"
                case .qstylusplus:              return "Q Stylus Plus"
                case .u8110:                    return "U8110"
                case .u960:                     return "U960"
                case .v30plus:                  return "V30 Plus"
                case .v50thinq:                 return "V50 ThinQ"
                case .velvet:                   return "Velvet"
                }
            }
        }
    
        enum Meizu: String, Describer, CaseIterable, Codable {
            case modal15plus
            case modal16
            case modal16plus
            case modal16th
            case modal18pro
            case modal20
            case modal20pro
            case modal21note
            case modal21pro
            case m5s
            case m6t
            case mx
            case m10
            case note8
            case note9
            case pro7
            case pro7plus
            case x8
            
            func describe() -> String {
                switch self {
                case .modal15plus:           return "15 Plus"
                case .modal16:               return "16"
                case .modal16plus:           return "16 Plus"
                case .modal16th:             return "16 TH"
                case .modal18pro:            return "18 Pro"
                case .modal20:               return "20"
                case .modal20pro:            return "20 Pro"
                case .modal21note:           return "21 Note"
                case .modal21pro:            return "21 Pro"
                case .m5s:                   return "M5s"
                case .m6t:                   return "M6T"
                case .mx:                    return "MX"
                case .m10:                   return "M10"
                case .note8:                 return "Note 8"
                case .note9:                 return "Note 9"
                case .pro7:                  return "Pro 7"
                case .pro7plus:              return "Pro 7 Plus"
                case .x8:                    return "X8"
                }
            }
        }
        
        enum Microsoft: String, Describer, CaseIterable, Codable {
            case lumia532
            case lumia535
            case lumia540
            case lumia640lte
            case lumia640xl
            case lumia950
            case surfaceduo2
            
            func describe() -> String {
                switch self {
                case .lumia532:             return "Lumia 532"
                case .lumia535:             return "Lumia 535"
                case .lumia540:             return "Lumia 540"
                case .lumia640lte:          return "Lumia 640 LTE"
                case .lumia640xl:           return "Lumia 640 XL"
                case .lumia950:             return "Lumia 950"
                case .surfaceduo2:          return "Surface Duo 2"
                }
            }
        }
        
        enum Motorola: String, Describer, CaseIterable, Codable {
            case modal5200
            case modal7200
            case a925
            case atrixhdmb886
            case aura
            case backflipmotoblur
            case c113
            case c115
            case c117
            case c140
            case c200
            case c261
            case c550
            case cd930
            case d460
            case defymotoblur
            case droidrazrmaxxhd
            case e1000
            case e398
            case e6
            case edge
            case edge30ultra
            case edge40neo
            case edge50pro
            case edgex30
            case f3
            case k1
            case l6
            case l7
            case l9
            case m3688
            case m3788
            case motoe
            case motoe13
            case motoe4
            case motoe4plus
            case motog
            case motog2ndgen
            case motog4
            case motog4plus
            case motog5
            case motog5splus
            case motogpower
            case motogpower2022
            case motogpower5g
            case motorazr2022
            case motox30pro
            case motox40
            case motoz
            case motoz2play
            case motoz3play
            case mpx200
            case mpx220
            case razr40
            case razr40ultra
            case razr50ultra
            case razr5g
            case rokrzn50
            case startac130
            case startac90
            case t191
            case talkaboutt2288
            case timeport250
            case timeport280
            case timeportl7089
            case u6
            case v3
            case v300
            case v360
            case v3688
            case v3i
            case v3idg
            case v3x
            case v50
            case v6
            case v635
            case v70
            case v8
            case v980
            case ve66
            case w156
            case w180
            case w213
            case w375
            case w510
            case xt320defymini
            case xt615motoluxe
            case z3
            case z6
            case zn5
            
            func describe() -> String {
                switch self {
                case .modal5200:            return "5200"
                case .modal7200:            return "7200"
                case .a925:                 return "A925"
                case .atrixhdmb886:         return "Atrix HD MB886"
                case .aura:                 return "Aura"
                case .backflipmotoblur:     return "Backflip Motoblur"
                case .c113:                 return "C113"
                case .c115:                 return "C115"
                case .c117:                 return "C117"
                case .c140:                 return "C140"
                case .c200:                 return "C200"
                case .c261:                 return "C261"
                case .c550:                 return "C550"
                case .cd930:                return "CD930"
                case .d460:                 return "D460"
                case .defymotoblur:         return "Defy Motoblur"
                case .droidrazrmaxxhd:      return "Droid Razr Maxx HD"
                case .e1000:                return "E1000"
                case .e398:                 return "E398"
                case .e6:                   return "E6"
                case .edge:                 return "Edge+"
                case .edge30ultra:          return "Edge 30 Ultra"
                case .edge40neo:            return "Edge 40 Neo"
                case .edge50pro:            return "Edge 50 Pro"
                case .edgex30:              return "Edge X30"
                case .f3:                   return "F3"
                case .k1:                   return "K1"
                case .l6:                   return "L6"
                case .l7:                   return "L7"
                case .l9:                   return "L9"
                case .m3688:                return "M 3688"
                case .m3788:                return "M 3788"
                case .motoe:                return "Moto E"
                case .motoe13:              return "Moto E13"
                case .motoe4:               return "Moto E4"
                case .motoe4plus:           return "Moto E4 Plus"
                case .motog:                return "Moto G"
                case .motog2ndgen:          return "Moto G (2nd gen)"
                case .motog4:               return "Moto G4"
                case .motog4plus:           return "Moto G4 Plus"
                case .motog5:               return "Moto G5"
                case .motog5splus:          return "Moto G5S Plus"
                case .motogpower:           return "Moto G Power"
                case .motogpower2022:       return "Moto G Power (2022)"
                case .motogpower5g:         return "Moto G Power 5G"
                case .motorazr2022:         return "Moto Razr 2022"
                case .motox30pro:           return "Moto X30 Pro"
                case .motox40:              return "Moto X40"
                case .motoz:                return "Moto Z"
                case .motoz2play:           return "Moto Z2 Play"
                case .motoz3play:           return "Moto Z3 Play"
                case .mpx200:               return "MPX 200"
                case .mpx220:               return "MPX 220"
                case .razr40:               return "Razr 40"
                case .razr40ultra:          return "Razr 40 Ultra"
                case .razr50ultra:          return "Razr 50 Ultra"
                case .razr5g:               return "Razr 5G"
                case .rokrzn50:             return "ROKR ZN50"
                case .startac130:           return "Startac 130"
                case .startac90:            return "Startac 90"
                case .t191:                 return "T191"
                case .talkaboutt2288:       return "Talkabout T 2288"
                case .timeport250:          return "Timeport 250"
                case .timeport280:          return "Timeport 280"
                case .timeportl7089:        return "Timeport L7089"
                case .u6:                   return "U6"
                case .v3:                   return "V3"
                case .v300:                 return "V300"
                case .v360:                 return "V360"
                case .v3688:                return "V3688"
                case .v3i:                  return "V3i"
                case .v3idg:                return "V3i DG"
                case .v3x:                  return "V3X"
                case .v50:                  return "V50"
                case .v6:                   return "V6"
                case .v635:                 return "V635"
                case .v70:                  return "V70"
                case .v8:                   return "V8"
                case .v980:                 return "V980"
                case .ve66:                 return "VE66"
                case .w156:                 return "W156"
                case .w180:                 return "W180"
                case .w213:                 return "W213"
                case .w375:                 return "W375"
                case .w510:                 return "W510"
                case .xt320defymini:        return "XT320 Defy Mini"
                case .xt615motoluxe:        return "XT615 Motoluxe"
                case .z3:                   return "Z3"
                case .z6:                   return "Z6"
                case .zn5:                  return "ZN5"
                }
            }
        }
        
        enum Nio: String, Describer, CaseIterable, Codable {
            case phone
            
            func describe() -> String {
                switch self {
                case .phone:                return "Phone"
                }
            }
        }
        
        enum Nokia: String, Describer, CaseIterable, Codable {
            case model1
            case model2
            case model21
            case model3
            case model31plus
            case model32
            case model5
            case model51
            case model51plusx5
            case model6
            case model8
            case model81x7
            case model8sirocco
            case model100
            case model101
            
            func describe() -> String {
                switch self {
                case .model1:               return "1"
                case .model2:               return "2"
                case .model21:              return "2.1"
                case .model3:               return "3"
                case .model31plus:          return "3.1 Plus"
                case .model32:              return "3.2"
                case .model5:               return "5"
                case .model51:              return "5.1"
                case .model51plusx5:        return "5.1 Plus (X5)"
                case .model6:               return "6"
                case .model8:               return "8"
                case .model81x7:            return "8.1 (X7)"
                case .model8sirocco:        return "8 Sirocco"
                case .model100:             return "100"
                case .model101:             return "101"
                }
            }
        }
        
        enum Nothing: String, Describer, CaseIterable, Codable {
            case phone1
            case phone2
            case phone2a
            
            func describe() -> String {
                switch self {
                case .phone1:               return "Phone 1"
                case .phone2:               return "Phone 2"
                case .phone2a:              return "Phone (2a)"
                }
            }
        }
        
        enum Omix: String, Describer, CaseIterable, Codable {
            case x3
            case x5
            case x300
            case x400
            case x500
            case x600
            case x700
            
            func describe() -> String {
                switch self {
                case .x3:           return "X3"
                case .x5:           return "X5"
                case .x300:         return "X300"
                case .x400:         return "X400"
                case .x500:         return "X500"
                case .x600:         return "X600"
                case .x700:         return "X700"
                }
            }
        }
   
        enum Oneplus: String, Describer, CaseIterable, Codable {
            case model2
            case model3t
            case model5t
            case model6
            case model6t
            case model7
            case model7pro
            case model7t
            case model7tpro
            case model8
            case model8pro
            case model8t
            case model9
            case model9pro
            case model9r
            case model9rt
            case model10pro
            case model10r
            case model10t
            case model11
            case model11r
            case model12
            case ace2pro
            case ace3
            case nord
            case nord3
            case nordce3lite
            case nordn10
            case opens
            case xs
            
            func describe() -> String {
                switch self {
                case .model2:               return "2"
                case .model3t:              return "3T"
                case .model5t:              return "5T"
                case .model6:               return "6"
                case .model6t:              return "6T"
                case .model7:               return "7"
                case .model7pro:            return "7 Pro"
                case .model7t:              return "7T"
                case .model7tpro:           return "7T Pro"
                case .model8:               return "8"
                case .model8pro:            return "8 Pro"
                case .model8t:              return "8T"
                case .model9:               return "9"
                case .model9pro:            return "9 Pro"
                case .model9r:              return "9R"
                case .model9rt:             return "9RT"
                case .model10pro:           return "10 Pro"
                case .model10r:             return "10R"
                case .model10t:             return "10T"
                case .model11:              return "11"
                case .model11r:             return "11R"
                case .model12:              return "12"
                case .ace2pro:              return "Ace 2 Pro"
                case .ace3:                 return "Ace 3"
                case .nord:                 return "Nord"
                case .nord3:                return "Nord 3"
                case .nordce3lite:          return "Nord CE 3 Lite"
                case .nordn10:              return "Nord N10"
                case .opens:                return "Open"
                case .xs:                   return "X"
                }
            }
        }
        
        enum Oppo: String, Describer, CaseIterable, Codable {
            case modal3000
            case a52020
            case a5s
            case a92020
            case a12
            case a15
            case a15s
            case a16
            case a31
            case a37
            case a38
            case a39
            case a52
            case a54
            case a55
            case a57
            case a72
            case a73
            case a74
            case a77
            case a78
            case a91
            case a96
            case ax7
            case f9
            case f11pro
            case findn2
            case findn2flip
            case findn3
            case findn3flip
            case findx2
            case findx2pro
            case findx3neo
            case findx3pro
            case findx5pro
            case findx6pro
            case findx7ultra
            case rx17neo
            case rx17pro
            case r17
            case r817real
            case reno
            case reno10xzoom
            case reno2
            case reno2z
            case reno3
            case reno3pro
            case renoace
            case renoz
            case reno4
            case reno4lite
            case reno4pro
            case reno5
            case reno5lite
            case reno6
            case reno7
            case reno7pro
            case reno8pro
            case reno8t
            case reno10proplus
            case reno11
            case reno11f
            case reno11pro
            
            func describe() -> String {
                switch self {
                case .modal3000:        return "3000"
                case .a52020:           return "A5 (2020)"
                case .a5s:              return "A5S"
                case .a92020:           return "A9 2020"
                case .a12:              return "A12"
                case .a15:              return "A15"
                case .a15s:             return "A15s"
                case .a16:              return "A16"
                case .a31:              return "A31"
                case .a37:              return "A37"
                case .a38:              return "A38"
                case .a39:              return "A39"
                case .a52:              return "A52"
                case .a54:              return "A54"
                case .a55:              return "A55"
                case .a57:              return "A57"
                case .a72:              return "A72"
                case .a73:              return "A73"
                case .a74:              return "A74"
                case .a77:              return "A77"
                case .a78:              return "A78"
                case .a91:              return "A91"
                case .a96:              return "A96"
                case .ax7:              return "AX7"
                case .f9:               return "F9"
                case .f11pro:           return "F11 Pro"
                case .findn2:           return "Find N2"
                case .findn2flip:       return "Find N2 Flip"
                case .findn3:           return "Find N3"
                case .findn3flip:       return "Find N3 Flip"
                case .findx2:           return "Find X2"
                case .findx2pro:        return "Find X2 Pro"
                case .findx3neo:        return "Find X3 Neo"
                case .findx3pro:        return "Find X3 Pro"
                case .findx5pro:        return "Find X5 Pro"
                case .findx6pro:        return "Find X6 Pro"
                case .findx7ultra:      return "Find X7 Ultra"
                case .rx17neo:          return "RX17 Neo"
                case .rx17pro:          return "RX17 Pro"
                case .r17:              return "R17"
                case .r817real:         return "R817 Real"
                case .reno:             return "Reno"
                case .reno10xzoom:      return "Reno 10x Zoom"
                case .reno2:            return "Reno2"
                case .reno2z:           return "Reno2 Z"
                case .reno3:            return "Reno3"
                case .reno3pro:         return "Reno3 Pro"
                case .renoace:          return "Reno Ace"
                case .renoz:            return "Reno Z"
                case .reno4:            return "Reno4"
                case .reno4lite:        return "Reno4 Lite"
                case .reno4pro:         return "Reno4 Pro"
                case .reno5:            return "Reno5"
                case .reno5lite:        return "Reno5 Lite"
                case .reno6:            return "Reno6"
                case .reno7:            return "Reno7"
                case .reno7pro:         return "Reno7 Pro"
                case .reno8pro:         return "Reno8 Pro"
                case .reno8t:           return "Reno8 T"
                case .reno10proplus:    return "Reno10 Pro Plus"
                case .reno11:           return "Reno11"
                case .reno11f:          return "Reno11 F"
                case .reno11pro:        return "Reno11 Pro"
                }
            }
        }
            
        enum Oukitel: String, Describer, CaseIterable, Codable {
            case c21
            case c21plus
            case c21pro
            case c32
            case c33
            case k15plus
            case k16
            case wp5
            case wp12
            case wp15
            case wp16
            case wp17
            case wp19
            case wp19pro
            case wp21
            case wp22
            case wp26
            case wp27
            case wp30pro
            case wp36
            case wp5000
            case other
            
            func describe() -> String {
                switch self {
                case .c21:              return "C21"
                case .c21plus:          return "C21 Plus"
                case .c21pro:           return "C21 Pro"
                case .c32:              return "C32"
                case .c33:              return "C33"
                case .k15plus:          return "K15 Plus"
                case .k16:              return "K16"
                case .wp5:              return "WP5"
                case .wp12:             return "WP12"
                case .wp15:             return "WP15"
                case .wp16:             return "WP16"
                case .wp17:             return "WP17"
                case .wp19:             return "WP19"
                case .wp19pro:          return "WP19 Pro"
                case .wp21:             return "WP21"
                case .wp22:             return "WP22"
                case .wp26:             return "WP26"
                case .wp27:             return "WP27"
                case .wp30pro:          return "WP30 Pro"
                case .wp36:             return "WP36"
                case .wp5000:           return "WP5000"
                case .other:            return "Diğer"
                }
            }
        }
        
        enum Ovion: String, Describer, CaseIterable, Codable {
            case v10lite
            case v20pro
            
            func describe() -> String {
                switch self {
                case .v10lite:          return "V10 Lite"
                case .v20pro:           return "V20 Pro"
                }
            }
        }
        
        enum Palm: String, Describer, CaseIterable, Codable {
            case other
            
            func describe() -> String {
                switch self {
                case .other:            return "Diğer"
                }
            }
        }
        
        enum Panasonic: String, Describer, CaseIterable, Codable {
            case a100
            case g50
            case g520
            case g600
            case gd30
            case gd50
            case gd55
            case gd67
            case gd68
            case gd75
            case gd90
            case gd92
            case gd93
            case vs3
            case vs6
            case x60
            case x100
            case x300
            case x500
            case other
            
            func describe() -> String {
                switch self {
                case .a100:              return "A 100"
                case .g50:               return "G 50"
                case .g520:              return "G 520"
                case .g600:              return "G 600"
                case .gd30:              return "GD 30"
                case .gd50:              return "GD 50"
                case .gd55:              return "GD 55"
                case .gd67:              return "GD 67"
                case .gd68:              return "GD 68"
                case .gd75:              return "GD 75"
                case .gd90:              return "GD 90"
                case .gd92:              return "GD 92"
                case .gd93:              return "GD 93"
                case .vs3:               return "VS 3"
                case .vs6:               return "VS 6"
                case .x60:               return "X 60"
                case .x100:              return "X 100"
                case .x300:              return "X 300"
                case .x500:              return "X 500"
                case .other:             return "Diğer"
                }
            }
        }
    
        enum Philips: String, Describer, CaseIterable, Codable {
            case modal160
            case modal180
            case modal362
            case modal530
            case modal650xenium99c
            case ct1628
            case ct7558
            case fisio822
            case s200
            case s220
            case xenium
            case xenium998
            case xenium99d
            case xenium99e
            case xenium99h
            case xenium99k
            case xenium99q
            case xenium99r
            case xenium99u
            case xenium99w
            case xenium99z
            case xeniumx500
            case xeniumx520
            case xeniumx800
            case other
            
            func describe() -> String {
                switch self {
                case .modal160:             return "160"
                case .modal180:             return "180"
                case .modal362:             return "362"
                case .modal530:             return "530"
                case .modal650xenium99c:    return "650/Xenium 9@9c"
                case .ct1628:               return "CT 1628"
                case .ct7558:               return "CT 7558"
                case .fisio822:             return "Fisio 822"
                case .s200:                 return "S 200"
                case .s220:                 return "S 220"
                case .xenium:               return "Xenium"
                case .xenium998:            return "Xenium 9@98"
                case .xenium99d:            return "Xenium 9@9d"
                case .xenium99e:            return "Xenium 9@9e"
                case .xenium99h:            return "Xenium 9@9h"
                case .xenium99k:            return "Xenium 9@9k"
                case .xenium99q:            return "Xenium 9@9Q"
                case .xenium99r:            return "Xenium 9@9r"
                case .xenium99u:            return "Xenium 9@9u"
                case .xenium99w:            return "Xenium 9@9w"
                case .xenium99z:            return "Xenium 9@9z"
                case .xeniumx500:           return "Xenium X500"
                case .xeniumx520:           return "Xenium X520"
                case .xeniumx800:           return "Xenium X800"
                case .other:                return "Diğer"
                }
            }
        }
        
        enum Piranha: String, Describer, CaseIterable, Codable {
            case onix
            case zen
            case other
            
            func describe() -> String {
                switch self {
                case .onix:                return "Onix"
                case .zen:                 return "Zen"
                case .other:               return "Diğer"
                }
            }
        }
        
        enum Preo: String, Describer, CaseIterable, Codable {
            case p2
            case p3
            
            func describe() -> String {
                switch self {
                case .p2:                   return "P2"
                case .p3:                   return "P3"
                }
            }
        }
    
        enum Qin: String, Describer, CaseIterable, Codable {
            case modal2pro
            case modal3ultra
            case f22
            case f22pro
            
            func describe() -> String {
                switch self {
                case .modal2pro:            return "2 Pro"
                case .modal3ultra:          return "3 Ultra"
                case .f22:                  return "F22"
                case .f22pro:               return "F22 Pro"
                }
            }
        }
        
        enum Quatro: String, Describer, CaseIterable, Codable {
            case q8
            case q11
            
            func describe() -> String {
                switch self {
                case .q8:                  return "Q8"
                case .q11:                 return "Q11"
                }
            }
        }
        
        enum Razer: String, Describer, CaseIterable, Codable {
            case phone
            
            func describe() -> String {
                switch self {
                case .phone:               return "Phone"
                }
            }
        }
        
        enum Realme: String, Describer, CaseIterable, Codable {
            case modal1
            case modal2pro
            case modal5i
            case modal5pro
            case modal6
            case modal6i
            case modal6pro
            case modal7
            case modal7pro
            case modal8
            case modal8pro
            case modal9i
            case modal9pro
            case modal10
            case modal10pro
            case modal10proplus
            case modal11
            case modal115g
            case modal11pro
            case modal11proplus
            case modal12
            case modal12lite
            case modal12pro
            case modal12proplus
            case c2
            case c3
            case c11
            case c15
            case c21
            case c21y
            case c25
            case c25s
            case c25y
            case c53
            case c55
            case c67
            case c3i
            case gt
            case gt2
            case gt2pro
            case gt3
            case gt5
            case gt5pro
            case gtmasteredition
            case gtneo
            case gtneo2
            case gtneo5
            case note50
            case x
            case x2
            case x2pro
            case x50
            case xt
            
            func describe() -> String {
                switch self {
                case .modal1:               return "1"
                case .modal2pro:            return "2 Pro"
                case .modal5i:              return "5i"
                case .modal5pro:            return "5 Pro"
                case .modal6:               return "6"
                case .modal6i:              return "6i"
                case .modal6pro:            return "6 Pro"
                case .modal7:               return "7"
                case .modal7pro:            return "7 Pro"
                case .modal8:               return "8"
                case .modal8pro:            return "8 Pro"
                case .modal9i:              return "9i"
                case .modal9pro:            return "9 Pro"
                case .modal10:              return "10"
                case .modal10pro:           return "10 Pro"
                case .modal10proplus:       return "10 Pro Plus"
                case .modal11:              return "11"
                case .modal115g:            return "11 5G"
                case .modal11pro:           return "11 Pro"
                case .modal11proplus:       return "11 Pro Plus"
                case .modal12:              return "12"
                case .modal12lite:          return "12 Lite"
                case .modal12pro:           return "12 Pro"
                case .modal12proplus:       return "12 Pro Plus"
                case .c2:                   return "C2"
                case .c3:                   return "C3"
                case .c11:                  return "C11"
                case .c15:                  return "C15"
                case .c21:                  return "C21"
                case .c21y:                 return "C21Y"
                case .c25:                  return "C25"
                case .c25s:                 return "C25S"
                case .c25y:                 return "C25Y"
                case .c53:                  return "C53"
                case .c55:                  return "C55"
                case .c67:                  return "C67"
                case .c3i:                  return "C3i"
                case .gt:                   return "GT"
                case .gt2:                  return "GT2"
                case .gt2pro:                   return "GT2 Pro"
                case .gt3:                  return "GT3"
                case .gt5:                  return "GT5"
                case .gt5pro:                   return "GT5 Pro"
                case .gtmasteredition:                  return "GT Master Edition"
                case .gtneo:                    return "GT Neo"
                case .gtneo2:                   return "GT Neo 2"
                case .gtneo5:                   return "GT Neo 5"
                case .note50:                   return "Note 50"
                case .x:                    return "X"
                case .x2:                   return "X2"
                case .x2pro:                    return "X2 Pro"
                case .x50:                  return "X50"
                case .xt:                   return "XT"
                }
            }
        }
        
        enum Reeder: String, Describer, CaseIterable, Codable {
            case p10
            case p11
            case p11se
            case p12
            case p12s
            case p13blue
            case p13blue2021
            case p13bluemax
            case p13bluemax2021
            case p13bluemaxl2021
            case p13bluemaxl2022
            case p13bluemaxlite
            case p13bluemaxpro
            case p13bluemaxprolite2022
            case p13blueplus
            case p13blueplus2022
            case s19max
            case s19maxpro
            case s19maxpros
            case s23promax
            case other

            func describe() -> String {
                switch self {
                case .p10:                    return "P10"
                case .p11:                    return "P11"
                case .p11se:                  return "P11SE"
                case .p12:                    return "P12"
                case .p12s:                   return "P12 S"
                case .p13blue:                return "P13 Blue"
                case .p13blue2021:            return "P13 Blue 2021"
                case .p13bluemax:             return "P13 Blue Max"
                case .p13bluemax2021:         return "P13 Blue Max 2021"
                case .p13bluemaxl2021:        return "P13 Blue Max L 2021"
                case .p13bluemaxl2022:        return "P13 Blue Max L 2022"
                case .p13bluemaxlite:         return "P13 Blue Max Lite"
                case .p13bluemaxpro:          return "P13 Blue Max Pro"
                case .p13bluemaxprolite2022:  return "P13 Blue Max Pro Lite 2022"
                case .p13blueplus:            return "P13 Blue Plus"
                case .p13blueplus2022:        return "P13 Blue Plus 2022"
                case .s19max:                 return "S19 Max"
                case .s19maxpro:              return "S19 Max Pro"
                case .s19maxpros:             return "S19 Max Pro S"
                case .s23promax:              return "S23 Pro Max"
                case .other:                  return "Diğer"
                }
            }
        }
        
        enum Royole: String, Describer, CaseIterable, Codable {
            case flexpai2
            
            func describe() -> String {
                switch self {
                case .flexpai2:               return "FlexPai 2"
                }
            }
        }

        enum Samsung: String, Describer, CaseIterable, Codable {
            case galaxy3i5800
            case galaxya01
            case galaxya01core
            case galaxya02
            case galaxya02s
            case galaxya03
            case galaxya03s
            case galaxya04
            case galaxya04e
            case galaxya04s
            case galaxya05
            case galaxya05s
            case galaxya2core
            case galaxya32015
            case galaxya32016
            case galaxya32017
            case galaxya52016
            case galaxya52017
            case galaxya5a500
            case galaxya62018
            case galaxya62018plus
            case galaxya6s
            case galaxya72016
            case galaxya72017
            case galaxya72018
            case galaxya7a700
            case galaxya82015
            case galaxya82016
            case galaxya82018
            case galaxya82018plus
            case galaxya8s
            case galaxya92018
            case galaxya9pro2016
            case galaxya10
            case galaxya10e
            case galaxya10s
            case galaxya11
            case galaxya12
            case galaxya13
            case galaxya14
            case galaxya15
            case galaxya20
            case galaxya20e
            case galaxya20s
            case galaxya21s
            case galaxya22
            case galaxya23
            case galaxya24
            case galaxya25
            case galaxya30
            case galaxya30s
            case galaxya31
            case galaxya32
            case galaxya33
            case galaxya34
            case galaxya35
            case galaxya40
            case galaxya41
            case galaxya50
            case galaxya51
            case galaxya52
            case galaxya52s
            case galaxya53
            case galaxya54
            case galaxya55
            case galaxya70
            case galaxya71
            case galaxya72
            case galaxya73
            case galaxya80
            case galaxyaces5830
            case galaxyaces5830i
            case galaxyace2i8160
            case galaxyace4g313
            case galaxyalphag850
            case galaxyc5
            case galaxyc5pro
            case galaxyc7
            case galaxyc7pro
            case galaxyc8
            case galaxyc9pro
            case galaxycorei8262
            case galaxycoreprimeg360
            case galaxye5e500
            case galaxye7e700
            case galaxyfames6810
            case galaxyfits5670
            case galaxyfold
            case galaxygios5660
            case galaxygrandi9082
            case galaxygrandmaxg720
            case galaxygrandneoplusi9060
            case galaxygrandprimeg530
            case galaxygrandprimeg532
            case galaxygrandprimeplus
            case galaxygrandprimepro
            case galaxygrand2g710
            case galaxyj1ace
            case galaxyj1j100
            case galaxyj1j120
            case galaxyj1miniprime
            case galaxyj22016
            case galaxyj22017
            case galaxyj22018
            case galaxyj2core2020
            case galaxyj2j200
            case galaxyj2prime
            case galaxyj32016
            case galaxyj32017
            case galaxyj3pro
            case galaxyj4
            case galaxyj4core
            case galaxyj4j400
            case galaxyj52016
            case galaxyj52017
            case galaxyj5j500
            case galaxyj5primeg570
            case galaxyj5pro
            case galaxyj6
            case galaxyj6plus
            case galaxyj72016
            case galaxyj72017
            case galaxyj7core
            case galaxyj7duo
            case galaxyj7j700
            case galaxyj7max
            case galaxyj7prime
            case galaxyj7prime2
            case galaxyj7pro
            case galaxyj8j810
            case galaxykzoomc115
            case galaxym02
            case galaxym10
            case galaxym10s
            case galaxym11
            case galaxym12
            case galaxym13
            case galaxym14
            case galaxym15
            case galaxym20
            case galaxym21
            case galaxym22
            case galaxym23
            case galaxym30
            case galaxym30s
            case galaxym31
            case galaxym31s
            case galaxym32
            case galaxym335g
            case galaxym345g
            case galaxym40
            case galaxym51
            case galaxym52
            case galaxymega63i9200
            case galaxyminis5570
            case galaxymini2s6500
            case galaxynotefanedition
            case galaxynoteedgen915
            case galaxynote2n7100
            case galaxynote3n9000
            case galaxynote3n9000q
            case galaxynote3n9005
            case galaxynote3neon750
            case galaxynote4n910
            case galaxynote5n920
            case galaxynote5duos
            case galaxynote7n930
            case galaxynote8n950
            case galaxynote8duos
            case galaxynote9n960
            case galaxynote10
            case galaxynote10plus
            case galaxynote105g
            case galaxynote10lite
            case galaxynote20
            case galaxynote205g
            case galaxynote20ultra
            case galaxynote20ultra5g
            case galaxyon5
            case galaxyon7
            case galaxyon7prime
            case galaxypockets5300
            case galaxypocketpluss5301
            case galaxyprob7510
            case galaxys4gt959v
            case galaxysadvancei9070
            case galaxysduoss7562
            case galaxysi9000
            case galaxysplusi9001
            case galaxys2i9100
            case galaxys3i9300
            case galaxys3minii8190
            case galaxys3minivalueeditioni8200
            case galaxys3neoi9301
            case galaxys3slimg3812b
            case galaxys4activei9295
            case galaxys4i9500
            case galaxys4minii9190
            case galaxys4zoomc101
            case galaxys5g900
            case galaxys5minig800f
            case galaxys5neog903
            case galaxys5plusg901f
            case galaxys6g920
            case galaxys6edgeg925
            case galaxys6edgeg928
            case galaxys7active
            case galaxys7g930
            case galaxys7edgeg935
            case galaxys8g955
            case galaxys8g950
            case galaxys9g965
            case galaxys9g960
            case galaxys10
            case galaxys105g
            case galaxys10e
            case galaxys10lite
            case galaxys10plus
            case galaxys20
            case galaxys20btsedition
            case galaxys20fe
            case galaxys20plus
            case galaxys20ultra
            case galaxys21
            case galaxys21fe
            case galaxys21plus
            case galaxys21ultra
            case galaxys22
            case galaxys22plus
            case galaxys22ultra
            case galaxys23
            case galaxys23fe
            case galaxys23plus
            case galaxys23ultra
            case galaxys24
            case galaxys24plus
            case galaxys24ultra
            case galaxyspicai5700
            case galaxystars5280
            case galaxytrends7560
            case galaxytrendlites7390
            case galaxytrendpluss7580
            case galaxywini8552
            case galaxywonderi8150
            case galaxyxcover2s7710
            case galaxyxcover4
            case galaxyxcover7
            case galaxyxcoverpro
            case galaxyys5360
            case galaxyyprob5510
            case galaxyyoungs6310
            case galaxyzflip
            case galaxyzflip3
            case galaxyzflip4
            case galaxyzflip5
            case galaxyzflip6
            case galaxyzfold2
            case galaxyzfold3
            case galaxyzfold4
            case galaxyzfold5
            case galaxyzfold6
            case modal600
            case a177
            case a717
            case a800
            case b130
            case b2100xplorer
            case b310
            case b312metro
            case b3310
            case b3410corbyplus
            case b350e
            case b5310corbypro
            case b5722
            case b7300omnialite
            case b7320omniapro
            case b7722
            case bangolufsenserenata
            case c100
            case c160
            case c230
            case c260
            case c270
            case c300
            case c3010
            case c3010s
            case c3050
            case c3053
            case c3200montebar
            case c3212
            case c322chat
            case c3300champ
            case c3303kchamp
            case c3310rrex60
            case c3322metroduos
            case c3500
            case c3510genoa
            case c3520
            case c3530
            case c3560
            case c3780
            case c450
            case c5010squash
            case c5130
            case c5212
            case c6112
            case c6712stariiduos
            case d410
            case d500
            case d520
            case d600
            case d720
            case d780
            case d800
            case d830
            case d840
            case d880
            case d900
            case d900i
            case d980
            case e1050
            case e1070
            case e1080t
            case e1081t
            case e1085
            case e1105
            case e1120
            case e1150
            case e1180
            case e1190
            case e1205
            case e1210
            case e1270
            case e1282
            case e1310
            case e1360
            case e200
            case e2120
            case e2121
            case e2152
            case e2200
            case e2202
            case e2220
            case e2232duos
            case e2250
            case e2350b
            case e250
            case e2550monteslider
            case e2652champduos
            case e2652wchampduos
            case e3210
            case e360
            case e490
            case e630
            case e830
            case e840
            case e910bangolufsen
            case f300
            case f400
            case f480
            case f480i
            case g600
            case g810
            case i200
            case i550
            case i550w
            case i560
            case i600
            case i8000omniaii
            case i8910omniahd
            case i900omnia
            case j150
            case j210
            case j750
            case l700
            case l700i
            case l760
            case l770
            case m150
            case m300
            case m310
            case m3510
            case m5650lindy
            case m620
            case m7603beatdj
            case m8800
            case n500da
            case n700
            case n710
            case p300
            case p310
            case p510
            case p520giorgioarmani
            case p850
            case s3100
            case s3222
            case s3350chat
            case s3353trevi
            case s3500
            case s3570chat
            case s3600
            case s3650corby
            case s3653corby
            case s3653wcorbywifi
            case s3850corbyii
            case s5200
            case s5220star3
            case s5230star
            case s5233
            case s5233w
            case s5253wave
            case s5260starii
            case s5270chat
            case s5350shark
            case s5550sharkamoled
            case s5610k
            case s5620monte
            case s7230ewave
            case s7233
            case s7233ewave
            case s7250wavem
            case s7330
            case s7350ultras
            case s8003
            case s8300ultratouch
            case s8500wave
            case s8530wave2
            case s8600wave3
            case s9402ego
            case t100
            case u600
            case u700
            case u800
            case x100
            case x150
            case x160
            case x200
            case x210
            case x300
            case x430
            case x460
            case x510
            case x540
            case x600
            case x620
            case x650
            case x660
            case x700
            case x810
            case x820
            case x830
            case z3
            case z370
            case zv60
            case modal3053
            
            func describe() -> String {
                switch self {
                case .galaxy3i5800:             return "Galaxy 3 i5800"
                case .galaxya01:                return "Galaxy A01"
                case .galaxya01core:            return "Galaxy A01 Core"
                case .galaxya02:                return "Galaxy A02"
                case .galaxya02s:               return "Galaxy A02s"
                case .galaxya03:                return "Galaxy A03"
                case .galaxya03s:               return "Galaxy A03s"
                case .galaxya04:                return "Galaxy A04"
                case .galaxya04e:               return "Galaxy A04e"
                case .galaxya04s:               return "Galaxy A04s"
                case .galaxya05:                return "Galaxy A05"
                case .galaxya05s:               return "Galaxy A05s"
                case .galaxya2core:             return "Galaxy A2 Core"
                case .galaxya32015:             return "Galaxy A3 (2015)"
                case .galaxya32016:             return "Galaxy A3 (2016)"
                case .galaxya32017:             return "Galaxy A3 (2017)"
                case .galaxya52016:             return "Galaxy A5 (2016)"
                case .galaxya52017:             return "Galaxy A5 (2017)"
                case .galaxya5a500:             return "Galaxy A5 A500"
                case .galaxya62018:             return "Galaxy A6 (2018)"
                case .galaxya62018plus:         return "Galaxy A6+ (2018)"
                case .galaxya6s:                return "Galaxy A6s"
                case .galaxya72016:             return "Galaxy A7 (2016)"
                case .galaxya72017:             return "Galaxy A7 (2017)"
                case .galaxya72018:             return "Galaxy A7 (2018)"
                case .galaxya7a700:             return "Galaxy A7 A700"
                case .galaxya82015:             return "Galaxy A8 (2015)"
                case .galaxya82016:             return "Galaxy A8 (2016)"
                case .galaxya82018:             return "Galaxy A8 (2018)"
                case .galaxya82018plus:         return "Galaxy A8+ (2018)"
                case .galaxya8s:                return "Galaxy A8s"
                case .galaxya92018:             return "Galaxy A9 (2018)"
                case .galaxya9pro2016:          return "Galaxy A9 Pro (2016)"
                case .galaxya10:                return "Galaxy A10"
                case .galaxya10e:               return "Galaxy A10e"
                case .galaxya10s:               return "Galaxy A10s"
                case .galaxya11:                return "Galaxy A11"
                case .galaxya12:                return "Galaxy A12"
                case .galaxya13:                return "Galaxy A13"
                case .galaxya14:                return "Galaxy A14"
                case .galaxya15:                return "Galaxy A15"
                case .galaxya20:                return "Galaxy A20"
                case .galaxya20e:               return "Galaxy A20e"
                case .galaxya20s:               return "Galaxy A20s"
                case .galaxya21s:               return "Galaxy A21s"
                case .galaxya22:                return "Galaxy A22"
                case .galaxya23:                return "Galaxy A23"
                case .galaxya24:                return "Galaxy A24"
                case .galaxya25:                return "Galaxy A25"
                case .galaxya30:                return "Galaxy A30"
                case .galaxya30s:               return "Galaxy A30s"
                case .galaxya31:                return "Galaxy A31"
                case .galaxya32:                return "Galaxy A32"
                case .galaxya33:                return "Galaxy A33"
                case .galaxya34:                return "Galaxy A34"
                case .galaxya35:                return "Galaxy A35"
                case .galaxya40:                return "Galaxy A40"
                case .galaxya41:                return "Galaxy A41"
                case .galaxya50:                return "Galaxy A50"
                case .galaxya51:                return "Galaxy A51"
                case .galaxya52:                return "Galaxy A52"
                case .galaxya52s:               return "Galaxy A52s"
                case .galaxya53:                return "Galaxy A53"
                case .galaxya54:                return "Galaxy A54"
                case .galaxya55:                return "Galaxy A55"
                case .galaxya70:                return "Galaxy A70"
                case .galaxya71:                return "Galaxy A71"
                case .galaxya72:                return "Galaxy A72"
                case .galaxya73:                return "Galaxy A73"
                case .galaxya80:                return "Galaxy A80"
                case .galaxyaces5830:           return "Galaxy Ace S5830"
                case .galaxyaces5830i:          return "Galaxy Ace S5830i"
                case .galaxyace2i8160:          return "Galaxy Ace 2 i8160"
                case .galaxyace4g313:           return "Galaxy Ace 4 G313"
                case .galaxyalphag850:          return "Galaxy Alpha G850"
                case .galaxyc5:                 return "Galaxy C5"
                case .galaxyc5pro:              return "Galaxy C5 Pro"
                case .galaxyc7:                 return "Galaxy C7"
                case .galaxyc7pro:              return "Galaxy C7 Pro"
                case .galaxyc8:                 return "Galaxy C8"
                case .galaxyc9pro:              return "Galaxy C9 Pro"
                case .galaxycorei8262:          return "Galaxy Core i8262"
                case .galaxycoreprimeg360:      return "Galaxy Core Prime G360"
                case .galaxye5e500:             return "Galaxy E5 E500"
                case .galaxye7e700:             return "Galaxy E7 E700"
                case .galaxyfames6810:          return "Galaxy Fame S6810"
                case .galaxyfits5670:           return "Galaxy Fit S5670"
                case .galaxyfold:               return "Galaxy Fold"
                case .galaxygios5660:           return "Galaxy Gio S5660"
                case .galaxygrandi9082:         return "Galaxy Grand i9082"
                case .galaxygrandmaxg720:       return "Galaxy Grand Max G720"
                case .galaxygrandneoplusi9060:  return "Galaxy Grand Neo Plus i9060"
                case .galaxygrandprimeg530:     return "Galaxy Grand Prime G530"
                case .galaxygrandprimeg532:     return "Galaxy Grand Prime G532"
                case .galaxygrandprimeplus:     return "Galaxy Grand Prime Plus"
                case .galaxygrandprimepro:      return "Galaxy Grand Prime Pro"
                case .galaxygrand2g710:         return "Galaxy Grand 2 G710"
                case .galaxyj1ace:              return "Galaxy J1 Ace"
                case .galaxyj1j100:             return "Galaxy J1 J100"
                case .galaxyj1j120:             return "Galaxy J1 J120"
                case .galaxyj1miniprime:        return "Galaxy J1 Mini Prime"
                case .galaxyj22016:             return "Galaxy J2 (2016)"
                case .galaxyj22017:             return "Galaxy J2 (2017)"
                case .galaxyj22018:             return "Galaxy J2 (2018)"
                case .galaxyj2core2020:         return "Galaxy J2 Core (2020)"
                case .galaxyj2j200:             return "Galaxy J2 J200"
                case .galaxyj2prime:            return "Galaxy J2 Prime"
                case .galaxyj32016:             return "Galaxy J3 (2016)"
                case .galaxyj32017:             return "Galaxy J3 (2017)"
                case .galaxyj3pro:              return "Galaxy J3 Pro"
                case .galaxyj4:                 return "Galaxy J4+"
                case .galaxyj4core:             return "Galaxy J4 Core"
                case .galaxyj4j400:             return "Galaxy J4 J400"
                case .galaxyj52016:             return "Galaxy J5 (2016)"
                case .galaxyj52017:             return "Galaxy J5 (2017)"
                case .galaxyj5j500:             return "Galaxy J5 J500"
                case .galaxyj5primeg570:        return "Galaxy J5 Prime G570"
                case .galaxyj5pro:              return "Galaxy J5 Pro"
                case .galaxyj6:                 return "Galaxy J6"
                case .galaxyj6plus:             return "Galaxy J6+"
                case .galaxyj72016:             return "Galaxy J7 (2016)"
                case .galaxyj72017:             return "Galaxy J7 (2017)"
                case .galaxyj7core:             return "Galaxy J7 Core"
                case .galaxyj7duo:              return "Galaxy J7 Duo"
                case .galaxyj7j700:             return "Galaxy J7 J700"
                case .galaxyj7max:              return "Galaxy J7 Max"
                case .galaxyj7prime:            return "Galaxy J7 Prime"
                case .galaxyj7prime2:           return "Galaxy J7 Prime 2"
                case .galaxyj7pro:              return "Galaxy J7 Pro"
                case .galaxyj8j810:             return "Galaxy J8 J810"
                case .galaxykzoomc115:          return "Galaxy K zoom C115"
                case .galaxym02:                return "Galaxy M02"
                case .galaxym10:                return "Galaxy M10"
                case .galaxym10s:               return "Galaxy M10s"
                case .galaxym11:                return "Galaxy M11"
                case .galaxym12:                return "Galaxy M12"
                case .galaxym13:                return "Galaxy M13"
                case .galaxym14:                return "Galaxy M14"
                case .galaxym15:                return "Galaxy M15"
                case .galaxym20:                return "Galaxy M20"
                case .galaxym21:                return "Galaxy M21"
                case .galaxym22:                return "Galaxy M22"
                case .galaxym23:                return "Galaxy M23"
                case .galaxym30:                return "Galaxy M30"
                case .galaxym30s:               return "Galaxy M30s"
                case .galaxym31:                return "Galaxy M31"
                case .galaxym31s:               return "Galaxy M31s"
                case .galaxym32:                return "Galaxy M32"
                case .galaxym335g:              return "Galaxy M33 5G"
                case .galaxym345g:              return "Galaxy M34 5G"
                case .galaxym40:                return "Galaxy M40"
                case .galaxym51:                return "Galaxy M51"
                case .galaxym52:                return "Galaxy M52"
                case .galaxymega63i9200:        return "Galaxy Mega 6.3 i9200"
                case .galaxyminis5570:          return "Galaxy Mini S5570"
                case .galaxymini2s6500:         return "Galaxy Mini 2 S6500"
                case .galaxynotefanedition:     return "Galaxy Note Fan Edition"
                case .galaxynoteedgen915:       return "Galaxy Note Edge N915"
                case .galaxynote2n7100:         return "Galaxy Note 2 N7100"
                case .galaxynote3n9000:         return "Galaxy Note 3 N9000"
                case .galaxynote3n9000q:        return "Galaxy Note 3 N9000Q"
                case .galaxynote3n9005:         return "Galaxy Note 3 N9005"
                case .galaxynote3neon750:       return "Galaxy Note 3 Neo N750"
                case .galaxynote4n910:          return "Galaxy Note 4 N910"
                case .galaxynote5n920:          return "Galaxy Note 5 N920"
                case .galaxynote5duos:          return "Galaxy Note 5 Duos"
                case .galaxynote7n930:          return "Galaxy Note 7 N930"
                case .galaxynote8n950:          return "Galaxy Note 8 N950"
                case .galaxynote8duos:          return "Galaxy Note 8 Duos"
                case .galaxynote9n960:          return "Galaxy Note 9 N960"
                case .galaxynote10:             return "Galaxy Note 10"
                case .galaxynote10plus:         return "Galaxy Note 10+"
                case .galaxynote105g:           return "Galaxy Note 10+ 5G"
                case .galaxynote10lite:         return "Galaxy Note10 Lite"
                case .galaxynote20:             return "Galaxy Note 20"
                case .galaxynote205g:           return "Galaxy Note 20 5G"
                case .galaxynote20ultra:        return "Galaxy Note 20 Ultra"
                case .galaxynote20ultra5g:      return "Galaxy Note 20 Ultra 5G"
                case .galaxyon5:                return "Galaxy On5"
                case .galaxyon7:                return "Galaxy On7"
                case .galaxyon7prime:           return "Galaxy On7 Prime"
                case .galaxypockets5300:        return "Galaxy Pocket S5300"
                case .galaxypocketpluss5301:    return "Galaxy Pocket Plus S5301"
                case .galaxyprob7510:           return "Galaxy Pro B7510"
                case .galaxys4gt959v:           return "Galaxy S 4G T959V"
                case .galaxysadvancei9070:      return "Galaxy S Advance i9070"
                case .galaxysduoss7562:         return "Galaxy S Duos S7562"
                case .galaxysi9000:             return "Galaxy S i9000"
                case .galaxysplusi9001:         return "Galaxy S Plus i9001"
                case .galaxys2i9100:            return "Galaxy S2 i9100"
                case .galaxys3i9300:            return "Galaxy S3 i9300"
                case .galaxys3minii8190:        return "Galaxy S3 Mini i8190"
                case .galaxys3minivalueeditioni8200: return "Galaxy S3 Mini Value Edition i8200"
                case .galaxys3neoi9301:         return "Galaxy S3 Neo i9301"
                case .galaxys3slimg3812b:       return "Galaxy S3 Slim G3812B"
                case .galaxys4activei9295:      return "Galaxy S4 Active i9295"
                case .galaxys4i9500:            return "Galaxy S4 i9500"
                case .galaxys4minii9190:        return "Galaxy S4 Mini i9190"
                case .galaxys4zoomc101:         return "Galaxy S4 Zoom C101"
                case .galaxys5g900:             return "Galaxy S5 G900"
                case .galaxys5minig800f:        return "Galaxy S5 mini G800F"
                case .galaxys5neog903:          return "Galaxy S5 Neo G903"
                case .galaxys5plusg901f:        return "Galaxy S5 Plus G901F"
                case .galaxys6g920:             return "Galaxy S6 G920"
                case .galaxys6edgeg925:         return "Galaxy S6 Edge G925"
                case .galaxys6edgeg928:         return "Galaxy S6 edge+ G928"
                case .galaxys7active:           return "Galaxy S7 Active"
                case .galaxys7g930:             return "Galaxy S7 G930"
                case .galaxys7edgeg935:         return "Galaxy S7 Edge G935"
                case .galaxys8g955:             return "Galaxy S8+ G955"
                case .galaxys8g950:             return "Galaxy S8 G950"
                case .galaxys9g965:             return "Galaxy S9+ G965"
                case .galaxys9g960:             return "Galaxy S9 G960"
                case .galaxys10:                return "Galaxy S10"
                case .galaxys105g:              return "Galaxy S10 5G"
                case .galaxys10e:               return "Galaxy S10e"
                case .galaxys10lite:            return "Galaxy S10 Lite"
                case .galaxys10plus:            return "Galaxy S10 Plus"
                case .galaxys20:                return "Galaxy S20"
                case .galaxys20btsedition:      return "Galaxy S20+ BTS Edition"
                case .galaxys20fe:              return "Galaxy S20 FE"
                case .galaxys20plus:            return "Galaxy S20 Plus"
                case .galaxys20ultra:           return "Galaxy S20 Ultra"
                case .galaxys21:                return "Galaxy S21"
                case .galaxys21fe:              return "Galaxy S21 FE"
                case .galaxys21plus:            return "Galaxy S21 Plus"
                case .galaxys21ultra:           return "Galaxy S21 Ultra"
                case .galaxys22:                return "Galaxy S22"
                case .galaxys22plus:            return "Galaxy S22 Plus"
                case .galaxys22ultra:           return "Galaxy S22 Ultra"
                case .galaxys23:                return "Galaxy S23"
                case .galaxys23fe:              return "Galaxy S23 FE"
                case .galaxys23plus:            return "Galaxy S23 Plus"
                case .galaxys23ultra:           return "Galaxy S23 Ultra"
                case .galaxys24:                return "Galaxy S24"
                case .galaxys24plus:            return "Galaxy S24 Plus"
                case .galaxys24ultra:           return "Galaxy S24 Ultra"
                case .galaxyspicai5700:         return "Galaxy Spica i5700"
                case .galaxystars5280:          return "Galaxy Star S5280"
                case .galaxytrends7560:         return "Galaxy Trend S7560"
                case .galaxytrendlites7390:     return "Galaxy Trend Lite S7390"
                case .galaxytrendpluss7580:     return "Galaxy Trend Plus S7580"
                case .galaxywini8552:           return "Galaxy Win i8552"
                case .galaxywonderi8150:        return "Galaxy Wonder i8150"
                case .galaxyxcover2s7710:       return "Galaxy Xcover 2 S7710"
                case .galaxyxcover4:            return "Galaxy Xcover 4"
                case .galaxyxcover7:            return "Galaxy Xcover 7"
                case .galaxyxcoverpro:          return "Galaxy Xcover Pro"
                case .galaxyys5360:             return "Galaxy Y S5360"
                case .galaxyyprob5510:          return "Galaxy Y Pro B5510"
                case .galaxyyoungs6310:         return "Galaxy Young S6310"
                case .galaxyzflip:              return "Galaxy Z Flip"
                case .galaxyzflip3:              return "Galaxy Z Flip 3"
                case .galaxyzflip4:              return "Galaxy Z Flip 4"
                case .galaxyzflip5:              return "Galaxy Z Flip 5"
                case .galaxyzflip6:              return "Galaxy Z Flip 6"
                case .galaxyzfold2:              return "Galaxy Z Fold 2"
                case .galaxyzfold3:              return "Galaxy Z Fold 3"
                case .galaxyzfold4:              return "Galaxy Z Fold 4"
                case .galaxyzfold5:              return "Galaxy Z Fold 5"
                case .galaxyzfold6:              return "Galaxy Z Fold 6"
                case .modal600:                 return "600"
                case .a177:                     return "A177"
                case .a717:                     return "A717"
                case .a800:                     return "A800"
                case .b130:                     return "B130"
                case .b2100xplorer:             return "B2100 Xplorer"
                case .b310:                     return "B310"
                case .b312metro:                return "B312 Metro"
                case .b3310:                    return "B3310"
                case .b3410corbyplus:           return "B3410 Corby Plus"
                case .b350e:                    return "B350E"
                case .b5310corbypro:            return "B5310 Corby Pro"
                case .b5722:                    return "B5722"
                case .b7300omnialite:           return "B7300 Omnia Lite"
                case .b7320omniapro:            return "B7320 OmniaPRO"
                case .b7722:                    return "B7722"
                case .bangolufsenserenata:      return "Bang & Olufsen Serenata"
                case .c100:                     return "C100"
                case .c160:                     return "C160"
                case .c230:                     return "C230"
                case .c260:                     return "C260"
                case .c270:                     return "C270"
                case .c300:                     return "C300"
                case .c3010:                    return "C3010"
                case .c3010s:                   return "C3010S"
                case .c3050:                    return "C3050"
                case .c3053:                    return "C3053"
                case .c3200montebar:            return "C3200 Monte Bar"
                case .c3212:                    return "C3212"
                case .c322chat:                 return "C322 Chat"
                case .c3300champ:               return "C3300 Champ"
                case .c3303kchamp:              return "C3303K Champ"
                case .c3310rrex60:              return "C3310R Rex 60"
                case .c3322metroduos:           return "C3322 Metro Duos"
                case .c3500:                    return "C3500"
                case .c3510genoa:               return "C3510 Genoa"
                case .c3520:                    return "C3520"
                case .c3530:                    return "C3530"
                case .c3560:                    return "C3560"
                case .c3780:                    return "C3780"
                case .c450:                     return "C450"
                case .c5010squash:              return "C5010 Squash"
                case .c5130:                    return "C5130"
                case .c5212:                    return "C5212"
                case .c6112:                    return "C6112"
                case .c6712stariiduos:          return "C6712 Star II Duos"
                case .d410:                     return "D410"
                case .d500:                     return "D500"
                case .d520:                     return "D520"
                case .d600:                     return "D600"
                case .d720:                     return "D720"
                case .d780:                     return "D780"
                case .d800:                     return "D800"
                case .d830:                     return "D830"
                case .d840:                     return "D840"
                case .d880:                     return "D880"
                case .d900:                     return "D900"
                case .d900i:                    return "D900i"
                case .d980:                     return "D980"
                case .e1050:                    return "E1050"
                case .e1070:                    return "E1070"
                case .e1080t:                   return "E1080T"
                case .e1081t:                   return "E1081T"
                case .e1085:                    return "E1085"
                case .e1105:                    return "E1105"
                case .e1120:                    return "E1120"
                case .e1150:                    return "E1150"
                case .e1180:                    return "E1180"
                case .e1190:                    return "E1190"
                case .e1205:                    return "E1205"
                case .e1210:                    return "E1210"
                case .e1270:                    return "E1270"
                case .e1282:                    return "E1282"
                case .e1310:                    return "E1310"
                case .e1360:                    return "E1360"
                case .e200:                     return "E200"
                case .e2120:                    return "E2120"
                case .e2121:                    return "E2121"
                case .e2152:                    return "E2152"
                case .e2200:                    return "E2200"
                case .e2202:                    return "E2202"
                case .e2220:                    return "E2220"
                case .e2232duos:                return "E2232 Duos"
                case .e2250:                    return "E2250"
                case .e2350b:                   return "E2350B"
                case .e250:                     return "E250"
                case .e2550monteslider:         return "E2550 Monte Slider"
                case .e2652champduos:           return "E2652 Champ Duos"
                case .e2652wchampduos:          return "E2652W Champ Duos"
                case .e3210:                    return "E3210"
                case .e360:                     return "E360"
                case .e490:                     return "E490"
                case .e630:                     return "E630"
                case .e830:                     return "E830"
                case .e840:                     return "E840"
                case .e910bangolufsen:          return "E910 Bang & Olufsen"
                case .f300:                     return "F300"
                case .f400:                     return "F400"
                case .f480:                     return "F480"
                case .f480i:                    return "F480i"
                case .g600:                     return "G600"
                case .g810:                     return "G810"
                case .i200:                     return "i200"
                case .i550:                     return "i550"
                case .i550w:                    return "i550w"
                case .i560:                     return "i560"
                case .i600:                     return "i600"
                case .i8000omniaii:             return "i8000 Omnia II"
                case .i8910omniahd:             return "i8910 Omnia HD"
                case .i900omnia:                return "i900 Omnia"
                case .j150:                     return "J150"
                case .j210:                     return "J210"
                case .j750:                     return "J750"
                case .l700:                     return "L700"
                case .l700i:                    return "L700i"
                case .l760:                     return "L760"
                case .l770:                     return "L770"
                case .m150:                     return "M150"
                case .m300:                     return "M300"
                case .m310:                     return "M310"
                case .m3510:                    return "M3510"
                case .m5650lindy:               return "M5650 Lindy"
                case .m620:                     return "M620"
                case .m7603beatdj:              return "M7603 Beat Dj"
                case .m8800:                    return "M8800"
                case .n500da:                   return "N500DA"
                case .n700:                     return "N700"
                case .n710:                     return "N710"
                case .p300:                     return "P300"
                case .p310:                     return "P310"
                case .p510:                     return "P510"
                case .p520giorgioarmani:        return "P520 Giorgio Armani"
                case .p850:                     return "P850"
                case .s3100:                    return "S3100"
                case .s3222:                    return "S3222"
                case .s3350chat:                return "S3350 Chat"
                case .s3353trevi:               return "S3353 Trevi"
                case .s3500:                    return "S3500"
                case .s3570chat:                return "S3570 Chat"
                case .s3600:                    return "S3600"
                case .s3650corby:               return "S3650 Corby"
                case .s3653corby:               return "S3653 Corby"
                case .s3653wcorbywifi:          return "S3653W Corby Wi-Fi"
                case .s3850corbyii:             return "S3850 Corby II"
                case .s5200:                    return "S5200"
                case .s5220star3:               return "S5220 Star 3"
                case .s5230star:                return "S5230 Star"
                case .s5233:                    return "S5233"
                case .s5233w:                   return "S5233W"
                case .s5253wave:                return "S5253 Wave"
                case .s5260starii:              return "S5260 Star II"
                case .s5270chat:                return "S5270 Chat"
                case .s5350shark:               return "S5350 Shark"
                case .s5550sharkamoled:         return "S5550 Shark Amoled"
                case .s5610k:                   return "S5610K"
                case .s5620monte:               return "S5620 Monte"
                case .s7230ewave:               return "S7230E Wave"
                case .s7233:                    return "S7233"
                case .s7233ewave:               return "S7233E Wave"
                case .s7250wavem:               return "S7250 Wave M"
                case .s7330:                    return "S7330"
                case .s7350ultras:              return "S7350 Ultra S"
                case .s8003:                    return "S8003"
                case .s8300ultratouch:          return "S8300 UltraTouch"
                case .s8500wave:                return "S8500 Wave"
                case .s8530wave2:               return "S8530 Wave 2"
                case .s8600wave3:               return "S8600 Wave 3"
                case .s9402ego:                 return "S9402 Ego"
                case .t100:                     return "T100"
                case .u600:                     return "U600"
                case .u700:                     return "U700"
                case .u800:                     return "U800"
                case .x100:                     return "X100"
                case .x150:                     return "X150"
                case .x160:                     return "X160"
                case .x200:                     return "X200"
                case .x210:                     return "X210"
                case .x300:                     return "X300"
                case .x430:                     return "X430"
                case .x460:                     return "X460"
                case .x510:                     return "X510"
                case .x540:                     return "X540"
                case .x600:                     return "X600"
                case .x620:                     return "X620"
                case .x650:                     return "X650"
                case .x660:                     return "X660"
                case .x700:                     return "X700"
                case .x810:                     return "X810"
                case .x820:                     return "X820"
                case .x830:                     return "X830"
                case .z3:                       return "Z3"
                case .z370:                     return "Z370"
                case .zv60:                     return "ZV60"
                case .modal3053:                return "3053"
                }
            }
        }
        
        enum Sharp: String, Describer, CaseIterable, Codable {
            case aquosr2
            case aquosr6
            case aquosr7
            case other
            
            func describe() -> String {
                switch self {
                case .aquosr2:                  return "Aquos R2"
                case .aquosr6:                  return "Aquos R6"
                case .aquosr7:                  return "Aquos R7"
                case .other:                    return "Diğer"
                }
            }
        }
        
        enum Sony: String, Describer, CaseIterable, Codable {
            case xperia1
            case xperia1ii
            case xperia1iii
            case xperia1iv
            case xperia1vi
            case xperia5
            case xperia5ii
            case xperia5iii
            case xperia5iv
            case xperia10ii
            case xperia10iii
            case xperia10v
            case xperia10vi
            case xperiac4
            case xperiac5ultra
            case xperiae
            case xperiae1
            case xperiae4
            case xperiae4g
            case xperiae5
            case xperiaionhspa
            case xperial
            case xperial1
            case xperiam
            case xperiam2
            case xperiam4aqua
            case xperiam5
            case xperiamiro
            case xperianeol
            case xperiap
            case xperiaproi
            case xperias
            case xperiasola
            case xperiasp
            case xperiatipo
            case xperiatx
            case xperiau
            case xperiax
            case xperiaxa
            case xperiaxa1
            case xperiaxa1plus
            case xperiaxa1ultra
            case xperiaxaultra
            case xperiaxcompact
            case xperiaxz
            case xperiaxz1
            case xperiaxz2
            case xperiaxz3
            case xperiaxzpremium
            case xperiaz
            case xperiaz1
            case xperiaz1compact
            case xperiaz2
            case xperiaz3
            case xperiaz3compact
            case xperiaz5
            case xperiaz5compact
            case xperiaz5dual
            case xperiaz5premium
            case xperiaz5premiumdual
            case xperiazultra
            
            func describe() -> String {
                switch self {
                case .xperia1:                  return "Xperia 1"
                case .xperia1ii:                return "Xperia 1 II"
                case .xperia1iii:               return "Xperia 1 III"
                case .xperia1iv:                return "Xperia 1 IV"
                case .xperia1vi:                return "Xperia 1 VI"
                case .xperia5:                  return "Xperia 5"
                case .xperia5ii:                return "Xperia 5 II"
                case .xperia5iii:               return "Xperia 5 III"
                case .xperia5iv:                return "Xperia 5 IV"
                case .xperia10ii:               return "Xperia 10 II"
                case .xperia10iii:              return "Xperia 10 III"
                case .xperia10v:                return "Xperia 10 V"
                case .xperia10vi:               return "Xperia 10 VI"
                case .xperiac4:                 return "Xperia C4"
                case .xperiac5ultra:            return "Xperia C5 Ultra"
                case .xperiae:                  return "Xperia E"
                case .xperiae1:                 return "Xperia E1"
                case .xperiae4:                 return "Xperia E4"
                case .xperiae4g:                return "Xperia E4 G"
                case .xperiae5:                 return "Xperia E5"
                case .xperiaionhspa:            return "Xperia ion HSPA"
                case .xperial:                  return "Xperia L"
                case .xperial1:                 return "Xperia L1"
                case .xperiam:                  return "Xperia M"
                case .xperiam2:                 return "Xperia M2"
                case .xperiam4aqua:             return "Xperia M4 Aqua"
                case .xperiam5:                 return "Xperia M5"
                case .xperiamiro:               return "Xperia Miro"
                case .xperianeol:               return "Xperia Neo L"
                case .xperiap:                  return "Xperia P"
                case .xperiaproi:               return "Xperia Pro-I"
                case .xperias:                  return "Xperia S"
                case .xperiasola:               return "Xperia Sola"
                case .xperiasp:                 return "Xperia SP"
                case .xperiatipo:               return "Xperia Tipo"
                case .xperiatx:                 return "Xperia TX"
                case .xperiau:                  return "Xperia U"
                case .xperiax:                  return "Xperia X"
                case .xperiaxa:                 return "Xperia XA"
                case .xperiaxa1:                return "Xperia XA1"
                case .xperiaxa1plus:            return "Xperia XA1 Plus"
                case .xperiaxa1ultra:           return "Xperia XA1 Ultra"
                case .xperiaxaultra:            return "Xperia XA Ultra"
                case .xperiaxcompact:           return "Xperia X Compact"
                case .xperiaxz:                 return "Xperia XZ"
                case .xperiaxz1:                return "Xperia XZ1"
                case .xperiaxz2:                return "Xperia XZ2"
                case .xperiaxz3:                return "Xperia XZ3"
                case .xperiaxzpremium:          return "Xperia XZ Premium"
                case .xperiaz:                  return "Xperia Z"
                case .xperiaz1:                 return "Xperia Z1"
                case .xperiaz1compact:          return "Xperia Z1 Compact"
                case .xperiaz2:                 return "Xperia Z2"
                case .xperiaz3:                 return "Xperia Z3"
                case .xperiaz3compact:          return "Xperia Z3 Compact"
                case .xperiaz5:                 return "Xperia Z5"
                case .xperiaz5compact:          return "Xperia Z5 Compact"
                case .xperiaz5dual:             return "Xperia Z5 Dual"
                case .xperiaz5premium:          return "Xperia Z5 Premium"
                case .xperiaz5premiumdual:      return "Xperia Z5 Premium Dual"
                case .xperiazultra:             return "Xperia Z Ultra"
                }
            }
        }
        
        enum Sonyericsson: String, Describer, CaseIterable, Codable {
            case a1018
            case a2618
            case a3618
            case ainou10i
            case c510
            case c902
            case c903
            case c905
            case cd5
            case ck13itxt
            case d750i
            case g502
            case g705
            case g705i
            case gh197
            case gh198
            case gh388
            case hazel
            case j100i
            case j120i
            case j210i
            case j220i
            case jalou
            case k300i
            case k310i
            case k510i
            case k530i
            case k550i
            case k600i
            case k610i
            case k700i
            case k750i
            case k770i
            case k790i
            case k800i
            case k810i
            case k850i
            case m600i
            case p1
            case p910i
            case p990i
            case r250pro
            case r310s
            case r320s
            case r380world
            case r520m
            case s312
            case s700i
            case satioidouu1
            case sh888
            case t100
            case t105
            case t10s
            case t18
            case t200
            case t20s
            case t230
            case t250i
            case t28s
            case t290i
            case t29s
            case t300
            case t303
            case t39m
            case t600
            case t610
            case t630
            case t65
            case t66
            case t68
            case t68i
            case t700
            case t707
            case v600i
            case v630i
            case w100ispiro
            case w200i
            case w205
            case w300i
            case w302i
            case w550i
            case w580i
            case w595
            case w595i
            case w700i
            case w705
            case w800i
            case w810i
            case w850i
            case w880i
            case w890i
            case w900i
            case w910i
            case w950i
            case w960i
            case w980i
            case wt13imixwalkman
            case wt19ilivewithwalkman
            case xperiaactive
            case xperiaarc
            case xperiaarcs
            case xperiamini
            case xperiaminipro
            case xperianeov
            case xperiaplay
            case xperiaray
            case xperiax10
            case xperiax10mini
            case xperiax10minipro
            case xperiax8
            case z200
            case z300i
            case z320i
            case z5
            case z530i
            case z550i
            case z555i
            case z600
            case z610i
            case z7
            case z710i
            case z750a
            case z800i
            case zylo
            case modal337
            case modal688
            case modal768
            case modal888
            case modal960i
            case ga628
            
            func describe() -> String {
                switch self {
                case .a1018:                return "A1018"
                case .a2618:                return "A2618"
                case .a3618:                return "A3618"
                case .ainou10i:             return "Aino (U10i)"
                case .c510:                 return "C510"
                case .c902:                 return "C902"
                case .c903:                 return "C903"
                case .c905:                 return "C905"
                case .cd5:                  return "CD5"
                case .ck13itxt:             return "CK13i txt"
                case .d750i:                return "D750i"
                case .g502:                 return "G502"
                case .g705:                 return "G705"
                case .g705i:                return "G705i"
                case .gh197:                return "GH197"
                case .gh198:                return "GH198"
                case .gh388:                return "GH388"
                case .hazel:                return "Hazel"
                case .j100i:                return "J100i"
                case .j120i:                return "J120i"
                case .j210i:                return "J210i"
                case .j220i:                return "J220i"
                case .jalou:                return "Jalou"
                case .k300i:                return "K300i"
                case .k310i:                return "K310i"
                case .k510i:                return "K510i"
                case .k530i:                return "K530i"
                case .k550i:                return "K550i"
                case .k600i:                return "K600i"
                case .k610i:                return "K610i"
                case .k700i:                return "K700i"
                case .k750i:                return "K750i"
                case .k770i:                return "K770i"
                case .k790i:                return "K790i"
                case .k800i:                return "K800i"
                case .k810i:                return "K810i"
                case .k850i:                return "K850i"
                case .m600i:                return "M600i"
                case .p1:                   return "P1"
                case .p910i:                return "P910i"
                case .p990i:                return "P990i"
                case .r250pro:              return "R250 Pro"
                case .r310s:                return "R310s"
                case .r320s:                return "R320s"
                case .r380world:            return "R380 World"
                case .r520m:                return "R520m"
                case .s312:                 return "S312"
                case .s700i:                return "S700i"
                case .satioidouu1:          return "Satio (Idou U1)"
                case .sh888:                return "SH888"
                case .t100:                 return "T100"
                case .t105:                 return "T105"
                case .t10s:                 return "T10s"
                case .t18:                  return "T18"
                case .t200:                 return "T200"
                case .t20s:                 return "T20s"
                case .t230:                 return "T230"
                case .t250i:                return "T250i"
                case .t28s:                 return "T28s"
                case .t290i:                return "T290i"
                case .t29s:                 return "T29s"
                case .t300:                 return "T300"
                case .t303:                 return "T303"
                case .t39m:                 return "T39M"
                case .t600:                 return "T600"
                case .t610:                 return "T610"
                case .t630:                 return "T630"
                case .t65:                  return "T65"
                case .t66:                  return "T66"
                case .t68:                  return "T68"
                case .t68i:                 return "T68i"
                case .t700:                 return "T700"
                case .t707:                 return "T707"
                case .v600i:                return "V600i"
                case .v630i:                return "V630i"
                case .w100ispiro:           return "W100i Spiro"
                case .w200i:                return "W200i"
                case .w205:                 return "W205"
                case .w300i:                return "W300i"
                case .w302i:                return "W302i"
                case .w550i:                return "W550i"
                case .w580i:                return "W580i"
                case .w595:                 return "W595"
                case .w595i:                return "W595i"
                case .w700i:                return "W700i"
                case .w705:                 return "W705"
                case .w800i:                return "W800i"
                case .w810i:                return "W810i"
                case .w850i:                return "W850i"
                case .w880i:                return "W880i"
                case .w890i:                return "W890i"
                case .w900i:                return "W900i"
                case .w910i:                return "W910i"
                case .w950i:                return "W950i"
                case .w960i:                return "W960i"
                case .w980i:                return "W980i"
                case .wt13imixwalkman:      return "WT13I Mix Walkman"
                case .wt19ilivewithwalkman: return "WT19i Live with Walkman"
                case .xperiaactive:         return "Xperia Active"
                case .xperiaarc:            return "Xperia Arc"
                case .xperiaarcs:           return "Xperia Arc S"
                case .xperiamini:           return "Xperia Mini"
                case .xperiaminipro:        return "Xperia Mini Pro"
                case .xperianeov:           return "Xperia Neo V"
                case .xperiaplay:           return "Xperia Play"
                case .xperiaray:            return "Xperia Ray"
                case .xperiax10:            return "Xperia X10"
                case .xperiax10mini:        return "Xperia X10 mini"
                case .xperiax10minipro:     return "Xperia X10 mini pro"
                case .xperiax8:             return "Xperia X8"
                case .z200:                 return "Z200"
                case .z300i:                return "Z300i"
                case .z320i:                return "Z320i"
                case .z5:                   return "Z5"
                case .z530i:                return "Z530i"
                case .z550i:                return "Z550i"
                case .z555i:                return "Z555i"
                case .z600:                 return "Z600"
                case .z610i:                return "Z610i"
                case .z7:                   return "Z7"
                case .z710i:                return "Z710i"
                case .z750a:                return "Z750a"
                case .z800i:                return "Z800i"
                case .zylo:                 return "Zylo"
                case .modal337:             return "337"
                case .modal688:             return "688"
                case .modal768:             return "768"
                case .modal888:             return "888"
                case .modal960i:            return "960i"
                case .ga628:                return "GA 628"
                }
            }
        }
    
        
        enum Tagheuer: String, Describer, CaseIterable, Codable {
            case meridiist
            
            func describe() -> String {
                switch self {
                case .meridiist:           return "Meridiist"
                }
            }
        }
        
        enum Tcl: String, Describer, CaseIterable, Codable {
            case modal10l
            case modal10plus
            case modal10pro
            case modal10se
            case modal20e
            case modal20l
            case modal20pro
            case modal20se
            case modal30
            case modal303
            case modal30plus
            case modal30se
            case modal4022s
            case l7
            case plex
            
            func describe() -> String {
                switch self {
                case .modal10l:             return "10L"
                case .modal10plus:          return "10 Plus"
                case .modal10pro:           return "10 Pro"
                case .modal10se:            return "10 SE"
                case .modal20e:             return "20 E"
                case .modal20l:             return "20L+"
                case .modal20pro:           return "20 Pro"
                case .modal20se:            return "20 SE"
                case .modal30:              return "30"
                case .modal303:             return "303"
                case .modal30plus:          return "30 Plus"
                case .modal30se:            return "30 SE"
                case .modal4022s:           return "4022 S"
                case .l7:                   return "L7"
                case .plex:                 return "Plex"
                }
            }
        }
        
        enum Tecno: String, Describer, CaseIterable, Codable {
            case camon16
            case camon17pro
            case camon18
            case camon18p
            case camon18premier
            case camon19
            case camon19neo
            case camon19pro
            case camon20
            case camon20premier
            case camon20pro
            case camon20spro5g
            case camon30
            case camon30pro
            case phantomvflip
            case phantomvfold
            case phantomx
            case phantomx2
            case phantomx2pro
            case pova
            case pova3
            case pova4
            case pova5
            case pova6
            case pova6pro
            case povaneo
            case povaneo2
            case spark6
            case spark6go
            case spark7pro
            case spark7t
            case spark8
            case spark8c
            case spark8p
            case spark8t
            case spark9pro
            case spark10
            case spark10pro
            case spark20
            case spark20c
            case spark20pro
            case sparkgo2023
            case sparkgo2024
            
            func describe() -> String {
                switch self {
                case .camon16:               return "Camon 16"
                case .camon17pro:            return "Camon 17 Pro"
                case .camon18:               return "Camon 18"
                case .camon18p:              return "Camon 18P"
                case .camon18premier:        return "Camon 18 Premier"
                case .camon19:               return "Camon 19"
                case .camon19neo:            return "Camon 19 Neo"
                case .camon19pro:            return "Camon 19 Pro"
                case .camon20:               return "Camon 20"
                case .camon20premier:        return "Camon 20 Premier"
                case .camon20pro:            return "Camon 20 Pro"
                case .camon20spro5g:         return "Camon 20S Pro 5G"
                case .camon30:               return "Camon 30"
                case .camon30pro:            return "Camon 30 Pro"
                case .phantomvflip:          return "Phantom V Flip"
                case .phantomvfold:          return "Phantom V Fold"
                case .phantomx:              return "Phantom X"
                case .phantomx2:             return "Phantom X2"
                case .phantomx2pro:          return "Phantom X2 Pro"
                case .pova:                  return "Pova"
                case .pova3:                 return "Pova 3"
                case .pova4:                 return "Pova 4"
                case .pova5:                 return "Pova 5"
                case .pova6:                 return "Pova 6"
                case .pova6pro:              return "Pova 6 Pro"
                case .povaneo:               return "Pova Neo"
                case .povaneo2:              return "Pova Neo 2"
                case .spark6:                return "Spark 6"
                case .spark6go:              return "Spark 6 Go"
                case .spark7pro:             return "Spark 7 Pro"
                case .spark7t:               return "Spark 7T"
                case .spark8:                return "Spark 8"
                case .spark8c:               return "Spark 8C"
                case .spark8p:               return "Spark 8P"
                case .spark8t:               return "Spark 8T"
                case .spark9pro:             return "Spark 9 Pro"
                case .spark10:               return "Spark 10"
                case .spark10pro:            return "Spark 10 Pro"
                case .spark20:               return "Spark 20"
                case .spark20c:              return "Spark 20C"
                case .spark20pro:            return "Spark 20 Pro"
                case .sparkgo2023:           return "Spark Go 2023"
                case .sparkgo2024:           return "Spark Go 2024"
                }
            }
        }
        
        enum Tplink: String, Describer, CaseIterable, Codable {
            case neffosc5
            case neffosx1
            case neffosy5l
            
            func describe() -> String {
                switch self {
                case .neffosc5:              return "Neffos C5"
                case .neffosx1:              return "Neffos X1"
                case .neffosy5l:             return "Neffos Y5L"
                }
            }
        }
        
        enum Trident: String, Describer, CaseIterable, Codable {
            case a5
            case a53pro
            case f600
            case m009
            case n89
            case t56
            case t89
            case other
            
            func describe() -> String {
                switch self {
                case .a5:                   return "A5"
                case .a53pro:               return "A53 Pro"
                case .f600:                 return "F600"
                case .m009:                 return "M009"
                case .n89:                  return "n89"
                case .t56:                  return "T56"
                case .t89:                  return "T89"
                case .other:                return "Diğer"
                }
            }
        }
        
        enum Turkcell: String, Describer, CaseIterable, Codable {
            case maxiplus5
            case maxipro5
            case t10
            case t11
            case t40
            case t50
            case t60
            case t70
            case t80
            
            func describe() -> String {
                switch self {
                case .maxiplus5:            return "MaxiPlus 5"
                case .maxipro5:             return "MaxiPro 5"
                case .t10:                  return "T10"
                case .t11:                  return "T11"
                case .t40:                  return "T40"
                case .t50:                  return "T50"
                case .t60:                  return "T60"
                case .t70:                  return "T70"
                case .t80:                  return "T80"
                }
            }
        }
        
        enum Ulefone: String, Describer, CaseIterable, Codable {
            case armor20wt
            case armor5
            case armor8pro
            case armor9
            case armor11
            case armor13
            case armor14pro
            case armor15
            case armor17pro
            case armor21
            case armor22
            case armor23ultra
            case armor24
            case armor25tpro
            case armor26ultra
            case armorx
            case note10
            case powerarmor16pro
            case powerarmor18t
            case powerarmor18tultra
            case powerarmor19
            case powerarmorx11
            case other
            
            func describe() -> String {
                switch self {
                case .armor20wt:              return "Armor 20WT"
                case .armor5:                 return "Armor 5"
                case .armor8pro:              return "Armor 8 Pro"
                case .armor9:                 return "Armor 9"
                case .armor11:                return "Armor 11"
                case .armor13:                return "Armor 13"
                case .armor14pro:             return "Armor 14 Pro"
                case .armor15:                return "Armor 15"
                case .armor17pro:             return "Armor 17 Pro"
                case .armor21:                return "Armor 21"
                case .armor22:                return "Armor 22"
                case .armor23ultra:           return "Armor 23 Ultra"
                case .armor24:                return "Armor 24"
                case .armor25tpro:            return "Armor 25T Pro"
                case .armor26ultra:           return "Armor 26 Ultra"
                case .armorx:                 return "Armor X"
                case .note10:                 return "Note 10"
                case .powerarmor16pro:        return "Power Armor 16 Pro"
                case .powerarmor18t:          return "Power Armor 18T"
                case .powerarmor18tultra:     return "Power Armor 18T Ultra"
                case .powerarmor19:           return "Power Armor 19"
                case .powerarmorx11:          return "Power Armor X11"
                case .other:                  return "Diğer"
                }
            }
        }
        
        enum Umidigi: String, Describer, CaseIterable, Codable {
            case a13promax5g
            case bison
            case bisongt2pro
            case z2pro
            
            func describe() -> String {
                switch self {
                case .a13promax5g:             return "A13 Pro Max 5G"
                case .bison:                   return "Bison"
                case .bisongt2pro:             return "Bison GT2 Pro"
                case .z2pro:                   return "Z2 Pro"
                }
            }
        }
        
        enum Unihertz: String, Describer, CaseIterable, Codable {
            case atomxl
            case goldeneye
            case jelly2
            case jellystar
            case luna
            case tank
            case tank2
            case tank3
            case tank3pro
            case tankmini1
            case ticktocks
            case titan
            case titanslim
            
            func describe() -> String {
                switch self {
                case .atomxl:                   return "Atom XL"
                case .goldeneye:                return "Golden Eye"
                case .jelly2:                   return "Jelly 2"
                case .jellystar:                return "Jelly Star"
                case .luna:                     return "Luna"
                case .tank:                     return "Tank"
                case .tank2:                    return "Tank 2"
                case .tank3:                    return "Tank 3"
                case .tank3pro:                 return "Tank 3 Pro"
                case .tankmini1:                return "Tank Mini 1"
                case .ticktocks:                return "TickTock S"
                case .titan:                    return "Titan"
                case .titanslim:                return "Titan Slim"
                }
            }
        }
        
        enum Vertu: String, Describer, CaseIterable, Codable {
            case m2
            case ascent
            case aster
            case ayxta
            case constellation
            case constellationquest
            case diamond
            case ferrari
            case narnia
            case signature
            case signaturetouch
            case ti
            case other
            
            func describe() -> String {
                switch self {
                case .m2:                       return "M2"
                case .ascent:                   return "Ascent"
                case .aster:                    return "Aster"
                case .ayxta:                    return "Ayxta"
                case .constellation:            return "Constellation"
                case .constellationquest:       return "Constellation Quest"
                case .diamond:                  return "Diamond"
                case .ferrari:                  return "Ferrari"
                case .narnia:                   return "Narnia"
                case .signature:                return "Signature"
                case .signaturetouch:           return "Signature Touch"
                case .ti:                       return "Ti"
                case .other:                    return "Diğer"
                }
            }
        }
        
        enum Vestel: String, Describer, CaseIterable, Codable {
            case venus45
            case venus50
            case venus55
            case venus5000
            case venuse3
            case venuse4
            case venuse5
            case venusgo
            case venusv35010
            case venusv35020
            case venusv35040
            case venusv35070
            case venusv35570
            case venusv35580
            case venusv4
            case venusv5
            case venusv6
            case venusv7
            case venusz10
            case venusz20
            case venusz30
            case venusz40
            case venüs5530
            
            func describe() -> String {
                switch self {
                case .venus45:              return "Venus 4.5"
                case .venus50:              return "Venus 5.0"
                case .venus55:              return "Venus 5.5"
                case .venus5000:            return "Venus 5000"
                case .venuse3:              return "Venus E3"
                case .venuse4:              return "Venus E4"
                case .venuse5:              return "Venus E5"
                case .venusgo:              return "Venus GO"
                case .venusv35010:          return "Venus V3 5010"
                case .venusv35020:          return "Venus V3 5020"
                case .venusv35040:          return "Venus V3 5040"
                case .venusv35070:          return "Venus V3 5070"
                case .venusv35570:          return "Venus V3 5570"
                case .venusv35580:          return "Venus V3 5580"
                case .venusv4:              return "Venus V4"
                case .venusv5:              return "Venus V5"
                case .venusv6:              return "Venus V6"
                case .venusv7:              return "Venus V7"
                case .venusz10:             return "Venus Z10"
                case .venusz20:             return "Venus Z20"
                case .venusz30:             return "Venus Z30"
                case .venusz40:             return "Venus Z40"
                case .venüs5530:            return "Venüs 5530"
                }
            }
        }

        enum Vivo: String, Describer, CaseIterable, Codable {
            case iqoo7
            case iqoo8pro
            case iqoo9pro
            case iqoo11
            case iqoo12pro
            case nexdualdisplay
            case nexs
            case s1
            case v17
            case v21
            case v23
            case v25
            case v29
            case v29lite
            case v30
            case v30lite
            case xflip
            case xfold
            case xfold3pro
            case x50lite
            case x51
            case x60pro
            case x60proplus
            case x70pro
            case x70proplus
            case x80pro
            case x90pro
            case x90proplus
            case x100
            case x100pro
            case x100ultra
            case y11s
            case y15s
            case y16
            case y17s
            case y20
            case y21
            case y21s
            case y22s
            case y27
            case y33s
            case y35
            case y36
            case y51
            case y53s
            case y70
            case other
            
            func describe() -> String {
                switch self {
                case .iqoo7:                return "iQOO 7"
                case .iqoo8pro:             return "iQOO 8 Pro"
                case .iqoo9pro:             return "iQOO 9 Pro"
                case .iqoo11:               return "iQOO 11"
                case .iqoo12pro:            return "iQOO 12 Pro"
                case .nexdualdisplay:       return "Nex Dual Display"
                case .nexs:                 return "Nex S"
                case .s1:                   return "S1"
                case .v17:                  return "V17"
                case .v21:                  return "V21"
                case .v23:                  return "V23"
                case .v25:                  return "V25"
                case .v29:                  return "V29"
                case .v29lite:              return "V29 Lite"
                case .v30:                  return "V30"
                case .v30lite:              return "V30 Lite"
                case .xflip:                return "X Flip"
                case .xfold:                return "X Fold"
                case .xfold3pro:            return "X Fold 3 Pro"
                case .x50lite:              return "X50 Lite"
                case .x51:                  return "X51"
                case .x60pro:               return "X60 Pro"
                case .x60proplus:           return "X60 Pro+"
                case .x70pro:               return "X70 Pro"
                case .x70proplus:           return "X70 Pro+"
                case .x80pro:               return "X80 Pro"
                case .x90pro:               return "X90 Pro"
                case .x90proplus:           return "X90 Pro+"
                case .x100:                 return "X100"
                case .x100pro:              return "X100 Pro"
                case .x100ultra:            return "X100 Ultra"
                case .y11s:                 return "Y11s"
                case .y15s:                 return "Y15s"
                case .y16:                  return "Y16"
                case .y17s:                 return "Y17s"
                case .y20:                  return "Y20"
                case .y21:                  return "Y21"
                case .y21s:                 return "Y21s"
                case .y22s:                 return "Y22s"
                case .y27:                  return "Y27"
                case .y33s:                 return "Y33s"
                case .y35:                  return "Y35"
                case .y36:                  return "Y36"
                case .y51:                  return "Y51"
                case .y53s:                 return "Y53s"
                case .y70:                  return "Y70"
                case .other:                return "Diğer"
                }
            }
        }
        
        enum Vodafone: String, Describer, CaseIterable, Codable {
            case smartmini
            case smart4mini
            case smart6
            case smart6ultra
            case smartstyle7
            case smartultra7
            case modal553
            case modal555
            case modal710
            case modal858
            case modal945
            case modal958
            case other
            
            func describe() -> String {
                switch self {
                case .smartmini:          return "Smart Mini"
                case .smart4mini:         return "Smart 4 Mini"
                case .smart6:             return "Smart 6"
                case .smart6ultra:        return "Smart 6 Ultra"
                case .smartstyle7:        return "Smart Style 7"
                case .smartultra7:        return "Smart Ultra 7"
                case .modal553:           return "553"
                case .modal555:           return "555"
                case .modal710:           return "710"
                case .modal858:           return "858"
                case .modal945:           return "945"
                case .modal958:           return "958"
                case .other:              return "Diğer"
                }
            }
        }
        
        enum Xiaomi: String, Describer, CaseIterable, Codable {
            case modal12
            case modal12lite
            case modal12pro
            case modal12s
            case modal12spro
            case modal12sultra
            case modal12t
            case modal12tpro
            case modal12x
            case modal13
            case modal13lite
            case modal13pro
            case modal13t
            case modal13tpro
            case modal13ultra
            case modal14
            case modal14pro
            case modal14ultra
            case blackshark
            case blackshark2pro
            case blackshark3
            case blackshark4
            case blackshark4pro
            case blackshark5pro
            case mi4
            case mi4c
            case mi5
            case mi5s
            case mi5splus
            case mi6
            case mi8
            case mi8lite
            case mi8pro
            case mi8se
            case mi9
            case mi9explorer
            case mi9lite
            case mi9pro
            case mi9se
            case mi9t
            case mi9tpro
            case mi10
            case mi10i5g
            case mi10lite
            case mi10pro
            case mi10s
            case mi10t
            case mi10tlite
            case mi10tpro
            case mi10ultra
            case mi11
            case mi11i
            case mi11lite
            case mi11lite5g
            case mi11lite5gne
            case mi11pro
            case mi11t
            case mi11tpro
            case mi11ultra
            case mia15x
            case mia26x
            case mia2literedmi6pro
            case mia3
            case micc9
            case micc9pro
            case mimax
            case mimax2
            case mimax3
            case mimix
            case mimix2
            case mimix2s
            case mimix3
            case mimix4
            case mimixfold2
            case mimixfold3
            case mimixfold4
            case minote
            case minote3
            case minote10
            case minote10lite
            case minote10pro
            case miplay
            case mixflip
            case pococ40
            case pococ55
            case pococ65
            case pocof2pro
            case pocof3
            case pocof4
            case pocof4gt
            case pocof5
            case pocof5pro
            case pocof6
            case pocof6pro
            case pocom3
            case pocom3pro
            case pocom4pro
            case pocom5
            case pocom6
            case pocom6pro
            case pocophonef1
            case pocox2
            case pocox3
            case pocox3gt
            case pocox3pro
            case pocox4gt
            case pocox4pro5g
            case pocox5
            case pocox5pro
            case pocox6
            case pocox6pro
            case qin1s
            case redmi2a
            case redmi2pro
            case redmi3
            case redmi3x
            case redmi4
            case redmi4a
            case redmi4x
            case redmi5
            case redmi5a
            case redmi5plus
            case redmi6
            case redmi6a
            case redmi7
            case redmi7a
            case redmi8
            case redmi8a
            case redmi8adual
            case redmi8apro
            case redmi9
            case redmi9a
            case redmi9c
            case redmi9prime
            case redmi9t
            case redmi10
            case redmi102022
            case redmi10a
            case redmi10c
            case redmi10x
            case redmi10xpro
            case redmi12
            case redmi12c
            case redmi13
            case redmi13c
            case redmi13r
            case redmigo
            case redmik20pro
            case redmik20propremium
            case redmik30
            case redmik30pro
            case redmik40
            case redmik40gaming
            case redmik40pro
            case redmik50
            case redmik50pro
            case redmik50gaming
            case redmik50ultra
            case redmik60
            case redmik60pro
            case redmik60ultra
            case redmik70
            case redmik70pro
            case redmik70ultra
            case redminote
            case redminote3pro
            case redminote4
            case redminote4x
            case redminote5
            case redminote5pro
            case redminote6pro
            case redminote7
            case redminote8
            case redminote82021
            case redminote8pro
            case redminote8t
            case redminote9
            case redminote9pro
            case redminote9promax
            case redminote9s
            case redminote9t
            case redminote10
            case redminote105g
            case redminote10pro
            case redminote10promax
            case redminote10s
            case redminote11
            case redminote11e
            case redminote11pro
            case redminote11pro5g
            case redminote11proplus
            case redminote11r
            case redminote11s
            case redminote11se
            case redminote11tpro
            case redminote12
            case redminote12explorer
            case redminote12pro
            case redminote12proplus
            case redminote12s
            case redminote12turbo
            case redminote13
            case redminote13pro
            case redminote13proplus
            case redmipro
            case redmis2
            
            func describe() -> String {
                switch self {
                case .modal12:                  return "12"
                case .modal12lite:              return "12 Lite"
                case .modal12pro:               return "12 Pro"
                case .modal12s:                 return "12S"
                case .modal12spro:              return "12S Pro"
                case .modal12sultra:            return "12S Ultra"
                case .modal12t:                 return "12T"
                case .modal12tpro:              return "12T Pro"
                case .modal12x:                 return "12X"
                case .modal13:                  return "13"
                case .modal13lite:              return "13 Lite"
                case .modal13pro:               return "13 Pro"
                case .modal13t:                 return "13T"
                case .modal13tpro:              return "13T Pro"
                case .modal13ultra:             return "13 Ultra"
                case .modal14:                  return "14"
                case .modal14pro:               return "14 Pro"
                case .modal14ultra:             return "14 Ultra"
                case .blackshark:               return "Black Shark"
                case .blackshark2pro:           return "Black Shark 2 Pro"
                case .blackshark3:              return "Black Shark 3"
                case .blackshark4:              return "Black Shark 4"
                case .blackshark4pro:           return "Black Shark 4 Pro"
                case .blackshark5pro:           return "Black Shark 5 Pro"
                case .mi4:                      return "Mi 4"
                case .mi4c:                     return "Mi 4c"
                case .mi5:                      return "Mi 5"
                case .mi5s:                     return "Mi 5s"
                case .mi5splus:                 return "Mi 5s Plus"
                case .mi6:                      return "Mi 6"
                case .mi8:                      return "Mi 8"
                case .mi8lite:                  return "Mi 8 Lite"
                case .mi8pro:                   return "Mi 8 Pro"
                case .mi8se:                    return "Mi 8 SE"
                case .mi9:                      return "Mi 9"
                case .mi9explorer:              return "Mi 9 Explorer"
                case .mi9lite:                  return "Mi 9 Lite"
                case .mi9pro:                   return "Mi 9 Pro"
                case .mi9se:                    return "Mi 9 SE"
                case .mi9t:                     return "Mi 9T"
                case .mi9tpro:                  return "Mi 9T Pro"
                case .mi10:                     return "Mi 10"
                case .mi10i5g:                  return "Mi 10i 5G"
                case .mi10lite:                 return "Mi 10 Lite"
                case .mi10pro:                  return "Mi 10 Pro"
                case .mi10s:                    return "Mi 10S"
                case .mi10t:                    return "Mi 10 T"
                case .mi10tlite:                return "Mi 10 T Lite"
                case .mi10tpro:                 return "Mi 10 T Pro"
                case .mi10ultra:                return "Mi 10 Ultra"
                case .mi11:                     return "Mi 11"
                case .mi11i:                    return "Mi 11i"
                case .mi11lite:                 return "Mi 11 Lite"
                case .mi11lite5g:               return "Mi 11 Lite 5G"
                case .mi11lite5gne:             return "Mi 11 Lite 5G NE"
                case .mi11pro:                  return "Mi 11 Pro"
                case .mi11t:                    return "Mi 11T"
                case .mi11tpro:                 return "Mi 11T Pro"
                case .mi11ultra:                return "Mi 11 Ultra"
                case .mia15x:                   return "Mi A1 (5X)"
                case .mia26x:                   return "Mi A2 (6X)"
                case .mia2literedmi6pro:        return "Mi A2 Lite (Redmi 6 Pro)"
                case .mia3:                     return "Mi A3"
                case .micc9:                    return "Mi CC9"
                case .micc9pro:                 return "Mi CC9 Pro"
                case .mimax:                    return "Mi Max"
                case .mimax2:                   return "Mi Max 2"
                case .mimax3:                   return "Mi Max 3"
                case .mimix:                    return "Mi Mix"
                case .mimix2:                   return "Mi Mix 2"
                case .mimix2s:                  return "Mi Mix 2S"
                case .mimix3:                   return "Mi Mix 3"
                case .mimix4:                   return "Mi Mix 4"
                case .mimixfold2:               return "Mi Mix Fold 2"
                case .mimixfold3:               return "Mi Mix Fold 3"
                case .mimixfold4:               return "Mi Mix Fold 4"
                case .minote:                   return "Mi Note"
                case .minote3:                  return "Mi Note 3"
                case .minote10:                 return "Mi Note 10"
                case .minote10lite:             return "Mi Note 10 Lite"
                case .minote10pro:              return "Mi Note 10 Pro"
                case .miplay:                   return "Mi Play"
                case .mixflip:                  return "Mix Flip"
                case .pococ40:                  return "Poco C40"
                case .pococ55:                  return "Poco C55"
                case .pococ65:                  return "Poco C65"
                case .pocof2pro:                return "Poco F2 Pro"
                case .pocof3:                   return "Poco F3"
                case .pocof4:                   return "Poco F4"
                case .pocof4gt:                 return "Poco F4 GT"
                case .pocof5:                   return "Poco F5"
                case .pocof5pro:                return "Poco F5 Pro"
                case .pocof6:                   return "Poco F6"
                case .pocof6pro:                return "Poco F6 Pro"
                case .pocom3:                   return "Poco M3"
                case .pocom3pro:                return "Poco M3 Pro"
                case .pocom4pro:                return "Poco M4 Pro"
                case .pocom5:                   return "Poco M5"
                case .pocom6:                   return "Poco M6"
                case .pocom6pro:                return "Poco M6 Pro"
                case .pocophonef1:              return "Pocophone F1"
                case .pocox2:                   return "Poco X2"
                case .pocox3:                   return "Poco X3"
                case .pocox3gt:                 return "Poco X3 GT"
                case .pocox3pro:                return "Poco X3 Pro"
                case .pocox4gt:                 return "Poco X4 GT"
                case .pocox4pro5g:              return "Poco X4 Pro 5G"
                case .pocox5:                   return "Poco X5"
                case .pocox5pro:                return "Poco X5 Pro"
                case .pocox6:                   return "Poco X6"
                case .pocox6pro:                return "Poco X6 Pro"
                case .qin1s:                    return "Qin 1s+"
                case .redmi2a:                  return "Redmi 2A"
                case .redmi2pro:                return "Redmi 2 Pro"
                case .redmi3:                   return "Redmi 3"
                case .redmi3x:                  return "Redmi 3x"
                case .redmi4:                   return "Redmi 4"
                case .redmi4a:                  return "Redmi 4a"
                case .redmi4x:                  return "Redmi 4X"
                case .redmi5:                   return "Redmi 5"
                case .redmi5a:                  return "Redmi 5A"
                case .redmi5plus:               return "Redmi 5 Plus"
                case .redmi6:                   return "Redmi 6"
                case .redmi6a:                  return "Redmi 6A"
                case .redmi7:                   return "Redmi 7"
                case .redmi7a:                  return "Redmi 7A"
                case .redmi8:                   return "Redmi 8"
                case .redmi8a:                  return "Redmi 8A"
                case .redmi8adual:              return "Redmi 8A Dual"
                case .redmi8apro:               return "Redmi 8A Pro"
                case .redmi9:                   return "Redmi 9"
                case .redmi9a:                  return "Redmi 9A"
                case .redmi9c:                  return "Redmi 9C"
                case .redmi9prime:              return "Redmi 9 Prime"
                case .redmi9t:                  return "Redmi 9T"
                case .redmi10:                  return "Redmi 10"
                case .redmi102022:              return "Redmi 10 2022"
                case .redmi10a:                 return "Redmi 10A"
                case .redmi10c:                 return "Redmi 10C"
                case .redmi10x:                 return "Redmi 10X"
                case .redmi10xpro:              return "Redmi 10X Pro"
                case .redmi12:                  return "Redmi 12"
                case .redmi12c:                 return "Redmi 12C"
                case .redmi13:                  return "Redmi 13"
                case .redmi13c:                 return "Redmi 13C"
                case .redmi13r:                 return "Redmi 13R"
                case .redmigo:                  return "Redmi Go"
                case .redmik20pro:              return "Redmi K20 Pro"
                case .redmik20propremium:       return "Redmi K20 Pro Premium"
                case .redmik30:                 return "Redmi K30"
                case .redmik30pro:              return "Redmi K30 Pro"
                case .redmik40:                 return "Redmi K40"
                case .redmik40gaming:           return "Redmi K40 Gaming"
                case .redmik40pro:              return "Redmi K40 Pro"
                case .redmik50:                 return "Redmi K50"
                case .redmik50pro:              return "Redmi K50 Pro"
                case .redmik50gaming:           return "Redmi K50 Gaming"
                case .redmik50ultra:            return "Redmi K50 Ultra"
                case .redmik60:                 return "Redmi K60"
                case .redmik60pro:              return "Redmi K60 Pro"
                case .redmik60ultra:            return "Redmi K60 Ultra"
                case .redmik70:                 return "Redmi K70"
                case .redmik70pro:              return "Redmi K70 Pro"
                case .redmik70ultra:            return "Redmi K70 Ultra"
                case .redminote:                return "Redmi Note"
                case .redminote3pro:            return "Redmi Note 3 (Pro)"
                case .redminote4:               return "Redmi Note 4"
                case .redminote4x:              return "Redmi Note 4X"
                case .redminote5:               return "Redmi Note 5"
                case .redminote5pro:            return "Redmi Note 5 Pro"
                case .redminote6pro:            return "Redmi Note 6 Pro"
                case .redminote7:               return "Redmi Note 7"
                case .redminote8:               return "Redmi Note 8"
                case .redminote82021:           return "Redmi Note 8 2021"
                case .redminote8pro:            return "Redmi Note 8 Pro"
                case .redminote8t:              return "Redmi Note 8T"
                case .redminote9:               return "Redmi Note 9"
                case .redminote9pro:            return "Redmi Note 9 Pro"
                case .redminote9promax:         return "Redmi Note 9 Pro Max"
                case .redminote9s:              return "Redmi Note 9S"
                case .redminote9t:              return "Redmi Note 9T"
                case .redminote10:              return "Redmi Note 10"
                case .redminote105g:            return "Redmi Note 10 5G"
                case .redminote10pro:           return "Redmi Note 10 Pro"
                case .redminote10promax:        return "Redmi Note 10 Pro Max"
                case .redminote10s:             return "Redmi Note 10S"
                case .redminote11:              return "Redmi Note 11"
                case .redminote11e:             return "Redmi Note 11E"
                case .redminote11pro:           return "Redmi Note 11 Pro"
                case .redminote11pro5g:         return "Redmi Note 11 Pro 5G"
                case .redminote11proplus:       return "Redmi Note 11 Pro Plus"
                case .redminote11r:             return "Redmi Note 11R"
                case .redminote11s:             return "Redmi Note 11S"
                case .redminote11se:            return "Redmi Note 11SE"
                case .redminote11tpro:          return "Redmi Note 11T Pro"
                case .redminote12:              return "Redmi Note 12"
                case .redminote12explorer:      return "Redmi Note 12 Explorer"
                case .redminote12pro:           return "Redmi Note 12 Pro"
                case .redminote12proplus:       return "Redmi Note 12 Pro Plus"
                case .redminote12s:             return "Redmi Note 12S"
                case .redminote12turbo:         return "Redmi Note 12 Turbo"
                case .redminote13:              return "Redmi Note 13"
                case .redminote13pro:           return "Redmi Note 13 Pro"
                case .redminote13proplus:       return "Redmi Note 13 Pro Plus"
                case .redmipro:                 return "Redmi Pro"
                case .redmis2:                  return "Redmi S2"
                }
            }
        }
        
        enum Xor: String, Describer, CaseIterable, Codable {
            case titaniumx2
            
            func describe() -> String {
                switch self {
                case .titaniumx2:              return "Titanium X2"
                }
            }
        }
        
        enum Yota: String, Describer, CaseIterable, Codable {
            case yotaphone2
            
            func describe() -> String {
                switch self {
                case .yotaphone2:             return "YotaPhone 2"
                }
            }
        }
        
        enum Zte: String, Describer, CaseIterable, Codable {
            case axon10pro
            case axon30ultra
            case axon40ultra
            case axon7
            case blade
            case bladea910
            case bladev7lite
            case bladev8
            case nubiaflip
            case nubiaredmagic5g
            case nubiaredmagic6
            case nubiaredmagic6pro
            case nubiaredmagic6r
            case nubiaredmagic6spro
            case nubiaredmagic7
            case nubiaredmagic7pro
            case nubiaredmagic7spro
            case nubiaredmagic8pro
            case nubiaredmagic8proplus
            case nubiaredmagic8spro
            case nubiaredmagic8sproplus
            case nubiaredmagic9pro
            case nubiaredmagic9proplus
            case nubiaredmagic9spro
            case nubiaz11
            case nubiaz17mini
            case nubiaz18
            case nubiaz40spro
            case nubiaz50spro
            case nubiaz50ultra
            case nubiaz60ultra
            case other
            
            func describe() -> String {
                switch self {
                case .axon10pro:                 return "Axon 10 Pro"
                case .axon30ultra:               return "Axon 30 Ultra"
                case .axon40ultra:               return "Axon 40 Ultra"
                case .axon7:                     return "Axon 7"
                case .blade:                     return "Blade"
                case .bladea910:                 return "Blade A910"
                case .bladev7lite:               return "Blade V7 Lite"
                case .bladev8:                   return "Blade V8"
                case .nubiaflip:                 return "Nubia Flip"
                case .nubiaredmagic5g:           return "Nubia Red Magic 5G"
                case .nubiaredmagic6:            return "Nubia Red Magic 6"
                case .nubiaredmagic6pro:         return "Nubia Red Magic 6 Pro"
                case .nubiaredmagic6r:           return "Nubia Red Magic 6 R"
                case .nubiaredmagic6spro:        return "Nubia Red Magic 6S Pro"
                case .nubiaredmagic7:            return "Nubia Red Magic 7"
                case .nubiaredmagic7pro:         return "Nubia Red Magic 7 Pro"
                case .nubiaredmagic7spro:        return "Nubia Red Magic 7S Pro"
                case .nubiaredmagic8pro:         return "Nubia Red Magic 8 Pro"
                case .nubiaredmagic8proplus:     return "Nubia Red Magic 8 Pro Plus"
                case .nubiaredmagic8spro:        return "Nubia Red Magic 8S Pro"
                case .nubiaredmagic8sproplus:    return "Nubia Red Magic 8S Pro Plus"
                case .nubiaredmagic9pro:         return "Nubia Red Magic 9 Pro"
                case .nubiaredmagic9proplus:     return "Nubia Red Magic 9 Pro Plus"
                case .nubiaredmagic9spro:        return "Nubia Red Magic 9S Pro"
                case .nubiaz11:                  return "Nubia Z11"
                case .nubiaz17mini:              return "Nubia Z17 mini"
                case .nubiaz18:                  return "Nubia Z18"
                case .nubiaz40spro:              return "Nubia Z40S Pro"
                case .nubiaz50spro:              return "Nubia Z50S Pro"
                case .nubiaz50ultra:             return "Nubia Z50 Ultra"
                case .nubiaz60ultra:             return "Nubia Z60 Ultra"
                case .other:                     return "Diğer"
                }
            }
        }
        
    }
}








//MARK: -> Phone Input - 
extension ElectronicProductEnvironment.PhoneEnvironment {
    enum OperatingSystem: String, Describer, CaseIterable, Codable {
        case android
        case iOS
        case bada
        case blackberryOS
        case harmonyOS
        case linux
        case microsoft
        case symbianOS
        case webOS
        case native
        
        func describe() -> String {
            switch self {
            case .android:            return "Android"
            case .iOS:                return "iOS"
            case .bada:               return "Bada"
            case .blackberryOS:       return "Blackberry OS"
            case .harmonyOS:          return "Harmony OS"
            case .linux:              return "Linux"
            case .microsoft:          return "Microsoft Windows"
            case .symbianOS:          return "Symbian OS"
            case .webOS:              return "WebOS"
            case .native:             return "Native(Diğer)"
            }
        }
    }
    
    enum Memory: String, Describer, CaseIterable, Codable {
        case none
        case mbzerofifty
        case mbfiftyhundred
        case mbhundredtwohundred
        case mbtwohundredthreehundred
        case mbthreehundredfourhundred
        case mbfourhundredfivehundred
        case mbfivehundred1gb
        case gbonehalfone
        case gbonehalftwo
        case gbtwofour
        case gb4
        case gb6
        case gb8
        case gb12
        case gb13
        case gb16
        case gb32
        case gb64
        case gb128
        case gb256
        case gb512
        case gb640
        case tb1
        
        func describe() -> String {
            switch self {
            case .none:                         return "Yok"
            case .mbzerofifty:                  return "0 - 50 MB"
            case .mbfiftyhundred:               return "51 - 100 MB"
            case .mbhundredtwohundred:          return "101 - 200 MB"
            case .mbtwohundredthreehundred:     return "201 - 300 MB"
            case .mbthreehundredfourhundred:    return "301 - 400 MB"
            case .mbfourhundredfivehundred:     return "401 - 500 MB"
            case .mbfivehundred1gb:             return "501 MB - 1 GB"
            case .gbonehalfone:                 return "1,1 - 1.5 GB"
            case .gbonehalftwo:                 return "1,6 - 2 GB"
            case .gbtwofour:                    return "2,1 - 3,9 GB"
            case .gb4:                          return "4 GB"
            case .gb6:                          return "6 GB"
            case .gb8:                          return "8 GB"
            case .gb12:                         return "12 GB"
            case .gb13:                         return "13 GB"
            case .gb16:                         return "16 GB"
            case .gb32:                         return "32 GB"
            case .gb64:                         return "64 GB"
            case .gb128:                        return "128 GB"
            case .gb256:                        return "256 GB"
            case .gb512:                        return "512 GB"
            case .gb640:                        return "640 GB"
            case .tb1:                          return "1 TB"
            }
        }
    }
    
    enum ScreenSize: String, Describer, CaseIterable, Codable {
        case onepoint3
        case onepoint4
        case onepoint5
        case onepoint6
        case onepoint7
        case onepoint8
        case onepoint9
        case twopoint
        case twopoint1
        case twopoint2
        case twopoint3
        case twopoint4
        case twopoint5
        case twopoint6
        case twopoint7
        case twopoint8
        case twopoint9
        case threepoint
        case threepoint1
        case threepoint2
        case threepoint3
        case threepoint4
        case threepoint5
        case threepoint6
        case threepoint7
        case threepoint8
        case threepoint9
        case fourpoint
        case fourpoint1
        case fourpoint2
        case fourpoint3
        case fourpoint4
        case fourpoint5
        case fourpoint6
        case fourpoint7
        case fourpoint8
        case fourpoint9
        case fivepoint
        case fivepoint1
        case fivepoint2
        case fivepoint3
        case fivepoint4
        case fivepoint5
        case fivepoint6
        case fivepoint7
        case fivepoint8
        case fivepoint9
        case sixpoint
        case sixpoint1
        case sixpoint2
        case sixpoint3
        case sixpoint4
        case sixpoint5
        case sixpoint6
        case sixpoint7
        case sixpoint8
        case sixpoint9
        case sevenpoint
        case sevenpoint1
        case sevenpoint2
        case sevenpoint3
        case sevenpoint4
        case sevenpoint5
        case sevenpoint6
        case sevenpoint7
        case sevenpoint8
        case sevenpoint9
        case eightpoint
        case eightpoint1
        case eightpoint2
        case eightpoint3
    
        func describe() -> String {
            switch self {
            case .onepoint3:         return "1.3\""
            case .onepoint4:         return "1.4\""
            case .onepoint5:         return "1.5\""
            case .onepoint6:         return "1.6\""
            case .onepoint7:         return "1.7\""
            case .onepoint8:         return "1.8\""
            case .onepoint9:         return "1.9\""
            case .twopoint:          return "2.0\""
            case .twopoint1:         return "2.1\""
            case .twopoint2:         return "2.2\""
            case .twopoint3:         return "2.3\""
            case .twopoint4:         return "2.4\""
            case .twopoint5:         return "2.5\""
            case .twopoint6:         return "2.6\""
            case .twopoint7:         return "2.7\""
            case .twopoint8:         return "2.8\""
            case .twopoint9:         return "2.9\""
            case .threepoint:        return "3.0\""
            case .threepoint1:       return "3.1\""
            case .threepoint2:       return "3.2\""
            case .threepoint3:       return "3.3\""
            case .threepoint4:       return "3.4\""
            case .threepoint5:       return "3.5\""
            case .threepoint6:       return "3.6\""
            case .threepoint7:       return "3.7\""
            case .threepoint8:       return "3.8\""
            case .threepoint9:       return "3.9\""
            case .fourpoint:         return "4.0\""
            case .fourpoint1:        return "4.1\""
            case .fourpoint2:        return "4.2\""
            case .fourpoint3:        return "4.3\""
            case .fourpoint4:        return "4.4\""
            case .fourpoint5:        return "4.5\""
            case .fourpoint6:        return "4.6\""
            case .fourpoint7:        return "4.7\""
            case .fourpoint8:        return "4.8\""
            case .fourpoint9:        return "4.9\""
            case .fivepoint:         return "5.0\""
            case .fivepoint1:        return "5.1\""
            case .fivepoint2:        return "5.2\""
            case .fivepoint3:        return "5.3\""
            case .fivepoint4:        return "5.4\""
            case .fivepoint5:        return "5.5\""
            case .fivepoint6:        return "5.6\""
            case .fivepoint7:        return "5.7\""
            case .fivepoint8:        return "5.8\""
            case .fivepoint9:        return "5.9\""
            case .sixpoint:          return "6.0\""
            case .sixpoint1:         return "6.1\""
            case .sixpoint2:         return "6.2\""
            case .sixpoint3:         return "6.3\""
            case .sixpoint4:         return "6.4\""
            case .sixpoint5:         return "6.5\""
            case .sixpoint6:         return "6.6\""
            case .sixpoint7:         return "6.7\""
            case .sixpoint8:         return "6.8\""
            case .sixpoint9:         return "6.9\""
            case .sevenpoint:        return "7.0\""
            case .sevenpoint1:       return "7.1\""
            case .sevenpoint2:       return "7.2\""
            case .sevenpoint3:       return "7.3\""
            case .sevenpoint4:       return "7.4\""
            case .sevenpoint5:       return "7.5\""
            case .sevenpoint6:       return "7.6\""
            case .sevenpoint7:       return "7.7\""
            case .sevenpoint8:       return "7.8\""
            case .sevenpoint9:       return "7.9\""
            case .eightpoint:        return "8.0\""
            case .eightpoint1:       return "8.1\""
            case .eightpoint2:       return "8.2\""
            case .eightpoint3:       return "8.3\""
            }
        }
    }
    
    enum RAM: String, Describer, CaseIterable, Codable {
        case none
        case mb1
        case mb4
        case mb8
        case mb16
        case mb32
        case mb64
        case mb128
        case mb256
        case mb512
        case mb768
        case gb1
        case gb1half
        case gb2
        case gb3
        case gb4
        case gb6
        case gb8
        case gb10
        case gb12
        case gb16
        case gb18
        case gb24
        
        func describe() -> String {
            switch self {
            case .none:             return "Yok"
            case .mb1:              return "1 MB"
            case .mb4:              return "4 MB"
            case .mb8:              return "8 MB"
            case .mb16:             return "16 MB"
            case .mb32:             return "32 MB"
            case .mb64:             return "64 MB"
            case .mb128:            return "128 MB"
            case .mb256:            return "256 MB"
            case .mb512:            return "512 MB"
            case .mb768:            return "768 MB"
            case .gb1:              return "1 GB"
            case .gb1half:          return "1.5 GB"
            case .gb2:              return "2 GB"
            case .gb3:              return "3 GB"
            case .gb4:              return "4 GB"
            case .gb6:              return "6 GB"
            case .gb8:              return "8 GB"
            case .gb10:             return "10 GB"
            case .gb12:             return "12 GB"
            case .gb16:             return "16 GB"
            case .gb18:             return "18 GB"
            case .gb24:             return "24 GB"
            }
        }
    }
    
    enum MegaPixel: String, Describer, CaseIterable, Codable {
        case none
        case mp1under
        case mp1point2
        case mp1point3
        case mp2
        case mp3
        case mp3point1
        case mp3point2
        case mp4
        case mp5
        case mp6
        case mp7
        case mp8
        case mp9
        case mp10
        case mp11
        case mp12
        case mp12point1
        case mp12point2
        case mp13
        case mp13point1
        case mp16
        case mp18
        case mp19
        case mp20
        case mp20point1
        case mp20point2
        case mp20point7
        case mp21
        case mp21point5
        case mp22point5
        case mp23
        case mp24
        case mp25
        case mp32
        case mp40
        case mp41
        case mp47
        case mp47point5
        case mp48
        case mp50
        case mp52
        case mp54
        case mp64
        case mp96
        case mp100
        case mp108
        case mp180
        case mp200
        
        func describe() -> String {
            switch self {
            case .none:             return "Yok"
            case .mp1under:         return "1 MP ve Altı"
            case .mp1point2:        return "1,2 MP"
            case .mp1point3:        return "1,3 MP"
            case .mp2:              return "2 MP"
            case .mp3:              return "3 MP"
            case .mp3point1:        return "3,1 MP"
            case .mp3point2:        return "3,2 MP"
            case .mp4:              return "4 MP"
            case .mp5:              return "5 MP"
            case .mp6:              return "6 MP"
            case .mp7:              return "7 MP"
            case .mp8:              return "8 MP"
            case .mp9:              return "9 MP"
            case .mp10:             return "10 MP"
            case .mp11:             return "11 MP"
            case .mp12:             return "12 MP"
            case .mp12point1:       return "12,1 MP"
            case .mp12point2:       return "12,2 MP"
            case .mp13:             return "13 MP"
            case .mp13point1:       return "13,1 MP"
            case .mp16:             return "16 MP"
            case .mp18:             return "18 MP"
            case .mp19:             return "19 MP"
            case .mp20:             return "20 MP"
            case .mp20point1:       return "20,1 MP"
            case .mp20point2:       return "20,2 MP"
            case .mp20point7:       return "20,7 MP"
            case .mp21:             return "21 MP"
            case .mp21point5:       return "21,5 MP"
            case .mp22point5:       return "22,5 MP"
            case .mp23:             return "23 MP"
            case .mp24:             return "24 MP"
            case .mp25:             return "25 MP"
            case .mp32:             return "32 MP"
            case .mp40:             return "40 MP"
            case .mp41:             return "41 MP"
            case .mp47:             return "47 MP"
            case .mp47point5:       return "47,5 MP"
            case .mp48:             return "48 MP"
            case .mp50:             return "50 MP"
            case .mp52:             return "52 MP"
            case .mp54:             return "54 MP"
            case .mp64:             return "64 MP"
            case .mp96:             return "96 MP"
            case .mp100:            return "100 MP"
            case .mp108:            return "108 MP"
            case .mp180:            return "180 MP"
            case .mp200:            return "200 MP"
            }
        }
    }
    
    enum FrontMegaPixel: String, Describer, CaseIterable, Codable {
        case mb0point1
        case mb0point3
        case mb0point9
        case mb1point1
        case mb1point2
        case mb1point3
        case mb1point6
        case mb1point9
        case mb1
        case mb2point1
        case mb2point2
        case mb2
        case mb3point7
        case mb3
        case mb4
        case mb5point1
        case mb5
        case mb7
        case mb8
        case mb10point5
        case mb10point7
        case mb10point8
        case mb10
        case mb11
        case mb12point6
        case mb12
        case mb13
        case mb16
        case mb20
        case mb24
        case mb25
        case mb28
        case mb32
        case mb40
        case mb42
        case mb44
        case mb48
        case mb50
        case mb60
        case mb64
        
        func describe() -> String {
            switch self {
            case .mb0point1:            return "0,1 MP"
            case .mb0point3:            return "0,3 MP"
            case .mb0point9:            return "0,9 MP"
            case .mb1point1:            return "1,1 MP"
            case .mb1point2:            return "1,2 MP"
            case .mb1point3:            return "1,3 MP"
            case .mb1point6:            return "1,6 MP"
            case .mb1point9:            return "1,9 MP"
            case .mb1:                  return "1 MP"
            case .mb2point1:            return "2,1 MP"
            case .mb2point2:            return "2,2 MP"
            case .mb2:                  return "2 MP"
            case .mb3point7:            return "3,7 MP"
            case .mb3:                  return "3 MP"
            case .mb4:                  return "4 MP"
            case .mb5point1:            return "5,1 MP"
            case .mb5:                  return "5 MP"
            case .mb7:                  return "7 MP"
            case .mb8:                  return "8 MP"
            case .mb10point5:           return "10,5 MP"
            case .mb10point7:           return "10,7 MP"
            case .mb10point8:           return "10,8 MP"
            case .mb10:                 return "10 MP"
            case .mb11:                 return "11 MP"
            case .mb12point6:           return "12,6 MP"
            case .mb12:                 return "12 MP"
            case .mb13:                 return "13 MP"
            case .mb16:                 return "16 MP"
            case .mb20:                 return "20 MP"
            case .mb24:                 return "24 MP"
            case .mb25:                 return "25 MP"
            case .mb28:                 return "28 MP"
            case .mb32:                 return "32 MP"
            case .mb40:                 return "40 MP"
            case .mb42:                 return "42 MP"
            case .mb44:                 return "44 MP"
            case .mb48:                 return "48 MP"
            case .mb50:                 return "50 MP"
            case .mb60:                 return "60 MP"
            case .mb64:                 return "64 MP"
            }
        }
    }
    
    enum Color: String, Describer, CaseIterable, Codable {
        case gold
        case copper
        case beige
        case bronz
        case gray
        case silver
        case brown
        case red
        case navy
        case blue
        case purple
        case pink
        case yellow
        case black
        case transparent
        case orange
        case green
        
        func describe() -> String {
            switch self {
            case .gold:              return "Altın"
            case .copper:            return "Bakır"
            case .beige:             return "Bej"
            case .bronz:             return "Bronz"
            case .gray:              return "Gri"
            case .silver:            return "Gümüş"
            case .brown:             return "Kahverengi"
            case .red:               return "Kırmızı"
            case .navy:              return "Lacivert"
            case .blue:              return "Mavi"
            case .purple:            return "Mor"
            case .pink:              return "Pembe"
            case .yellow:            return "Sarı"
            case .black:             return "Siyah"
            case .transparent:       return "Şeffaf"
            case .orange:            return "Turuncu"
            case .green:             return "Yeşil"
            }
        }
    }
}
