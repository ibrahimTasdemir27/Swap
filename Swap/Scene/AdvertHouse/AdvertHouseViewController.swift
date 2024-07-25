//
//  AdvertHouseViewController.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 24.07.2024.
//

import UIKit


final class AdvertHouseViewController: UIViewController {
    
    var viewModel: AdvertHouseViewModel!
    
    //MARK: -> UI Components
    @IBOutlet weak var advertHeadingField: ONFormField!
    @IBOutlet weak var advertDescriptionField: ONFormField!
    
    
    
    
    @IBOutlet weak var sqftGrand: OFFormField!
    @IBOutlet weak var sqftReal: ONFormField!
    @IBOutlet weak var room: OFFormField!
    @IBOutlet weak var age: ONFormField!
    @IBOutlet weak var floor: ONFormField!
    
    
    
    
    
    
    
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareViews()
    }
    
    private func prepareViews() {
        
    }
    
    // MARK: - IBActions
    
}



// MARK: - ViewModel Delegate -

extension AdvertHouseViewController:
    AdvertHouseViewModel.Delegate {
    
}



// MARK: - Creator -
extension AdvertHouseViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "AdvertHouseViewController"
        }
    }
    
    class func create() -> AdvertHouseViewController {
        let vc: AdvertHouseViewController = AdvertHouseViewController.instantiateFromNib()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        let viewModel: AdvertHouseViewModel = AdvertHouseViewModel()
        vc.viewModel = viewModel
        viewModel.delegate = vc
        return vc
    }
}

