//
//  NotebookProduct.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 31.07.2024.
//

import Foundation

class NotebookProduct: ElectronicProductEnvironment.BaseComputer {
    let resolution: ElectronicProductEnvironment.NotebookEnvironment.Resolution
    
    init(computer: ElectronicProductEnvironment.BaseComputer,
         resolution: ElectronicProductEnvironment.NotebookEnvironment.Resolution) {
        self.resolution = resolution
        super.init(computer: computer)
    }
    
    private enum CodingKeys: CodingKey {
        case resolution
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        resolution = try container.decode(ElectronicProductEnvironment.NotebookEnvironment.Resolution.self, forKey: .resolution)
        try super.init(from: decoder)
    }
}
