//
//  AdvertAutoFirstStepViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import UIKit


final class AdvertAutoFirstStepViewModel: BaseViewModel, AdvertPresentable {
    typealias AdvertType = CarProduct
    
    
    let mock = CarProduct(vehicle: .init(product: .init(heading: "Sahibinden Hatasız Araç", description: "Tertemiz aracım. Sanayinin yanından geçmemiş araç.", seller: .init(id: "id", name: "İbrahim Halil Taşdemir", type: .company, phone: "+905530511443"), adress: .init(country: "Türkiye", city: "Gaziantep", town: "Şehitkamil", district: "Çıksorut", quarter: "Şirinevler"), categoryArray: ["Taşıtlar", "Otomobil", "Renault", "Clio", "0.9 Sport Tourer"], images: []), type: .automobile), brand: .renault, series: .clio, model: "0.9 Sport Tourer", year: 2020, fuel: .diesel, caseType: .sedan, shift: .automatic, traction: .behind, status: .second, kilometer: "240.000", power: "150hp", color: .white, guarantee: true, seriousDamageRegistered: true)
    
    protocol Delegate: AdvertPropertyProvider {
     
    }
    
    weak var delegate: AdvertAutoFirstStepViewModel.Delegate?
    
    let categorys: [String]
    
    init(categorys: [String]) {
        self.categorys = categorys
    }
    
    var advertHeading: String?
    var advertDescription: String?
    var shiftTypeField: CarShiftType?
    var productStatusField: ProductStatus?
    var caseTypeField: CarCaseType?
    var tractionTypeField: CarTractionType?
    var fuelTypeField: CarFuelType?
    var kilometerField: String?
    var yearField: Int?
    var powerField: String?
    var colorField: ProductColor?
    var guarenteField: Bool?
    var seriousDamageField: Bool?
    
    var address: AdressViewModel.Adress?
    var images: [UIImage]?
    
    var sellerData: ProductSeller?
    
    
    func setupBasicInfo() {
        guard
            let _ = advertHeading,
            let _ = advertDescription,
            let _ = shiftTypeField,
            let _ = productStatusField,
            let _ = caseTypeField,
            let _ = tractionTypeField,
            let _ = fuelTypeField,
            let _ = kilometerField,
            let _ = colorField,
            let _ = guarenteField,
            let _ = seriousDamageField else {
            return
        }
        
        delegate?.basicsInfoRequirementsSuccess()
    }
    
    
    func createAdvert() -> CarProduct? {
        guard
            let advertHeadingField = advertHeading,
            let advertDescriptionField = advertDescription,
            let shiftTypeField = shiftTypeField,
            let productStatusField = productStatusField,
            let caseTypeField = caseTypeField,
            let tractionTypeField = tractionTypeField,
            let fuelTypeField = fuelTypeField,
            let kilometerField = kilometerField,
            let yearField = yearField,
            let powerField = powerField,
            let colorField = colorField,
            let guarenteField = guarenteField,
            let seriousDamageField = seriousDamageField,
            let adress = address else {
            return nil
        }
        
        
        let product = Product(heading: advertHeadingField, description: advertDescriptionField, seller: .init(id: "id", name: "İbrahim Halil Taşdemir", type: .individual, phone: "+905530511443"), adress: adress, categoryArray: categorys, images: [])
        let vehicle = Vehicle(product: product, type: .automobile)
        
        
        //Taşıtlar>Otomobil>Renault>Clio>1.5 Sporter
        let brand = CarBrand.allCases.first(where: { $0.describe() == categorys[2] })!
        let series = Car.allCases.first(where: { $0.describe() == categorys[3] })!
        let model = categorys[4]
        
        //Yakıt yok - Yıl yok - Power(hp) yok -
        
        let carProduct = CarProduct(vehicle: vehicle, brand: brand, series: series, model: model, year: yearField, fuel: fuelTypeField, caseType: caseTypeField, shift: shiftTypeField, traction: tractionTypeField, status: productStatusField, kilometer: kilometerField, power: powerField, color: colorField, guarantee: guarenteField, seriousDamageRegistered: seriousDamageField)
        
        return carProduct
    }
    
    func pickImageSuccess(_ images: [UIImage]) {
        guard let advert = createAdvert() else {
            return
        }
        
        delegate?.createAdvertProductSuccess(advert, with: images)
        
    }
    
}
