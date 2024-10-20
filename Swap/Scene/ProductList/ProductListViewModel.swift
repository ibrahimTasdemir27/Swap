//
//  ProductListViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 28.08.2024.
//

import Foundation


final class ProductListViewModel: BaseViewModel {
    weak var delegate: Delegate?
    protocol Delegate: AnyObject {
        
    }
    
    var products: [Product] = []
    override func viewDidLoad() {
        
    }
    
}



