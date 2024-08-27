//
//  AdvertResidenceViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 25.07.2024.
//

import UIKit


final class AdvertResidenceViewModel: BaseViewModel, AdvertPresentable {
    typealias AdvertType = SiteHouseProduct
    
    protocol Delegate: AdvertPropertyProvider {

    }
    
    weak var delegate: Delegate?
    
    let categorys: [String]
    let type: HouseType = .residence
    
    init(categorys: [String]) {
        self.categorys = categorys
    }
    
    
    var advertHeading: String?
    var advertDescription: String?
    var sqftGrand: Int?
    var sqftReal: Int?
    var age: Int?
    var floorLocation: Int?
    var floor: Int?
    var bath: Int?
    var room: Room?
    var heating: HeatingType?
    var balcony: Bool?
    var lift: Bool?
    var autopark: AutoPark?
    var furniture: Bool?
    var state: EstateState?
    var site: Bool?
    var siteName: String?
    var subscription: Int?
    var landRegister: EstateLandRegisterStatus?
    var address: AdressViewModel.Adress?
    var images: [UIImage]?
    
    
    func setupBasicInfo() {
        guard
            let _ = advertHeading,
            let _ = advertDescription,
            let _ = sqftGrand,
            let _ = sqftReal,
            let _ = age,
            let _ = floorLocation,
            let _ = floor,
            let _ = bath,
            let _ = room,
            let _ = heating,
            let _ = balcony,
            let _ = lift,
            let _ = autopark,
            let _ = furniture,
            let _ = state,
            let _ = site,
            let _ = subscription,
            let _ = landRegister else {
            return
        }
        
        
        
        
        delegate?.basicsInfoRequirementsSuccess()
    }
    
    func createAdvert() -> SiteHouseProduct? {
        guard
            let advertHeadingField = advertHeading,
            let advertDescriptionField = advertDescription,
            let sqftGrand = sqftGrand,
            let sqftReal = sqftReal,
            let age = age,
            let floorLocation = floorLocation,
            let floor = floor,
            let bath = bath,
            let room = room,
            let heating = heating,
            let balcony = balcony,
            let lift = lift,
            let autopark = autopark,
            let furniture = furniture,
            let state = state,
            let site = site,
            let subscription = subscription,
            let landRegister = landRegister,
            let address = address else {
            return nil
        }
        
        let product: Product = .init(heading: advertHeadingField, description: advertDescriptionField, seller: .init(id: "id", name: "ibrahim halil taşdemir", type: .company, phone: "+905530511443"), adress: address, categoryArray: categorys, images: [])
        
        let estate: EstateProduct = .init(product: product, type: type, sqftGrand: sqftGrand, sqftReal: sqftReal, room: room, age: age, floor: floor, heating: heating, bath: bath, balcony: balcony, lift: lift, furniture: furniture, status: state, landRegister: landRegister)
        
        let house: SiteHouseProduct = .init(estate: estate, floorLocation: floorLocation, autopark: autopark, subscription: subscription, site: site, siteName: siteName ?? "Belirtilmemiş")
        
        return house
    }
    
    func pickImageSuccess(_ images: [UIImage]) {
        self.images = images
        guard let advert = createAdvert() else {
            return
        }
        
        delegate?.createAdvertProductSuccess(advert, with: images)
    }
    
    
}
