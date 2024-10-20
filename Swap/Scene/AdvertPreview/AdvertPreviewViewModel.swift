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
        func setHousePreview(_ product: EstateProduct)
        func setSiteHousePreview(_ product: SiteHouseProduct)
        func setLandPreview(_ product: LandProduct)
        func setPhonePreview(_ product: PhoneProduct)
        func setUncategorizedPreview(_ product: Uncategorized)
    }
    
    private var carAutoPreview: CarProduct?
    private var housePreview: EstateProduct?
    private var siteHousePreview: SiteHouseProduct?
    private var landPreview: LandProduct?
    private var phonePreview: PhoneProduct?
    private var uncategorizedPreview: Uncategorized?
    
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
        } else
        
        if let product = product as? EstateProduct {
            self.housePreview = product
            self.delegate?.setHousePreview(product)
        } else
        
        if let product = product as? SiteHouseProduct {
            self.siteHousePreview = product
            self.delegate?.setSiteHousePreview(product)
        } else
        
        if let product = product as? LandProduct {
            self.landPreview = product
            self.delegate?.setLandPreview(product)
        }
        if let product = product as? PhoneProduct {
            self.phonePreview = product
            self.delegate?.setPhonePreview(product)
        }
        if let product = product as? Uncategorized {
            self.uncategorizedPreview = product
            self.delegate?.setUncategorizedPreview(product)
        }
    }
    
}
