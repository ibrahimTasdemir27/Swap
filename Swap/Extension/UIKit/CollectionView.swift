//
//  CollectionView.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 29.08.2024.
//

import UIKit

extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(cellClass: T.Type) {
        if Bundle.main.path(forResource: String(describing: cellClass.self), ofType: "nib") == nil {
            register(cellClass.self, forCellWithReuseIdentifier: String(describing: cellClass.self))
        } else {
            register(UINib(nibName: String(describing: cellClass.self), bundle: nil), forCellWithReuseIdentifier: String(describing: cellClass.self))
        }
    }
    
    func registerSupplementaryView<T: UICollectionReusableView>(viewClass: T.Type, kind: String) {
        if Bundle.main.path(forResource: String(describing: viewClass.self), ofType: "nib") == nil {
            register(viewClass.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: viewClass.self))
        } else {
            register(UINib(nibName: String(describing: viewClass.self), bundle: nil), forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: viewClass.self))
        }
    }
    
    func dequeueCell<T: UICollectionViewCell>(cellClass: T.Type, for indexPath: IndexPath) -> T {
        dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
    
    func dequeueSupplementaryView<T: UICollectionReusableView>(viewClass: T.Type, kind: String, for indexPath: IndexPath) -> T {
        dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}
