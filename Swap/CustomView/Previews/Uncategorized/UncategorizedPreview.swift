//
//  UncategorizedPreview.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 27.08.2024.
//

import UIKit

final class UncategorizedPreview: UIView, PreviewLayer {
    typealias PreviewElement = Uncategorized
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var advertNumber: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var guarantee: UILabel!
    
    convenience init(preview: Uncategorized) {
        self.init(frame: .zero)
        commonInıt(for: preview)
    }
    
    func commonInıt(for product: Uncategorized) {
        Bundle.main.loadNibNamed("UncategorizedPreview", owner: self)
        addSubview(contentView)
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.frame = bounds
        fillContent(for: product)
    }
    
    func fillContent(for product: Uncategorized) {
        date.text = product.listingDate
        advertNumber.text = product.id
        state.text = product.state.describe()
        guarantee.text = product.guarantee.toString()
    }

    
    
}
