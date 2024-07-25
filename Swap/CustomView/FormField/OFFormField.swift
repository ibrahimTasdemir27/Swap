//
//  OFFormField.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 21.07.2024.
//

import UIKit


final class OFFormField: BaseFormField, SelectFormViewController.Delegate {
    
    var formTypeEnum: FormTypeEnum!
    var changedFormElement: ((Any?) -> Void)? = nil
    
    func didSelectFormElement(_ formType: FormTypeEnum, for value: Any?) {
        if let value = value as? Describer {
            self.text = value.describe()
        } else if let value = value as? String {
            self.text = value
        } else if let value = value as? Bool {
            self.text = value ? "Evet" : "Hayır"
        }
        changedFormElement?(value)
    }
    
    @objc override func startEditingUI() {
        endEditing(true)
        
        guard let root = findViewController() else {
            return
        }
        
        let vc = SelectFormViewController.create(for: formTypeEnum)
        vc.defaultElement = text
        vc.delegate = self
        root.present(vc, animated: true)
    }
    
}
