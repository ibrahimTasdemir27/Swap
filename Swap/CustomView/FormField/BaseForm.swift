//
//  BaseForm.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 21.07.2024.
//

import UIKit

protocol BaseFormRequirements: AnyObject {
    func falseFormat()
    func reset()
    func safeText() -> String?
}


class BaseFormField: UITextField, BaseFormRequirements, Animetable, SafeTextRepresenter {
    func start() {
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.addTarget(self, action: #selector(startEditingUI), for: .editingDidBegin)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        start()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        start()
    }
    
    @objc func startEditingUI() {
        
    }

    func falseFormat() {
        self.shake()
        self.layer.borderColor = UIColor.systemRed.withAlphaComponent(0.68).cgColor
        self.layer.borderWidth = 1.5
    }
    
    func reset() {
        self.layer.borderWidth = 0
        self.layer.cornerRadius = 0
    }
}
