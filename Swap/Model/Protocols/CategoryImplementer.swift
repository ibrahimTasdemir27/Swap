//
//  CategoryImplementer.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import Foundation

protocol CategoryImplementer: Describer {
    static func allData() -> [String: Any]
    static func provideData() -> [String: Any]
    func getChilds() -> [String: Any]
}
