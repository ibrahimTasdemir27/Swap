//
//  AlertPresentable.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 19.07.2024.
//

import UIKit

protocol AlertPresentable {
    func showAlert(title: String,
                   message: String,
                   style: UIAlertController.Style,
                   actions: [UIAlertAction])
    func showAlert(with message: String, completion: (() -> Void)?)
}


extension AlertPresentable where Self: UIViewController {
    func showAlert(title: String, message: String, style: UIAlertController.Style = .alert, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alert.addAction(action)
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    func showAlert(with message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "",
                                      message: message,
                                      preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Done", style: .default) { act in
            completion?()
        }
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
}
