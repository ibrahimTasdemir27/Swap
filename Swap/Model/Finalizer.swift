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
    
    
    
    case desktop
    case desktopequipment
    
    case notebook
    case notebookequipment
    case notebookreplacementpart
    
    case accessorieslaptop
    case accessoriestablet
    case accessoriesusb
    case accessoriesrepair
    case accessoriesbag
    case accessoriesmousepad
    case accessoriesbatch
    
    case tablet
    case tabletreplacementpart
    
    func describe() -> String {
        return "Finalizer#\(rawValue)"
    }
}
