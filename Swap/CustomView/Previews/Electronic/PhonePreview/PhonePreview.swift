//
//  PhonePreview.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 28.08.2024.
//

import UIKit

final class PhonePreview: UIView, PreviewLayer {
    typealias PreviewElement = PhoneProduct
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var advertNumber: UILabel!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var operatingSystem: UILabel!
    @IBOutlet weak var memory: UILabel!
    @IBOutlet weak var screenSize: UILabel!
    @IBOutlet weak var ram: UILabel!
    @IBOutlet weak var camera: UILabel!
    @IBOutlet weak var frontCamera: UILabel!
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var guarantee: UILabel!
    @IBOutlet weak var state: UILabel!
    
    
    convenience init(preview: PhoneProduct) {
        self.init(frame: .zero)
        commonInıt(for: preview)
    }
    
    func commonInıt(for product: PhoneProduct) {
        Bundle.main.loadNibNamed("PhonePreview", owner: self)
        addSubview(contentView)
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.frame = bounds
        fillContent(for: product)
    }
    
    func fillContent(for product: PhoneProduct) {
        date.text = product.listingDate
        advertNumber.text = product.id
        brand.text = product.brand.describe()
        model.text = product.model
        operatingSystem.text = product.operatingSystem.describe()
        memory.text = product.memory.describe()
        screenSize.text = product.screenSize.describe()
        ram.text = product.ram.describe()
        camera.text = product.camera.describe()
        frontCamera.text = product.frontCamera.describe()
        color.text = product.color.describe()
        guarantee.text = product.guarantee.toString()
        state.text = product.state.describe()
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
}
