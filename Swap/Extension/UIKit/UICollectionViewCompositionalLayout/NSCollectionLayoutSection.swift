//
//  NSCollectionLayoutSection.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 29.08.2024.
//

import UIKit

extension NSCollectionLayoutSection {
    static func fillWidth(heightDimension: NSCollectionLayoutDimension) -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: heightDimension)
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [item])
        return NSCollectionLayoutSection(group: group)
    }
    
    static func custom(widthDimension: NSCollectionLayoutDimension, heightDimension: NSCollectionLayoutDimension) -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(widthDimension: widthDimension, heightDimension: heightDimension)
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [item])
        return NSCollectionLayoutSection(group: group)
    }
}
