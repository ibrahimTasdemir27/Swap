//
//  SafeText.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import UIKit

@objc protocol SafeTextRepresenter {
    
}

extension SafeTextRepresenter where Self: UITextField {
    func safeText() -> String? {
        if let text = text, text.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            return text
        }
        
        return nil
    }
}


