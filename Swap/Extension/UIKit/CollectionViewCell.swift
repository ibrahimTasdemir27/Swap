//
//  CollectionViewCell.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 22.07.2024.
//

import UIKit

extension UICollectionViewCell {
    class func registerSelf(collectionView: UICollectionView) {
        let nib = UINib(nibName: self.className, bundle: Bundle(for: self))
        collectionView.register(nib, forCellWithReuseIdentifier: self.className)
    }
}

