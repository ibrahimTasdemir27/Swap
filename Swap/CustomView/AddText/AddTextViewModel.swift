//
//  AddTextViewModel.swift
//  HaydiGram
//
//  Created by İbrahim Taşdemir on 24.08.2024.
//

import Foundation


final class AddTextViewModel: BaseViewModel {
    
    protocol Delegate: AnyObject {
        
    }
    
    weak var delegate: Delegate?
    
}
