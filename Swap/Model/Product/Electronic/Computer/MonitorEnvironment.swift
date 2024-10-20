//
//  MonitorEnvironment.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 27.08.2024.
//

import Foundation

extension ElectronicProductEnvironment {
    struct MonitorEnvironment {
        enum Monitor: String, Describer, CaseIterable, Codable, CategoryImplementer {
            static func allData() -> [String : Any] {
                return Monitor.allCases.reduce(into: [String: Any]()) { partialResult, monitor in
                    partialResult[monitor.describe()] = Finalizer.monitor
                }
            }
            
            static func provideData() -> [String : Any] {
                return [:]
            }
            
            func getChilds() -> [String : Any] {
                return [:]
            }
            
            
            case ledlcd
            case crt
            case accessories
            case batch
            
            func describe() -> String {
                switch self {
                case .ledlcd:                       return "LED & LCD Monitör"
                case .crt:                          return "CRT Monitör (Tüplü)"
                case .accessories:                  return "Monitör Aksesuarları"
                case .batch:                        return "Toplu Satış"
                }
            }
            
        }
        
        
    }
}
