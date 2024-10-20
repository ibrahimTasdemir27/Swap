//
//  BaseButton.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import UIKit

@IBDesignable
final class BaseButton: UIButton {
    
    @IBInspectable var autoLocalization: Bool = true
    var localizableText:String?
    
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

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup(){
        fontSize = fontSize + 1 - 1
        if autoLocalization == true && currentTitle != nil {
            localizableText = self.currentTitle
            super.setTitle(localizableText?.localized, for: UIControl.State())
        }
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        if autoLocalization == true && title != nil {
            super.setTitle(title?.localized, for: state)
        } else {
            super.setTitle(title, for: state)
        }
    }
    
    @IBInspectable var fontRaw: Int = 1 {
        didSet {
            guard let font = FontEnums.Montserrat(rawValue: fontRaw) else {
                 return
             }
             titleLabel?.font = font.getFont(size: CGFloat(fontSize))
        }
    }
    
    @IBInspectable var fontSize: Int = 14 {
        didSet {
            guard let font = FontEnums.Montserrat(rawValue: fontRaw) else {
                return
            }
            titleLabel?.font = font.getFont(size: CGFloat(fontSize))
        }
    }

    
}
