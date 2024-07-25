//
//  HomeViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 19.07.2024.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
}


final class HomeViewModel: BaseViewModel {
    
    weak var delegate: HomeViewModelDelegate?
    
}
