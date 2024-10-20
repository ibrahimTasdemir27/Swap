//
//  ExchangeViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 29.08.2024.
//

import Foundation


final class ExchangeViewModel: BaseViewModel {
    
    protocol Delegate: AnyObject {
        
    }
    
    weak var delegate: Delegate?
    
}
