//
//  AdvertDesktopViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 31.07.2024.
//

import UIKit


final class AdvertDesktopViewModel: BaseViewModel, AdvertPresentable {
    typealias AdvertType = DesktopProduct
    
    weak var delegate: Delegate?
    protocol Delegate: AdvertPropertyProvider {
        
    }
    
    let categorys: [String]
    init(categorys: [String]) {
        self.categorys = categorys
    }
    
    
    var advertHeading: String?
    var advertDescription: String?
    var processor: String?
    var ram: ElectronicProductEnvironment.ComputerEnvironment.RAM?
    var hdd: ElectronicProductEnvironment.ComputerEnvironment.HDD?
    var ssd: ElectronicProductEnvironment.ComputerEnvironment.SSD?
    var displayCard: ElectronicProductEnvironment.ComputerEnvironment.DisplayCard?
    var screenSize: ElectronicProductEnvironment.ComputerEnvironment.ScreenSize?
    var caseType: ElectronicProductEnvironment.DesktopEnvironment.CaseType?
    var guarantee: Bool?
    var state: ProductStatus?
    
    var address: AdressViewModel.Adress?
    var images: [UIImage]?
    
    
    func setupBasicInfo() {
        guard
            let _ = advertHeading,
            let _ = advertDescription,
            let _ = processor,
            let _ = ram,
            let _ = hdd,
            let _ = ssd,
            let _ = displayCard,
            let _ = screenSize,
            let _ = caseType,
            let _ = guarantee,
            let _ = state else {
            return
        }
        
        
        delegate?.basicsInfoRequirementsSuccess()
    }
    
    func createAdvert() -> DesktopProduct? {
        guard
            let advertHeading = advertHeading,
            let advertDescription = advertDescription,
            let processor = processor,
            let ram = ram,
            let hdd = hdd,
            let ssd = ssd,
            let displayCard = displayCard,
            let screenSize = screenSize,
            let caseType = caseType,
            let guarantee = guarantee,
            let state = state,
            let address = address else {
            return nil
        }
        
        
        let product: Product = .init(heading: advertHeading, description: advertDescription, seller: .init(id: "id", name: "name", type: .company, phone: "+90"), adress: address, categoryArray: categorys, images: [])
        
        let electronic: ElectronicProduct = .init(product: product, guarantee: guarantee)
        
        let computer: ElectronicProductEnvironment.BaseComputer = .init(electronic: electronic, processor: processor, brand: categorys.last ?? "Belirtilmemiş", state: state, ram: ram, hdd: hdd, ssd: ssd, displayCard: displayCard, screenSize: screenSize)
        
        let desktopProduct: DesktopProduct = .init(computer: computer, caseType: caseType)
        
        return desktopProduct
    }
    
    func pickImageSuccess(_ images: [UIImage]) {
        self.images = images
        guard let advert = createAdvert() else {
            return
        }
        
        delegate?.createAdvertProductSuccess(advert, with: images)
        
    }
    
}
