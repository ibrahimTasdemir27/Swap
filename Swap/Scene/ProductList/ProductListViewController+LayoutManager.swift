//
//  ProductListViewController+LayoutManager.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 29.08.2024.
//

import UIKit

extension ProductListViewController {
    struct LayoutManager {
        func makeLayout() -> UICollectionViewCompositionalLayout {
            let configuration = UICollectionViewCompositionalLayoutConfiguration()
            
            return UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnv in
                let section = NSCollectionLayoutSection.fillWidth(heightDimension: .absolute(100))
                section.interGroupSpacing = 4
                
                return section
            }, configuration: configuration)
            
        }
    }
}
