//
//  AdvertTableViewCell.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import UIKit

final class AdvertTableViewCell: UITableViewCell {
    
    protocol Delegate: AnyObject {
        func didSelectCategoryElement(key: String, for indexPath: IndexPath)
    }

    @IBOutlet weak var contentTitle: UILabel!
    
    var delegate: Delegate? = nil
    private var title: String? = nil
    private var indexPath: IndexPath? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tappedSelectCategoryButton(_ sender: Any) {
        if let key = title, let indexPath = indexPath {
            delegate?.didSelectCategoryElement(key: key, for: indexPath)
        }
    }
    
    func bind(description: String, for indexPath: IndexPath) {
        self.title = description
        self.indexPath = indexPath
        contentTitle.text = description
    }
    
}


/*
 Seçili olan kategoriye göre işlem yapılsın
 Diyelim kullanıcı girdi ve
 Vasıta'yı seçti
 
 Ardından AdvertViewController'i Vasıta olarak açalım
 Ardından Vasıta içerisinden diyelim Otomobil'i seçti
 Ardından AdvertViewController'i Vasıta/Otomobil olarak açalım
 
 Peki burdan verileri nasıl getiricez ?
 Kaçıncı adımda nerede ne açılacak nasıl ayarlıycaz ?
 Bana bir dictionary lazım
 
 
 */
