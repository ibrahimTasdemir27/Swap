//
//  AdvertDetachedViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 25.07.2024.
//

import Foundation


final class AdvertDetachedViewModel: BaseViewModel {
    
    protocol Delegate: AnyObject {
        
    }
    
    weak var delegate: Delegate?
    
}
