//
//  FDBStorageReadType.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 29.08.2024.
//

import Foundation
import FirebaseStorage

protocol FDBStorageReadType: ConnectivityMiddleware {
    var storage: StorageReference { get }
    var baseURL: String { get }
    var path: String { get }
}

protocol FDBStorageNetworkReadService {
    
}

extension FDBStorageNetworkReadService where Self: FDBStorageReadType {
    
    func downloadURL() async throws -> URL {
        guard checkForConnection() else {
            throw BaseError.networkError
        }
        
        let url = try await storage.child(baseURL + path).downloadURL()
        return url
    }
}
