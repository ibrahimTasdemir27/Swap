//
//  TableViewCell.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import UIKit

extension UITableViewCell {
    class func registerSelf(tableView: UITableView) {
        let nib = UINib(nibName: self.className, bundle: Bundle(for: self))
        tableView.register(nib, forCellReuseIdentifier: self.className)
    }
    
    
}
