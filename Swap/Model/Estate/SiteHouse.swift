//
//  SiteHouse.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 24.07.2024.
//

import Foundation

@frozen enum AutoPark: Describer, CaseIterable, Codable {
    case open
    case close
    case openclose
    case none
    
    func describe() -> String {
        switch self {
        case .open:             return "Açık Otopark"
        case .close:            return "Kapalı Otopark"
        case .openclose:        return "Açık & Kapalı Otopark"
        case .none:             return "Yok"
        }
    }
}


class SiteHouse: Estate {
    let floorLocation: Int
    let autopark: AutoPark
    let subscription: Int
    let site: Bool
    let siteName: String
    
    init(estate: Estate, floorLocation: Int, autopark: AutoPark, subscription: Int, site: Bool, siteName: String) {
        self.floorLocation = floorLocation
        self.autopark = autopark
        self.subscription = subscription
        self.site = site
        self.siteName = siteName
        super.init(estate: estate)
    }
    
    
    
    @frozen private enum CodingKeys: CodingKey {
        case floorLocation, autopark, subscription, site, siteName
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        floorLocation = try container.decode(Int.self, forKey: .floorLocation)
        autopark = try container.decode(AutoPark.self, forKey: .autopark)
        subscription = try container.decode(Int.self, forKey: .subscription)
        site = try container.decode(Bool.self, forKey: .site)
        siteName = try container.decode(String.self, forKey: .siteName)
        try super.init(from: decoder)
    }
    
}
