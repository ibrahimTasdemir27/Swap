//
//  FontEnums.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 28.08.2024.
//

import UIKit

enum FontEnums {
    
    enum Montserrat: Int {
        case thin
        case extralight
        case light
        case regular
        case medium
        case semibold
        case bold
        case extrabold
        case black
        
        
        
        func getFont(size: CGFloat = 14) -> UIFont? {
            return UIFont(name: fontName, size: size)
        }
        
        private var fontName: String {
            switch self {
            case .black:            return "Montserrat-Black"
            case .bold:             return "Montserrat-Bold"
            case .extrabold:        return "Montserrat-ExtraBold"
            case .extralight:       return "Montserrat-ExtraLight"
            case .light:            return "Montserrat-Light"
            case .medium:           return "Montserrat-Medium"
            case .regular:          return "Montserrat-Regular"
            case .semibold:         return "Montserrat-SemiBold"
            case .thin:             return "Montserrat-Thin"
            }
        }
    }
    
}
