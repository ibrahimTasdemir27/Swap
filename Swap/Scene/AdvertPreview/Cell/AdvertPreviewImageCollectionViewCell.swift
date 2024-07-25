//
//  AdvertPreviewImageCollectionViewCell.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 22.07.2024.
//

import UIKit

final class AdvertPreviewImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(image: UIImage) {
        productImage.image = image
    }

}
