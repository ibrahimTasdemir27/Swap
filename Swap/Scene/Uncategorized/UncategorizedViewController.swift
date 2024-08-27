//
//  UncategorizedViewController.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 1.08.2024.
//

import UIKit


final class UncategorizedViewController: BaseViewController, FormFieldRequirementsUnwrapper, AlertPresentable {
    
    var viewModel: UncategorizedViewModel!
    override func provideViewModel() -> BaseViewModel? {
        return viewModel
    }
    
    //MARK: -> UI Components
    @IBOutlet weak var advertHeading: ONFormField!
    @IBOutlet weak var advertDescription: ONFormField!
    
    @IBOutlet weak var state: OFFormField!
    @IBOutlet weak var guarantee: OFFormField!
    
    lazy var allFields: [BaseFormRequirements] = [advertHeading, advertDescription, state, guarantee]
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareViews()
    }
    
    private func prepareViews() {
        state.formTypeEnum = .productstate
        state.changedFormElement = { [weak self] value in
            if let value = value as? ProductStatus {
                self?.viewModel.state = value
            }
        }
        guarantee.formTypeEnum = .yesno(raw: "guarantee")
        guarantee.changedFormElement = { [weak self] value in
            if let value = value as? Bool {
                self?.viewModel.guarantee = value
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func tappedBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedContinueButton(_ sender: Any) {
        guard wrappedValue() else {
            return
        }
        
        viewModel.advertHeading = advertHeading.safeText()
        viewModel.advertDescription = advertDescription.safeText()
        
        viewModel.setupBasicInfo()
    }
}



// MARK: - ViewModel Delegate -

extension UncategorizedViewController: UncategorizedViewModel.Delegate {

    
}


extension UncategorizedViewController: AllAdvertRequirementsController {
    var presentable: (any AdvertPresentable)? {
        return viewModel
    }
}



// MARK: - Creator -
extension UncategorizedViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "UncategorizedViewController"
        }
    }
    
    class func create(categorys: [String]) -> UncategorizedViewController {
        let vc: UncategorizedViewController = UncategorizedViewController.instantiateFromNib()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        let viewModel: UncategorizedViewModel = UncategorizedViewModel(categorys: categorys)
        vc.viewModel = viewModel
        viewModel.delegate = vc
        return vc
    }
}

