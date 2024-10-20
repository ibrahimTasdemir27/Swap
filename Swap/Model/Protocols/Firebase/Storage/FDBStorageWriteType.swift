//
//  FDBStorageWriteType.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 29.08.2024.
//

import Foundation
import FirebaseStorage

protocol FDBStorageWriteType: FDBTargetType {
    var storage: StorageReference { get }
    var updatingData: [String: Data?] { get }
}



protocol FDBNetworkStorageWriteService where Self: FDBStorageWriteType {
    
}


extension FDBNetworkStorageWriteService {
    
    func execute() async throws -> [String] {
        guard checkForConnection() else {
            throw BaseError.networkError
        }
        
        
        var urlList: [String] = []
        
        for item in updatingData {
            guard let data = item.value else { continue }
            let ref = storage.child(item.key + ".jpeg")
            _ = try await ref.putDataAsync(data)
            let url = try await ref.downloadURL().absoluteString
            urlList.append(url)
        }
        
        return urlList
    }
    
    func remove() async throws {
        guard checkForConnection() else {
            throw BaseError.networkError
        }
        
        for item in updatingData {
            let ref = Storage.storage().reference(withPath: item.key)
            let childList = try await ref.listAll()
            
            for prefix in childList.prefixes {
                
                let list = try await prefix.listAll()
                for child in list.items {
                    try await child.delete()
                }
            }
            
            for child in childList.items {
                try await child.delete()
            }
        }
    }
    
    
}

