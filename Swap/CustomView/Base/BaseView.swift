//
//  BaseView.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import UIKit


@IBDesignable
class BaseView: UIView {    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set(value) {
            layer.shadowOpacity = value
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set(value) {
            layer.shadowRadius = value
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get{
            return layer.shadowOffset
        }
        set(value) {
            layer.shadowOffset = value
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            guard let shadowColor = layer.shadowColor else {
                return nil
            }
            
            return UIColor(cgColor: shadowColor)
        }
        set(value) {
            layer.shadowColor = value?.cgColor
        }
    }
}
