//
//  AdvertHouseViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 24.07.2024.
//

import UIKit




final class AdvertHouseViewModel: BaseViewModel, BaseProducts.BaseHouseAdvert, AdvertPresentable {    
    typealias AdvertType = EstateProduct
    
    weak var delegate: Delegate?
    protocol Delegate: AdvertPropertyProvider {
        
    }
    
    let categorys: [String]
    let type: HouseType
    
    init(categorys: [String], type: HouseType) {
        self.categorys = categorys
        self.type = type
    }
    
    
    var advertHeading: String?
    var advertDescription: String?
    var address: AdressViewModel.Adress?
    var images: [UIImage]?
    var sqftGrand: Int?
    var sqftReal: Int?
    var age: Int?
    var floor: Int?
    var bath: Int?
    var room: Room?
    var heating: HeatingType?
    var balcony: Bool?
    var lift: Bool?
    var furniture: Bool?
    var state: EstateState?
    var landRegister: EstateLandRegisterStatus?
    
    func setupBasicInfo() {
        guard
            let _ = advertHeading,
            let _ = advertDescription,
            let _ = sqftGrand,
            let _ = sqftReal,
            let _ = age,
            let _ = floor,
            let _ = bath,
            let _ = room,
            let _ = heating,
            let _ = balcony,
            let _ = lift,
            let _ = furniture,
            let _ = state,
            let _ = landRegister else {
            return
        }
        
        
        
        
        delegate?.basicsInfoRequirementsSuccess()
    }
    
    func createAdvert() -> EstateProduct? {
        guard
            let advertHeadingField = advertHeading,
            let advertDescriptionField = advertDescription,
            let sqftGrand = sqftGrand,
            let sqftReal = sqftReal,
            let age = age,
            let floor = floor,
            let bath = bath,
            let room = room,
            let heating = heating,
            let balcony = balcony,
            let lift = lift,
            let furniture = furniture,
            let state = state,
            let landRegister = landRegister,
            let address = address else {
            return nil
        }
        
        let product: Product = .init(heading: advertHeadingField, description: advertDescriptionField, seller: .init(id: "id", name: "ibrahim halil taşdemir", type: .company, phone: "+905530511443"), adress: address, categoryArray: categorys, images: [])
        
        let estate: EstateProduct = .init(product: product, type: type, sqftGrand: sqftGrand, sqftReal: sqftReal, room: room, age: age, floor: floor, heating: heating, bath: bath, balcony: balcony, lift: lift, furniture: furniture, status: state, landRegister: landRegister)
        
        return estate
    }
    
    func pickImageSuccess(_ images: [UIImage]) {
        self.images = images
        guard let advert = createAdvert() else {
            return
        }
        
        delegate?.createAdvertProductSuccess(advert, with: images)
    }
    
    
    
}
