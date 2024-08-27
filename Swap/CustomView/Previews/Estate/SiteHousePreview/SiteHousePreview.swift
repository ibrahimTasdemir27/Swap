//
//  SiteHousePreview.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 26.07.2024.
//

import UIKit

final class SiteHousePreview: UIView, PreviewLayer {
    typealias PreviewElement = SiteHouseProduct
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var advertNumber: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var sqftGrand: UILabel!
    @IBOutlet weak var sqftReal: UILabel!
    @IBOutlet weak var room: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var floorLocation: UILabel!
    @IBOutlet weak var floor: UILabel!
    @IBOutlet weak var heating: UILabel!
    @IBOutlet weak var bath: UILabel!
    @IBOutlet weak var balcony: UILabel!
    @IBOutlet weak var lift: UILabel!
    @IBOutlet weak var autopark: UILabel!
    @IBOutlet weak var furniture: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var site: UILabel!
    @IBOutlet weak var siteName: UILabel!
    @IBOutlet weak var subscription: UILabel!
    @IBOutlet weak var landRegister: UILabel!
    
    
    
    
    convenience init(preview: SiteHouseProduct) {
        self.init(frame: .zero)
        commonInıt(for: preview)
    }
    
    
    internal func commonInıt(for product: SiteHouseProduct) {
        Bundle.main.loadNibNamed("SiteHousePreview", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        fillContent(for: product)
    }
    
    
    internal func fillContent(for product: SiteHouseProduct) {
        date.text = product.listingDate
        advertNumber.text = product.id
        type.text = product.type.describe()
        sqftGrand.text = product.sqftGrand.description
        sqftReal.text = product.sqftReal.description
        room.text = product.room.describe()
        age.text = product.age.description
        floor.text = product.floor.description
        heating.text = product.heating.describe()
        bath.text = product.bath.description
        balcony.text = product.balcony.toString()
        lift.text = product.lift.toString()
        furniture.text = product.furniture.toString()
        status.text = product.status.describe()
        landRegister.text = product.landRegister.describe()
    }
}
