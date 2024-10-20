//
//  ImageView.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 29.08.2024.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    private func setImageWithKF(url: URL, withCompletion completion: ((Bool) -> Void)? = nil) {
        let imageView = self
        
        imageView.contentMode = .scaleAspectFill
        imageView.kf.indicatorType = .activity
        imageView.kf.indicator?.view.alpha = 0.2
        let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
        imageView.kf.setImage(with: url,
                              placeholder: .none,
                              options: [.processor(processor), .scaleFactor(UIScreen.main.scale),
                                        .transition(.fade(0.7)), .cacheOriginalImage]) { isSuccess in
                                            switch isSuccess {
                                            case .success(_): completion?(true)
                                            case .failure(_): completion?(false)
                                            }
                                        }
    }
    
    func setImageWithKF(urlString: String?, withCompletion completion: (() -> ())? = nil) {
        if let urlString = urlString, let url = URL(string: urlString) {
            setImageWithKF(url: url)
        }
    }
    
    
    func downloadStorageURL(userId: String?, sizeOf: ImageSize,
                            withCompletion completion: (() -> Void)? = nil) {
        guard let userId = userId else { return }
        
        backgroundColor = .systemGray5
        isHidden = false
        Task.init(priority: .high) {
            do {
                let url = try await FDBStorageReadService.getImageUrl(userId: userId, sizeOf: sizeOf).downloadURL()
                self.setImageWithKF(url: url) { [weak self] isSuccess in
                    self?.isHidden = false
                    completion?()
                    if !isSuccess { self?.image = UIImage(resource: .Icons.profile) }
                }
            } catch {
                image = UIImage(resource: .Icons.profile)
            }
            
            backgroundColor = .clear
        }
    }
}
