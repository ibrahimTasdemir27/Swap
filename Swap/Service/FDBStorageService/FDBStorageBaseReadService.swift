//
//  FDBStorageBaseReadService.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 29.08.2024.
//

import Foundation
import FirebaseStorage


enum FDBStorageReadService: FDBStorageReadType, FDBStorageNetworkReadService {
    case getImageUrl(userId: String, sizeOf: ImageSize)
}

extension FDBStorageReadService {
    
    var storage: FirebaseStorage.StorageReference {
        return Storage.storage().reference()
    }
    
    var baseURL: String {
        switch self {
        case .getImageUrl:
            return "profileImages"
        }
    }
    
    var path: String {
        switch self {
        case .getImageUrl(let userId, let imageSize):
            "/\(userId)/\(imageSize.fileName)"
        }
    }
}

