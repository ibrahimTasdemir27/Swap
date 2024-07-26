//
//  AdvertLandViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 26.07.2024.
//

import UIKit


final class AdvertLandViewModel: BaseViewModel, AdvertPresentable {
    typealias AdvertType = LandProduct
    
    
    weak var delegate: Delegate?
    protocol Delegate: AdvertPropertyProvider {
        func createAdvertLandProductSuccess(_ product: LandProduct, with images: [UIImage])
    }
    
    let category: [String]
    
    init(category: [String]) {
        self.category = category
    }
    
    
    var advertHeadingField: String?
    var advertDescriptionField: String?
    var address: AdressViewModel.Adress?
    var images: [UIImage]?
    var zoneState: ZoneState?
    var sqft: Int?
    var islandNo: Int?
    var parcelNo: Int?
    var sectionNo: String?
    var kaks: KAKS?
    var sizeLimit: SizeLimitBuilding?
    var perfloor: Bool?
    var landRegister: LandRegisterStatus?
    
    
    func setupBasicInfo() {
        guard
            let _ = advertHeadingField,
            let _ = advertDescriptionField,
            let _ = zoneState,
            let _ = sqft,
            let _ = perfloor,
            let _ = landRegister else {
            return
        }
        
        delegate?.basicsInfoRequirementsSuccess()
        
    }
    
    func createAdvert() -> LandProduct? {
        guard
            let advertHeadingField = advertHeadingField,
            let advertDescriptionField = advertDescriptionField,
            let zoneState = zoneState,
            let sqft = sqft,
            let perfloor = perfloor,
            let landRegister = landRegister,
            let address = address else {
            return nil
        }
        
        let product: Product = .init(heading: advertHeadingField, description: description, seller: .init(id: "id", name: "İbrahim Halil Taşdemir", type: .company, phone: "+905530511443"), adress: address, categoryArray: category, images: [])
        
        let land: LandProduct = .init(product: product, zoneState: zoneState, sqft: sqft, islandNo: islandNo, parcelNo: parcelNo, sectionNo: sectionNo, kaks: kaks, sizeLimit: sizeLimit, perfloor: perfloor, landRegister: landRegister)
        
        return land
    }
    
    func pickImageSuccess(_ images: [UIImage]) {
        self.images = images
        guard let advert = createAdvert() else {
            return
        }
        
        delegate?.createAdvertLandProductSuccess(advert, with: images)
        
    }
    
}
