//
//  Uncategorized.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 27.08.2024.
//

import Foundation

final class Uncategorized: Product {
    let state: ProductStatus
    let guarantee: Bool
    
    
    init(product: Product, state: ProductStatus, guarantee: Bool) {
        self.state = state
        self.guarantee = guarantee
        super.init(product: product)
    }
    
    required init(from decoder: any Decoder) throws {
        enum CodingKeys: CodingKey {
            case state, guarantee
        }
        let container = try decoder.container(keyedBy: CodingKeys.self)
        state = try container.decode(ProductStatus.self, forKey: .state)
        guarantee = try container.decode(Bool.self, forKey: .guarantee)
        try super.init(from: decoder)
    }
}
