//
//  AdvertViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import Foundation

protocol AdvertViewModelDelegate: AnyObject {
    func redirectAdvertAuto()
    func redirectAdvertHouse()
    func redirectAdvertLand()
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
        case .car
            :
            delegate?.redirectAdvertAuto()
        case .apartment:
            delegate?.redirectAdvertHouse()
        case .land:
            delegate?.redirectAdvertLand()
        default: break
        }
    }
}
