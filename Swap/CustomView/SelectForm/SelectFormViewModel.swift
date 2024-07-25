//
//  SelectFormViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import Foundation

final class SelectFormViewModel: BaseViewModel {
    
    protocol Delegate: AnyObject {
        
    }
    
    weak var delegate: SelectFormViewModel.Delegate?
    
    let formType: FormTypeEnum
    
    init(formType: FormTypeEnum) {
        self.formType = formType
    }
    
    lazy var keys: [String] = formType.getForm().keys.sorted(by: <)
    lazy var formElements: [String: Any] = formType.getForm()
    
    
}
