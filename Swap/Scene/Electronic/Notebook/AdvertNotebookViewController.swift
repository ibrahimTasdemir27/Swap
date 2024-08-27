//
//  AdvertNotebookViewController.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 31.07.2024.
//

import UIKit

final class AdvertNotebookViewController: AdvertViewControllerType, FormFieldRequirementsUnwrapper, AlertPresentable {
    
    var viewModel: AdvertNotebookViewModel!
    override func provideViewModel() -> BaseViewModel? {
        return viewModel
    }
    
    
    //MARK: -> UI Components
    @IBOutlet weak var advertHeading: ONFormField!
    @IBOutlet weak var advertDescription: ONFormField!
    @IBOutlet weak var processor: ONFormField!
    
    @IBOutlet weak var ram: OFFormField!
    @IBOutlet weak var hdd: OFFormField!
    @IBOutlet weak var ssd: OFFormField!
    @IBOutlet weak var displayCard: OFFormField!
    @IBOutlet weak var screenSize: OFFormField!
    @IBOutlet weak var resolution: OFFormField!
    @IBOutlet weak var guarantee: OFFormField!
    @IBOutlet weak var state: OFFormField!
    

    lazy var allFields: [BaseFormRequirements] = [
        advertHeading, advertDescription, processor, ram, hdd, ssd, displayCard, screenSize, resolution,
        guarantee, state
    ]
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareViews()
    }
    
    private func prepareViews() {
        ram.formTypeEnum = .ram
        ram.changedFormElement = { [weak self] value in
            if let value = value as? ElectronicProductEnvironment.ComputerEnvironment.RAM {
                self?.viewModel.ram = value
            }
        }
        hdd.formTypeEnum = .hdd
        hdd.changedFormElement = { [weak self] value in
            if let value = value as? ElectronicProductEnvironment.ComputerEnvironment.HDD {
                self?.viewModel.hdd = value
            }
        }
        ssd.formTypeEnum = .ssd
        ssd.changedFormElement = { [weak self] value in
            if let value = value as? ElectronicProductEnvironment.ComputerEnvironment.SSD {
                self?.viewModel.ssd = value
            }
        }
        displayCard.formTypeEnum = .displaycard
        displayCard.changedFormElement = { [weak self] value in
            if let value = value as? ElectronicProductEnvironment.ComputerEnvironment.DisplayCard {
                self?.viewModel.displayCard = value
            }
        }
        screenSize.formTypeEnum = .screensize
        screenSize.changedFormElement = { [weak self] value in
            if let value = value as? ElectronicProductEnvironment.ComputerEnvironment.ScreenSize {
                self?.viewModel.screenSize = value
            }
        }
        resolution.formTypeEnum = .resolution
        resolution.changedFormElement = { [weak self] value in
            if let value = value as? ElectronicProductEnvironment.NotebookEnvironment.Resolution {
                self?.viewModel.resolution = value
            }
        }
        guarantee.formTypeEnum = .yesno(raw: "guarantee")
        guarantee.changedFormElement = { [weak self] value in
            if let value = value as? Bool {
                self?.viewModel.guarantee = value
            }
        }
        state.formTypeEnum = .productstate
        state.changedFormElement = { [weak self] value in
            if let value = value as? ProductStatus {
                self?.viewModel.state = value
            }
        }
        
        
        
        
        
        
        
        
        
    }
    
    // MARK: - IBActions
    @IBAction private func tappedBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func tappedContinueButton(_ sender: Any) {
        guard wrappedValue() else {
            return
        }
        
        viewModel.advertHeading = advertHeading.safeText()
        viewModel.advertDescription = advertDescription.safeText()
        viewModel.processor = processor.safeText()
        
        viewModel.setupBasicInfo()
    }
    
}


// MARK: - ViewModel Delegate -
extension AdvertNotebookViewController: AdvertNotebookViewModel.Delegate {
    
    
}


// MARK: - ViewModel Delegate -
extension AdvertNotebookViewController: AllAdvertRequirementsController {
    var presentable: (any AdvertPresentable)? {
        return viewModel
    }
}




// MARK: - Creator -
extension AdvertNotebookViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "AdvertNotebookViewController"
        }
    }
    
    class func create(categorys: [String]) -> AdvertNotebookViewController {
        let vc: AdvertNotebookViewController = AdvertNotebookViewController.instantiateFromNib()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        let viewModel: AdvertNotebookViewModel = AdvertNotebookViewModel(categorys: categorys)
        vc.viewModel = viewModel
        viewModel.delegate = vc
        return vc
    }
}

