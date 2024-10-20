//
//  RequestExchangeViewController.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 28.08.2024.
//

import UIKit


final class RequestExchangeViewController: UIViewController {
    
    var viewModel: RequestExchangeViewModel!
    
    
    @IBOutlet weak var descriptionLabel: BaseLabel!
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareViews()
    }
    
    private func prepareViews() {
        
    }
    
    // MARK: - IBActions
    @IBAction func tappedAddHeaderButton(_ sender: UIButton) {
        let vc = AddTextViewController.create(previewText: viewModel.productHeader) { [weak self] text in
            sender.setTitle(text, for: .normal)
            self?.viewModel.productHeader = text
        }
        present(vc, animated: true)
    }
    
    @IBAction func tappedAddDescriptionButton(_ sender: UIButton) {
        let vc = AddTextViewController.create(previewText: viewModel.productDescription) { [weak self] text in
            self?.descriptionLabel.text = text
            self?.viewModel.productDescription = text
        }
        present(vc, animated: true)
    }
    
}



// MARK: - ViewModel Delegate -

extension RequestExchangeViewController:
    RequestExchangeViewModel.Delegate {
    
}



// MARK: - Creator -
extension RequestExchangeViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "RequestExchangeViewController"
        }
    }
    
    class func create() -> RequestExchangeViewController {
        let vc: RequestExchangeViewController = RequestExchangeViewController.instantiateFromNib()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        let viewModel: RequestExchangeViewModel = RequestExchangeViewModel()
        vc.viewModel = viewModel
        viewModel.delegate = vc
        return vc
    }
}

