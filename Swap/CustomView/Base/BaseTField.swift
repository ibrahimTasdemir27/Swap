//
//  BaseTField.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 28.08.2024.
//

import UIKit

@IBDesignable
final class BaseTField: UITextField {
    
    private var padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    @IBInspectable var paddingV: CGFloat = 0 {
        didSet {
            guard paddingV > 0 else {
                return
            }
            padding = UIEdgeInsets(top: 0, left: paddingV, bottom: 0, right: paddingV)
        }
    }
    
    
    @IBInspectable var fontRaw: Int = 1 {
        didSet {
            
        }
    }
    
    @IBInspectable var fontSize: Int = 14 {
        didSet {
            guard let font = FontEnums.Montserrat(rawValue: fontRaw) else {
                return
            }
            
            self.font = font.getFont(size: CGFloat(fontSize))
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
    
    
    
    private func setup() {
        self.font = FontEnums.Montserrat(rawValue: fontRaw)?.getFont(size: CGFloat(fontSize))
    }
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
}
