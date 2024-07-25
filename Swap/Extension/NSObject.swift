//
//  NSObject.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import Foundation

public extension NSObject {
    static var className: String {
        get {
            guard let className = NSStringFromClass(self).components(separatedBy: ".").last else {
                fatalError("Invalid configuration")
            }
            
            return className
        }
    }
    
    var bundle: Bundle {
        get {
            return Bundle(for: type(of: self))
        }
    }
}
