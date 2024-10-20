//
//  ExchangeViewController.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 29.08.2024.
//

import UIKit


final class ExchangeViewController: UIViewController {
    
    var viewModel: ExchangeViewModel!
    
    
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

extension ExchangeViewController:
    ExchangeViewModel.Delegate {
    
}



// MARK: - Creator -
extension ExchangeViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "ExchangeViewController"
        }
    }
    
    class func create() -> ExchangeViewController {
        let vc: ExchangeViewController = ExchangeViewController.instantiateFromNib()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        let viewModel: ExchangeViewModel = ExchangeViewModel()
        vc.viewModel = viewModel
        viewModel.delegate = vc
        return vc
    }
}

