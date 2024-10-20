//
//  Phone.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 28.08.2024.
//

import Foundation

final class PhoneProduct: Product {
    let brand: ElectronicProductEnvironment.PhoneEnvironment.Brand
    let model: String
    let operatingSystem: ElectronicProductEnvironment.PhoneEnvironment.OperatingSystem
    let memory: ElectronicProductEnvironment.PhoneEnvironment.Memory
    let screenSize: ElectronicProductEnvironment.PhoneEnvironment.ScreenSize
    let ram: ElectronicProductEnvironment.PhoneEnvironment.RAM
    let camera: ElectronicProductEnvironment.PhoneEnvironment.MegaPixel
    let frontCamera: ElectronicProductEnvironment.PhoneEnvironment.FrontMegaPixel
    let color: ElectronicProductEnvironment.PhoneEnvironment.Color
    let guarantee: Bool
    let state: ProductStatus
    
    
    init(brand: ElectronicProductEnvironment.PhoneEnvironment.Brand, model: String,
         product: Product, operatingSystem: ElectronicProductEnvironment.PhoneEnvironment.OperatingSystem,
         memory: ElectronicProductEnvironment.PhoneEnvironment.Memory,
         screenSize: ElectronicProductEnvironment.PhoneEnvironment.ScreenSize,
         ram: ElectronicProductEnvironment.PhoneEnvironment.RAM,
         camera: ElectronicProductEnvironment.PhoneEnvironment.MegaPixel,
         frontCamera: ElectronicProductEnvironment.PhoneEnvironment.FrontMegaPixel,
         color: ElectronicProductEnvironment.PhoneEnvironment.Color, guarantee: Bool, state: ProductStatus) {
        self.brand = brand
        self.model = model
        self.operatingSystem = operatingSystem
        self.memory = memory
        self.screenSize = screenSize
        self.ram = ram
        self.camera = camera
        self.frontCamera = frontCamera
        self.color = color
        self.guarantee = guarantee
        self.state = state
        super.init(product: product)
    }
    
    required init(from decoder: any Decoder) throws {
        enum CodingKeys: CodingKey {
            case brand, model, operatingSystem, memory, screenSize, ram, camera, frontCamera, color, guarantee, state
        }
        let container = try decoder.container(keyedBy: CodingKeys.self)
        brand = try container.decode(ElectronicProductEnvironment.PhoneEnvironment.Brand.self, forKey: .brand)
        model = try container.decode(String.self, forKey: .model)
        operatingSystem = try container.decode(ElectronicProductEnvironment.PhoneEnvironment.OperatingSystem.self, forKey: .operatingSystem)
        memory = try container.decode(ElectronicProductEnvironment.PhoneEnvironment.Memory.self, forKey: .memory)
        screenSize = try container.decode(ElectronicProductEnvironment.PhoneEnvironment.ScreenSize.self, forKey: .screenSize)
        ram = try container.decode(ElectronicProductEnvironment.PhoneEnvironment.RAM.self, forKey: .ram)
        camera = try container.decode(ElectronicProductEnvironment.PhoneEnvironment.MegaPixel.self, forKey: .camera)
        frontCamera = try container.decode(ElectronicProductEnvironment.PhoneEnvironment.FrontMegaPixel.self, forKey: .frontCamera)
        color = try container.decode(ElectronicProductEnvironment.PhoneEnvironment.Color.self, forKey: .color)
        guarantee = try container.decode(Bool.self, forKey: .guarantee)
        state = try container.decode(ProductStatus.self, forKey: .state)
        try super.init(from: decoder)
    }
}
