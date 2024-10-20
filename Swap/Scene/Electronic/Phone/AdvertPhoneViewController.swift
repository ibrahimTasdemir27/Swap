//
//  AdvertPhoneViewController.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 28.08.2024.
//

import UIKit

final class AdvertPhoneViewController: BaseViewController, FormFieldRequirementsUnwrapper, AlertPresentable {
    
    var viewModel: AdvertPhoneViewModel!
    override func provideViewModel() -> BaseViewModel? {
        return viewModel
    }
    
    //MARK: -> UI Components
    @IBOutlet weak var advertHeading: ONFormField!
    @IBOutlet weak var advertDescription: ONFormField!
    @IBOutlet weak var operatingSystem: OFFormField!
    @IBOutlet weak var memory: OFFormField!
    @IBOutlet weak var ram: OFFormField!
    @IBOutlet weak var screenSize: OFFormField!
    @IBOutlet weak var camera: OFFormField!
    @IBOutlet weak var frontCamera: OFFormField!
    @IBOutlet weak var color: OFFormField!
    @IBOutlet weak var state: OFFormField!
    @IBOutlet weak var guarantee: OFFormField!
    
    lazy var allFields: [BaseFormRequirements] = [
        advertHeading, advertDescription, operatingSystem, ram, screenSize, camera, frontCamera, color, state, guarantee
    ]

    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareViews()
    }
    
    private func prepareViews() {
        operatingSystem.formTypeEnum = .operationsystem
        operatingSystem.changedFormElement = { [weak self] value in
            if let value = value as? ElectronicProductEnvironment.PhoneEnvironment.OperatingSystem {
                self?.viewModel.operatingSystem = value
            }
        }
        memory.formTypeEnum = .phonememory
        memory.changedFormElement = { [weak self] value in
            if let value = value as? ElectronicProductEnvironment.PhoneEnvironment.Memory {
                self?.viewModel.memory = value
            }
        }
        ram.formTypeEnum = .phoneram
        ram.changedFormElement = { [weak self] value in
            if let value = value as? ElectronicProductEnvironment.PhoneEnvironment.RAM {
                self?.viewModel.ram = value
            }
        }
        screenSize.formTypeEnum = .phonescreensize
        screenSize.changedFormElement = { [weak self] value in
            if let value = value as? ElectronicProductEnvironment.PhoneEnvironment.ScreenSize {
                self?.viewModel.screenSize = value
            }
        }
        camera.formTypeEnum = .phonecamera
        camera.changedFormElement = { [weak self] value in
            if let value = value as? ElectronicProductEnvironment.PhoneEnvironment.MegaPixel {
                self?.viewModel.camera = value
            }
        }
        frontCamera.formTypeEnum = .phonefrontcamera
        frontCamera.changedFormElement = { [weak self] value in
            if let value = value as? ElectronicProductEnvironment.PhoneEnvironment.FrontMegaPixel {
                self?.viewModel.frontCamera = value
            }
        }
        color.formTypeEnum = .phonecolor
        color.changedFormElement = { [weak self] value in
            if let value = value as? ElectronicProductEnvironment.PhoneEnvironment.Color {
                self?.viewModel.color = value
            }
        }
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

extension AdvertPhoneViewController: AdvertPhoneViewModel.Delegate {
    
    
    
}

extension AdvertPhoneViewController: AllAdvertRequirementsController {
    var presentable: (any AdvertPresentable)? {
        return viewModel
    }
    
    
}

// MARK: - Creator -
extension AdvertPhoneViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "AdvertPhoneViewController"
        }
    }
    
    class func create(categorys: [String]) -> AdvertPhoneViewController {
        let vc: AdvertPhoneViewController = AdvertPhoneViewController.instantiateFromNib()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        let viewModel: AdvertPhoneViewModel = AdvertPhoneViewModel(categorys: categorys)
        vc.viewModel = viewModel
        viewModel.delegate = vc
        return vc
    }
}

