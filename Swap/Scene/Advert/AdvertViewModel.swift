//
//  AdvertViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import Foundation

protocol AdvertViewModelDelegate: AnyObject {
    func redirectAdvertAuto()
    func redirectAdvertHouse(for type: HouseType)
    func redirectAdvertApartment()
    func redirectAdvertResidence()
    func redirectAdvertLand()
    func redirectAdvertDesktop()
    func redirectAdvertNotebook()
    func redirectAdvertPhone()
    func redirectUncategorized()
}


final class AdvertViewModel: BaseViewModel {
    
    weak var delegate: AdvertViewModelDelegate?
    
    let categoryContent: [String: Any]
    
    var selectedContents: [String]
    
    init(categoryContent: [String: Any], selectedContents: [String] = []) {
        self.categoryContent = categoryContent
        self.selectedContents = selectedContents
    }
    
    
    func finalizeCategory(_ value: Finalizer, with key: String?) {
        if let key = key { selectedContents.append(key) }
        switch value {
        case .car:
            delegate?.redirectAdvertAuto()
        case .land:
            delegate?.redirectAdvertLand()
        case .apartment:
            delegate?.redirectAdvertApartment()
        case .residence:
            delegate?.redirectAdvertResidence()
        case .detached:
            delegate?.redirectAdvertHouse(for: .detached)
        case .villa:
            delegate?.redirectAdvertHouse(for: .villa)
        case .farm:
            delegate?.redirectAdvertHouse(for: .farm)
        case .mansion:
            delegate?.redirectAdvertHouse(for: .mansion)
        case .waterside:
            delegate?.redirectAdvertHouse(for: .waterside)
        case .watersideapartment:
            delegate?.redirectAdvertHouse(for: .watersideapartment)
        case .summery:
            delegate?.redirectAdvertHouse(for: .summery)
        case .prefabricated:
            delegate?.redirectAdvertHouse(for: .prefabricated)
        case .cooperative:
            delegate?.redirectAdvertHouse(for: .cooperative)
        case .desktop:
            delegate?.redirectAdvertDesktop()
        case .notebook:
            delegate?.redirectAdvertNotebook()
        case .phone:
            delegate?.redirectAdvertPhone()
        case .desktopequipment, .notebookequipment, .notebookreplacementpart:
            delegate?.redirectUncategorized()
        case .accessorieslaptop, .accessoriestablet, .accessoriesusb, .accessoriesrepair, .accessoriesbag, .accessoriesmousepad, .accessoriesbatch:
            delegate?.redirectUncategorized()
        case .tablet, .tabletreplacementpart, .monitor:
            delegate?.redirectUncategorized()
        case .phoneaccessories, .phonereplacementpart, .phoneoperators, .wearabletech:
            delegate?.redirectUncategorized()
        case .otherelectronic:
            delegate?.redirectUncategorized()
        }
    }
    
    
}
    
