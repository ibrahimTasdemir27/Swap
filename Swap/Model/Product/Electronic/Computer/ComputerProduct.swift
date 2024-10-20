//
//  ComputerProduct.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 31.07.2024.
//

import Foundation




class DesktopProduct: ElectronicProductEnvironment.BaseComputer {
    let caseType: ElectronicProductEnvironment.DesktopEnvironment.CaseType
    
    
    init(computer: ElectronicProductEnvironment.BaseComputer,
         caseType: ElectronicProductEnvironment.DesktopEnvironment.CaseType) {
        self.caseType = caseType
        super.init(computer: computer)
    }
    
    private enum CodingKeys: CodingKey {
        case caseType
    }
    
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        caseType = try container.decode(ElectronicProductEnvironment.DesktopEnvironment.CaseType.self, forKey: .caseType)
        try super.init(from: decoder)
    }
}



