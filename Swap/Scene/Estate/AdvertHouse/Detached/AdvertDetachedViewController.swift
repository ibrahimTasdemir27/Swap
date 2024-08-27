//
//  AdvertDetachedViewController.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 25.07.2024.
//

import UIKit


final class AdvertDetachedViewController: UIViewController {
    
    var viewModel: AdvertDetachedViewModel!
    
    
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

extension AdvertDetachedViewController:
    AdvertDetachedViewModel.Delegate {
    
}



// MARK: - Creator -
extension AdvertDetachedViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "AdvertDetachedViewController"
        }
    }
    
    class func create() -> AdvertDetachedViewController {
        let vc: AdvertDetachedViewController = AdvertDetachedViewController.instantiateFromNib()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        let viewModel: AdvertDetachedViewModel = AdvertDetachedViewModel()
        vc.viewModel = viewModel
        viewModel.delegate = vc
        return vc
    }
}

