//
//  LandPreview.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 26.07.2024.
//

import UIKit

final class LandPreview: UIView, PreviewLayer {
    typealias PreviewElement = LandProduct
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var advertNumber: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var zoneState: UILabel!
    @IBOutlet weak var sqft: UILabel!
    @IBOutlet weak var islandNo: UILabel!
    @IBOutlet weak var parcelNo: UILabel!
    @IBOutlet weak var sectionNo: UILabel!
    @IBOutlet weak var kaks: UILabel!
    @IBOutlet weak var sizeLimit: UILabel!
    @IBOutlet weak var perfloor: UILabel!
    @IBOutlet weak var landRegister: UILabel!
    
    
    convenience init(preview: LandProduct) {
        self.init(frame: .zero)
        commonInıt(for: preview)
    }
    
    
    internal func commonInıt(for product: LandProduct) {
        Bundle.main.loadNibNamed("LandPreview", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        fillContent(for: product)
    }
    
    internal func fillContent(for product: LandProduct) {
        date.text = product.listingDate
        advertNumber.text = product.id
        type.text = product.type
        zoneState.text = product.zoneState.describe()
        sqft.text = product.sqft.description
        islandNo.text = product.islandNo?.description
        parcelNo.text = product.parcelNo?.description
        sectionNo.text = product.sectionNo
        kaks.text = product.kaks?.describe()
        sizeLimit.text = product.sizeLimit?.describe()
        perfloor.text = product.perfloor.toString()
        landRegister.text = product.landRegister.describe()
    }
    
    
}
