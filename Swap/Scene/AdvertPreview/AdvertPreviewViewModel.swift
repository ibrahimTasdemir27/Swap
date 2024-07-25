//
//  AdvertPreviewViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 21.07.2024.
//

import UIKit



final class AdvertPreviewViewModel: BaseViewModel {
    
    weak var delegate: AdvertPreviewViewModel.Delegate?
    protocol Delegate: AnyObject {
        func setCarPreviewProduct(_ product: CarProduct)
    }
    
    private var carAutoPreview: CarProduct?
    
    let product: Product
    let images: [UIImage]
    
    init(product: Product, images: [UIImage]) {
        self.product = product
        self.images = images
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProductPreview()
    }
    
    
    func setupProductPreview() {
        if let product = product as? CarProduct {
            self.carAutoPreview = product
            self.delegate?.setCarPreviewProduct(product)
        }
    }
    
}
