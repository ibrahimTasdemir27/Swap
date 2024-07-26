//
//  ViewController.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 19.07.2024.
//

import UIKit

extension UIViewController {
    typealias XibVC = UIViewController & XibNameProvider
    
    static func instantiateFromNib<T: XibVC>() -> T {
        return T.init(nibName: T.xibName, bundle: Bundle(for: T.self))
    }
}
