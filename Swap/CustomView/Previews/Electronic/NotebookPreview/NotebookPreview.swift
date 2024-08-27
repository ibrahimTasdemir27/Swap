//
//  NotebookPreview.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 1.08.2024.
//

import UIKit

final class NotebookPreview: UIView, PreviewLayer {
    typealias PreviewElement = NotebookProduct
    
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var advertNumber: UILabel!
    
    @IBOutlet weak var processor: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var ram: UILabel!
    @IBOutlet weak var hdd: UILabel!
    @IBOutlet weak var ssd: UILabel!
    @IBOutlet weak var displaycard: UILabel!
    @IBOutlet weak var screenSize: UILabel!
    @IBOutlet weak var resolution: UILabel!
    @IBOutlet weak var guarantee: UILabel!
    
    convenience init(preview: NotebookProduct) {
        self.init(frame: .zero)
        commonInıt(for: preview)
    }
    
    func commonInıt(for product: NotebookProduct) {
        Bundle.main.loadNibNamed("NotebookPreview", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        fillContent(for: product)
    }
    
    func fillContent(for product: NotebookProduct) {
        date.text = product.listingDate
        advertNumber.text = product.id
        processor.text = product.processor
        state.text = product.state.describe()
        ram.text = product.ram.describe()
        hdd.text = product.hdd.describe()
        ssd.text = product.ssd.describe()
        displaycard.text = product.displaycard.describe()
        screenSize.text = product.screenSize.describe()
        resolution.text = product.resolution.describe()
        guarantee.text = product.guarantee.toString()
    }
    
    
}
