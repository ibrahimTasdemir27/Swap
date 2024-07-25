//
//  AdvertHouseViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 24.07.2024.
//

import Foundation


final class AdvertHouseViewModel: BaseViewModel {
    
    protocol Delegate: AnyObject {
        
    }
    
    weak var delegate: Delegate?
    
}
