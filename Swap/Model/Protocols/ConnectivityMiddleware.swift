//
//  ConnectivityMiddleware.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 29.08.2024.
//

import Foundation
import SystemConfiguration

protocol ConnectivityMiddleware {
    func checkForConnection() -> Bool
}

extension ConnectivityMiddleware {
    func checkForConnection() -> Bool {
        let reachability = SCNetworkReachabilityCreateWithName(nil, "www.google.com")
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(reachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        let hasConnection = isReachable && !needsConnection
        
        
        return hasConnection
    }
}
