//
//  GalleryPreviewer.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 26.07.2024.
//

import UIKit

protocol GalleryPreviewer {
    
}

extension GalleryPreviewer where Self: UIViewController & RequestGalleryViewController.Delegate {
    func previewGallery() {
        let vc = RequestGalleryViewController()
        vc.delegate = self
        present(vc, animated: true)
    }
}
