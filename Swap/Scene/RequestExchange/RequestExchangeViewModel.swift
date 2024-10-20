//
//  RequestExchangeViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 28.08.2024.
//

import Foundation


final class RequestExchangeViewModel: BaseViewModel {
    
    weak var delegate: Delegate?
    protocol Delegate: AnyObject {
        
    }
    
    var productHeader: String?
    var productDescription: String?
    
}
