//
//  HomeViewController.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 19.07.2024.
//

import UIKit


final class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel!

  
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

extension HomeViewController: HomeViewModelDelegate {
    
}



// MARK: - Creator -
extension HomeViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "HomeViewController"
        }
    }
    
    class func create() -> HomeViewController {
        let vc: HomeViewController = HomeViewController.instantiateFromNib()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        let viewModel: HomeViewModel = HomeViewModel()
        vc.viewModel = viewModel
        viewModel.delegate = vc
        return vc
    }
}

