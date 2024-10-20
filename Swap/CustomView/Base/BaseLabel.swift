//
//  BaseLabel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 28.08.2024.
//

import UIKit

@IBDesignable
class BaseLabel: UILabel {
    
    private var edgeInset: UIEdgeInsets = .zero
    
    @IBInspectable var leftAndRightInset: CGFloat  {
        get {
            return .zero
        }
        set {
            edgeInset.left = newValue
            edgeInset.right = newValue
        }
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: edgeInset.top, left: edgeInset.left, bottom: edgeInset.bottom, right: edgeInset.right)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + edgeInset.left + edgeInset.right, height: size.height + edgeInset.top + edgeInset.bottom)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        fontSize = fontSize + 1 - 1
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
    
    
    
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    
    
    
}
