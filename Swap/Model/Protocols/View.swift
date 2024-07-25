//
//  View.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import UIKit


@frozen fileprivate enum AnimationCodingKey: String {
    case transform = "transform.scale"
    case pulse = "pulse"
    case opacity = "opacity"
    case position = "position"
}

protocol Animetable {
    
}

extension Animetable where Self: UIView {
    func shake() {
        let shake = CABasicAnimation(keyPath: AnimationCodingKey.position.rawValue)
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        shake.fromValue = fromValue
        shake.toValue = toValue
        layer.add(shake, forKey: AnimationCodingKey.position.rawValue)
    }
}
