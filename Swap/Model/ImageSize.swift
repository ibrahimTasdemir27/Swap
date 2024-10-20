//
//  ImageSize.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 29.08.2024.
//

import Foundation

enum ImageSize {
    case small
    case medium
    case large
    
    var fileName: String {
        switch self {
        case .small:    return "3xFull.jpeg"
        case .medium:   return "2xFull.jpeg"
        case .large:    return "1xFull.jpeg"
        }
    }
}
