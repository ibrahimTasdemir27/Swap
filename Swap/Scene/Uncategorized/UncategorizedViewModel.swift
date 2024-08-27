//
//  UncategorizedViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 1.08.2024.
//

import UIKit


final class UncategorizedViewModel: BaseViewModel, AdvertPresentable {
    typealias AdvertType = Uncategorized
    
    
    weak var delegate: Delegate?
    protocol Delegate: AdvertPropertyProvider {
        
    }
    
    let categorys: [String]
    init(categorys: [String]) {
        self.categorys = categorys
    }
    
    var advertHeading: String?
    var advertDescription: String?
    var guarantee: Bool?
    var state: ProductStatus?
    var address: AdressViewModel.Adress?
    var images: [UIImage]?
    
    
    func setupBasicInfo() {
        guard
            let _ = advertHeading,
            let _ = advertDescription,
            let _ = guarantee,
            let _ = state else {
            return
        }
            
        delegate?.basicsInfoRequirementsSuccess()
    }
    
    func createAdvert() -> Uncategorized? {
        guard
            let advertHeading = advertHeading,
            let advertDescription = advertDescription,
            let guarantee = guarantee,
            let state = state,
            let address = address else {
            return nil
        }
        
        let product: Product = .init(heading: advertHeading, description: advertDescription, seller: .init(id: "id", name: "name", type: .company, phone: "+90"), adress: address, categoryArray: categorys, images: [])
        
        let uncategorized: Uncategorized = .init(product: product, state: state, guarantee: guarantee)
        
        return uncategorized
    }
    
    
    func pickImageSuccess(_ images: [UIImage]) {
        self.images = images
        guard let advert = createAdvert() else {
            return
        }
        
        delegate?.createAdvertProductSuccess(advert, with: images)
        
    }
    
    
}
