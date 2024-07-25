//
//  AdvertAutoFirstStepViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import UIKit



final class AdvertAutoFirstStepViewModel: BaseViewModel {
    
    let mock = CarProduct(vehicle: .init(product: .init(heading: "Sahibinden Hatasız Araç", description: "Tertemiz aracım. Sanayinin yanından geçmemiş araç.", seller: .init(id: "id", name: "İbrahim Halil Taşdemir", type: .company, phone: "+905530511443"), adress: .init(country: "Türkiye", city: "Gaziantep", town: "Şehitkamil", district: "Çıksorut", quarter: "Şirinevler"), category: "Taşıtlar > Otomobil > Renault > Clio > 0.9 Sport Tourer", categoryArray: ["Taşıtlar", "Otomobil", "Renault", "Clio", "0.9 Sport Tourer"], images: []), type: .automobile), brand: .renault, series: .clio, model: "0.9 Sport Tourer", year: 2020, fuel: .diesel, caseType: .sedan, shift: .automatic, traction: .behind, status: .second, kilometer: "240.000", power: "150hp", color: .white, guarantee: true, seriousDamageRegistered: true)
    
    protocol Delegate: AnyObject {
        func basicsInfoRequirementsSuccess()
        func createAdvertAutoProductSuccess(_ product: CarProduct, with images: [UIImage])
    }
    
    weak var delegate: AdvertAutoFirstStepViewModel.Delegate?
    
    let categorys: [String]
    
    init(categorys: [String]) {
        self.categorys = categorys
    }
    
    var advertHeadingField: String?
    var advertDescriptionField: String?
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
    var adress: AdressViewModel.Adress?
    
    var sellerData: ProductSeller?
    
    
    func setupBasicInfo() {
        guard
            let _ = advertHeadingField,
            let _ = advertDescriptionField,
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
    
    
    func pickImageSuccess(_ images: [UIImage]) {
        guard
            let advertHeadingField = advertHeadingField,
            let advertDescriptionField = advertDescriptionField,
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
            let adress = adress else {
            return
        }
        
        
        let product = Product(heading: advertHeadingField, description: advertDescriptionField, seller: .init(id: "id", name: "İbrahim Halil Taşdemir", type: .individual, phone: "+905530511443"), adress: adress, category: categorys.joined(separator: " > "), categoryArray: categorys, images: [])
        let vehicle = Vehicle(product: product, type: .automobile)
        
        
        //Taşıtlar>Otomobil>Renault>Clio>1.5 Sporter
        let brand = CarBrand.allCases.first(where: { $0.describe() == categorys[2] })!
        let series = Car.allCases.first(where: { $0.describe() == categorys[3] })!
        let model = categorys[4]
        
        //Yakıt yok - Yıl yok - Power(hp) yok -
        
        let carProduct = CarProduct(vehicle: vehicle, brand: brand, series: series, model: model, year: yearField, fuel: fuelTypeField, caseType: caseTypeField, shift: shiftTypeField, traction: tractionTypeField, status: .second, kilometer: kilometerField, power: powerField, color: colorField, guarantee: guarenteField, seriousDamageRegistered: seriousDamageField)
        
        
        delegate?.createAdvertAutoProductSuccess(carProduct, with: images)
        
    }
    
}
