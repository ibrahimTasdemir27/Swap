//
//  FormField.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import UIKit


final class ONFormField: BaseFormField {
    override func start() {
        super.start()
        self.addTarget(self, action: #selector(endEditingUI), for: .editingDidEnd)
    }
    
    override func startEditingUI() {
        let color = UIColor.systemBlue.withAlphaComponent(0.5)
        self.layer.cornerRadius = 8
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 3
    }
    
    @objc internal func endEditingUI() {
        self.layer.borderWidth = 0
        self.layer.cornerRadius = 0
    }
}
