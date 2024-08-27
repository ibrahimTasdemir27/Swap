//
//  Date.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 22.07.2024.
//

import Foundation

extension Date {
    static func getDateFormatter(_ format: String = "yyyy-MM-dd HH:mm:ss") -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter
    }
    
    static func convertTimestamp(serverTimestamp: Double) -> Date {
        let x = serverTimestamp / 1000
        let date = NSDate(timeIntervalSince1970: x)
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        
        return date as Date
    }
    
    static func getTimeStamp(_ date: Date = Date()) -> Int {
        return Int(date.timeIntervalSince1970 * 1000)
        
    }
    
    func toStringSmall(format: String = "yyyy.MM.dd") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func toString(format: String = "yyyy.MM.dd HH:mm", isLocalized: Bool = false) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        if isLocalized {
            formatter.locale = Locale(identifier: "tr")
        }
        return formatter.string(from: self)
    }
}
