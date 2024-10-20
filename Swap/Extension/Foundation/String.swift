//
//  String.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import Foundation

public extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(_ bundleClass: AnyClass) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle(for: bundleClass), value: "", comment: "")
    }
    
    func trimmed() -> String? {
        if self.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            return self
        }
        
        return nil
    }
    
}
