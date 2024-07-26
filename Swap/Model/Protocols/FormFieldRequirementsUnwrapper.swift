//
//  FormFieldRequirementsUnwrapper.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 25.07.2024.
//

import Foundation

typealias FormFieldAllRequirementsUnwrapper = FormFieldRequirementsUnwrapper & FormFieldRequirementsNumericUnwrapper

protocol FormFieldRequirementsUnwrapper {
    var allFields: [BaseFormRequirements] { get }
}

extension FormFieldRequirementsUnwrapper where Self: AlertPresentable {
    func wrappedValue() -> Bool {
        var value: Bool = true
        for index in 0..<allFields.count {
            let element = allFields[index]
            
            if element.safeText() == nil {
                element.falseFormat()
                showAlert(with: "Lütfen boş alanları doldurun.") { element.reset() }
                value = false
                break
            }
        }
        return value
    }
}


protocol FormFieldRequirementsNumericUnwrapper {
    var numericFields: [BaseFormRequirements] { get }
}

extension FormFieldRequirementsNumericUnwrapper where Self: AlertPresentable {
    func wrappedNumericValue() -> Bool {
        var value: Bool = true
        for index in 0..<numericFields.count {
            let element = numericFields[index]
            
            if Double(element.safeText() ?? "") == nil {
                element.falseFormat()
                showAlert(with: "Lütfen sayısal bir değer giriniz.", completion: nil) 
                value = false
                break
            }
        }
        return value
    }
}
