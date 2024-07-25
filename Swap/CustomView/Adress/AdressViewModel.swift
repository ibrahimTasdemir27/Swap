//
//  AdressViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import Foundation


final class AdressViewModel: BaseViewModel {
    
    struct Adress: Codable, Describer {
        let country: String
        let city: String
        let town: String
        let district: String
        let quarter: String
        
        func describe() -> String {
            return "\(city), \(town), \(district), \(quarter)"
        }
    }
    
    protocol Delegate: AnyObject {
        func readyAdressContent(_ adress: Adress)
    }

    var country: String = "Türkiye"
    var city: String?
    var town: String?
    var district: String?
    var quarter: String?
    
    weak var delegate: AdressViewModel.Delegate?
    
    func setupAdress(country: String, city: String, town: String, district: String, quarter: String) {
        delegate?.readyAdressContent(.init(country: country, city: city, town: town, district: district, quarter: quarter))
    }
    
}
