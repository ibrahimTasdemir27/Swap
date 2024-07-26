//
//  House.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 26.07.2024.
//

import Foundation

extension BaseProducts {
    
    protocol BaseHouseAdvert: BaseProducts.Product {
        var sqftGrand: Int? { get }
        var sqftReal: Int? { get }
        var age: Int? { get }
        var floor: Int? { get }
        var bath: Int? { get }
        var room: Room? { get }
        var heating: HeatingType? { get }
        var balcony: Bool? { get }
        var lift: Bool? { get }
        var furniture: Bool? { get }
        var state: EstateState? { get }
        var landRegister: EstateLandRegisterStatus? { get }
    }
    
}
