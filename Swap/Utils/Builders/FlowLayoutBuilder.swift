//
//  FlowLayoutBuilder.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 29.08.2024.
//

import UIKit

final class RTLSupportedFlowLayout: UICollectionViewFlowLayout {
    override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        true
    }
}


final class FlowLayoutBuilder {
    private var layout = RTLSupportedFlowLayout()
    
    func setSectionInset(_ inset: UIEdgeInsets) -> Self {
        layout.sectionInset = inset
        return self
    }
    
    func setInterItemSpacing(_ spacing: CGFloat) -> Self {
        layout.minimumInteritemSpacing = spacing
        return self
    }
    
    func setLineSpacing(_ spacing: CGFloat) -> Self {
        layout.minimumLineSpacing = spacing
        return self
    }
    
    func setItemSize(_ size: CGSize) -> Self {
        layout.itemSize = size
        return self
    }
    
    func setFooterReferenceSize(_ size: CGSize) -> Self {
        layout.footerReferenceSize = size
        return self
    }
    
    func setHeaderReferenceSize(_ size: CGSize) -> Self {
        layout.headerReferenceSize = size
        return self
    }
    
    func setScrollDirection(_ direction: UICollectionView.ScrollDirection) -> Self {
        layout.scrollDirection = direction
        return self
    }
    
    func build() -> UICollectionViewFlowLayout {
        layout
    }
}

extension FlowLayoutBuilder {

}
