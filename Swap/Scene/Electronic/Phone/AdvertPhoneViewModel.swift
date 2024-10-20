//
//  AdvertPhoneViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 28.08.2024.
//

import UIKit


final class AdvertPhoneViewModel: BaseViewModel, AdvertPresentable {
    typealias AdvertType = PhoneProduct
    
    weak var delegate: Delegate?
    protocol Delegate: AdvertPropertyProvider {
        
    }
    
    let categorys: [String]
    init(categorys: [String]) {
        self.categorys = categorys
    }
    
    var advertHeading: String?
    var advertDescription: String?
    var operatingSystem: ElectronicProductEnvironment.PhoneEnvironment.OperatingSystem?
    var ram: ElectronicProductEnvironment.PhoneEnvironment.RAM?
    var screenSize: ElectronicProductEnvironment.PhoneEnvironment.ScreenSize?
    var memory: ElectronicProductEnvironment.PhoneEnvironment.Memory?
    var camera: ElectronicProductEnvironment.PhoneEnvironment.MegaPixel?
    var frontCamera: ElectronicProductEnvironment.PhoneEnvironment.FrontMegaPixel?
    var color: ElectronicProductEnvironment.PhoneEnvironment.Color?
    var guarantee: Bool?
    var state: ProductStatus?
    
    var address: AdressViewModel.Adress?
    var images: [UIImage]?
    
    
    func setupBasicInfo() {
        guard
            let _ = advertHeading,
            let _ = advertDescription,
            let _ = operatingSystem,
            let _ = ram,
            let _ = screenSize,
            let _ = memory,
            let _ = camera,
            let _ = frontCamera,
            let _ = color,
            let _ = guarantee,
            let _ = state else {
            return
        }
            
        delegate?.basicsInfoRequirementsSuccess()
    }
    
    
    func createAdvert() -> PhoneProduct? {
        guard
            let advertHeading = advertHeading,
            let advertDescription = advertDescription,
            let operatingSystem = operatingSystem,
            let ram = ram,
            let screenSize = screenSize,
            let memory = memory,
            let camera = camera,
            let frontCamera = frontCamera,
            let color = color,
            let guarantee = guarantee,
            let state = state,
            let address = address else {
            return nil
        }
        
        let product: Product = .init(heading: advertHeading, description: advertDescription, seller: .init(id: "id", name: "name", type: .company, phone: "+90"), adress: address, categoryArray: categorys, images: [])
        
        let brand = ElectronicProductEnvironment.PhoneEnvironment.Brand.allCases.first { $0.describe() == categorys[3] }!
        let model = categorys[4]
        
        let phone: PhoneProduct = .init(brand: brand, model: model, product: product, operatingSystem: operatingSystem, memory: memory, screenSize: screenSize, ram: ram, camera: camera, frontCamera: frontCamera, color: color, guarantee: guarantee, state: state)
        
        return phone
    }
    
    func pickImageSuccess(_ images: [UIImage]) {
        self.images = images
        guard let advert = createAdvert() else {
            return
        }
        
        delegate?.createAdvertProductSuccess(advert, with: images)
        
    }
    
}
