//
//  CarPreview.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 21.07.2024.
//

import UIKit

final class CarPreview: UIView, PreviewLayer {
    typealias PreviewElement = CarProduct
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var advertNumber: UILabel!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var series: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var fuel: UILabel!
    @IBOutlet weak var shift: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var kilometer: UILabel!
    @IBOutlet weak var caseType: UILabel!
    @IBOutlet weak var power: UILabel!
    @IBOutlet weak var traction: UILabel!
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var guarantee: UILabel!
    @IBOutlet weak var seriousDamage: UILabel!
    
    
    convenience init(preview car: CarProduct) {
        self.init(frame: .zero)
        commonInıt(for: car)
    }
    
    private func commonInıt(for product: CarProduct) {
        Bundle.main.loadNibNamed("CarPreview", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        fillContent(for: product)
    }
    
    private func fillContent(for product: CarProduct) {
        date.text = product.listingDate
        advertNumber.text = product.id
        brand.text = product.brand.describe()
        series.text = product.series.describe()
        model.text = product.model
        year.text = product.year.description
        fuel.text = product.fuel.describe()
        shift.text = product.shift.describe()
        status.text = product.status.describe()
        kilometer.text = product.kilometer
        caseType.text = product.caseType.describe()
        power.text = product.power
        traction.text = product.traction.describe()
        color.text = product.color.describe()
        guarantee.text = product.guarentee ? "Evet" : "Hayır"
        seriousDamage.text = product.seriousDamageRegistered ? "Evet" : "Hayır"
        
        
    }
}
