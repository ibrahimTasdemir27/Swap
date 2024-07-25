//
//  PreviewLayer.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 22.07.2024.
//

import Foundation

protocol PreviewLayer {
    associatedtype PreviewElement
    init(preview: PreviewElement)
}
