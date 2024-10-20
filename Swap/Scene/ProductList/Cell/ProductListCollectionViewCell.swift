//
//  ProductListCollectionViewCell.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 29.08.2024.
//

import UIKit

final class ProductListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var title: BaseLabel!
    @IBOutlet weak var descrip: BaseLabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(_ product: Product) {
        photo.setImageWithKF(urlString: product.primaryImage)
        title.text = product.heading
        descrip.text = product.description
    }

}
