//
//  Finalizer.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 24.07.2024.
//

import Foundation


enum Finalizer: String, Describer {
    case car
    case land
    case apartment
    case residence
    case detached
    case villa
    case farm
    case mansion
    case waterside
    case watersideapartment
    case summery
    case prefabricated
    case cooperative
    
    
    func describe() -> String {
        return "Finalizer#\(rawValue)"
    }
}
