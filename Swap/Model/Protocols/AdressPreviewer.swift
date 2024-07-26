//
//  AdressPreviewer.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 26.07.2024.
//

import UIKit

protocol AdressPreviewer {
    
}

extension AdressPreviewer where Self: UIViewController & AdressViewController.Delegate {
    func previewAdress() {
        let vc = AdressViewController.create()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
