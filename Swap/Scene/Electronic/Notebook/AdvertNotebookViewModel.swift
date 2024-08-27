//
//  AdvertNotebookViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 31.07.2024.
//

import UIKit


final class AdvertNotebookViewModel: BaseViewModel, AdvertPresentable {
    typealias AdvertType = NotebookProduct
    
    weak var delegate: (any Delegate)?
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
    var resolution: ElectronicProductEnvironment.NotebookEnvironment.Resolution?
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
            let _ = resolution,
            let _ = guarantee,
            let _ = state else {
            return
        }
        
        
        delegate?.basicsInfoRequirementsSuccess()
    }
    
    func createAdvert() -> NotebookProduct? {
        guard
            let advertHeading = advertHeading,
            let advertDescription = advertDescription,
            let processor = processor,
            let ram = ram,
            let hdd = hdd,
            let ssd = ssd,
            let displayCard = displayCard,
            let screenSize = screenSize,
            let resolution = resolution,
            let guarantee = guarantee,
            let state = state,
            let address = address else {
            return nil
        }
        
        
        let product: Product = .init(heading: advertHeading, description: advertDescription, seller: .init(id: "id", name: "name", type: .company, phone: "+90"), adress: address, categoryArray: categorys, images: [])
        
        let electronic: ElectronicProduct = .init(product: product, guarantee: guarantee)
        
        let computer: ElectronicProductEnvironment.BaseComputer = .init(electronic: electronic, processor: processor, brand: categorys.last ?? "Belirtilmemiş", state: state, ram: ram, hdd: hdd, ssd: ssd, displayCard: displayCard, screenSize: screenSize)
        
        let notebookProduct: NotebookProduct = .init(computer: computer, resolution: resolution)
        
        return notebookProduct
    }
    
    
    func pickImageSuccess(_ images: [UIImage]) {
        self.images = images
        guard let advert = createAdvert() else {
            return
        }
        
        delegate?.createAdvertProductSuccess(advert, with: images)
        
    }
    
}
