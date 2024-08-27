//
//  AdvertAppertmentViewController.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 25.07.2024.
//

import UIKit

final class AdvertAppertmentViewController: AdvertViewControllerType, AlertPresentable, FormFieldAllRequirementsUnwrapper {
    
    var viewModel: AdvertAppertmentViewModel!
    override func provideViewModel() -> BaseViewModel? {
        return viewModel
    }
    
    //MARK: -> UI Components
    @IBOutlet weak var advertHeadingField: ONFormField!
    @IBOutlet weak var advertDescriptionField: ONFormField!
    @IBOutlet weak var sqftGrand: ONFormField!
    @IBOutlet weak var sqftReal: ONFormField!
    @IBOutlet weak var age: ONFormField!
    @IBOutlet weak var floorLocation: ONFormField!
    @IBOutlet weak var floor: ONFormField!
    @IBOutlet weak var bath: ONFormField!
    @IBOutlet weak var siteName: ONFormField!
    @IBOutlet weak var subscription: ONFormField!
    
    @IBOutlet weak var room: OFFormField!
    @IBOutlet weak var heating: OFFormField!
    @IBOutlet weak var balcony: OFFormField!
    @IBOutlet weak var lift: OFFormField!
    @IBOutlet weak var autopark: OFFormField!
    @IBOutlet weak var furniture: OFFormField!
    @IBOutlet weak var state: OFFormField!
    @IBOutlet weak var site: OFFormField!
    @IBOutlet weak var landRegister: OFFormField!
    
    lazy var allFields: [BaseFormRequirements] = [
        advertHeadingField, advertDescriptionField, sqftGrand, sqftReal, age, floorLocation, floor, bath, subscription, room, heating, balcony, lift, autopark, furniture, state, site, landRegister
    ]
    
    lazy var numericFields: [BaseFormRequirements] = [
        sqftGrand, sqftReal, age, floorLocation, floor, bath
    ]
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareViews()
    }
    
    private func prepareViews() {
        room.formTypeEnum =  .room
        room.changedFormElement = { [weak self] value in
            if let value = value as? Room {
                self?.viewModel.room = value
            }
        }
        heating.formTypeEnum = .heating
        heating.changedFormElement = { [weak self] value in
            if let value = value as? HeatingType {
                self?.viewModel.heating = value
            }
        }
        balcony.formTypeEnum = .yesno(raw: "balcony")
        balcony.changedFormElement = { [weak self] value in
            if let value = value as? Bool {
                self?.viewModel.balcony = value
            }
        }
        lift.formTypeEnum = .yesno(raw: "lift")
        lift.changedFormElement = { [weak self] value in
            if let value = value as? Bool {
                self?.viewModel.lift = value
            }
        }
        autopark.formTypeEnum = .autopark
        autopark.changedFormElement = { [weak self] value in
            if let value = value as? AutoPark {
                self?.viewModel.autopark = value
            }
        }
        furniture.formTypeEnum = .yesno(raw: "furniture")
        furniture.changedFormElement = { [weak self] value in
            if let value = value as? Bool {
                self?.viewModel.furniture = value
            }
        }
        state.formTypeEnum = .estatestate
        state.changedFormElement = { [weak self] value in
            if let value = value as? EstateState {
                self?.viewModel.state = value
            }
        }
        site.formTypeEnum = .yesno(raw: "site")
        site.changedFormElement = { [weak self] value in
            if let value = value as? Bool {
                self?.viewModel.site = value
            }
        }
        landRegister.formTypeEnum = .houselandregister
        landRegister.changedFormElement = { [weak self] value in
            if let value = value as? EstateLandRegisterStatus {
                self?.viewModel.landRegister = value
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func tappedBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func tappedContinueButton(_ sender: Any) {
        guard wrappedValue(), wrappedNumericValue() else {
            return
        }
        
        
        viewModel.advertHeading = advertHeadingField.text
        viewModel.advertDescription = advertDescriptionField.text
        viewModel.siteName = siteName.text
        viewModel.sqftGrand = Int(sqftGrand.safeText() ?? "")
        viewModel.sqftReal = Int(sqftReal.safeText() ?? "")
        viewModel.age = Int(age.safeText() ?? "")
        viewModel.floorLocation = Int(floorLocation.safeText() ?? "")
        viewModel.subscription = Int(subscription.safeText() ?? "")
        viewModel.floor = Int(floor.safeText() ?? "")
        viewModel.bath = Int(bath.safeText() ?? "")
        
        viewModel.setupBasicInfo()
    }
    
}



// MARK: - ViewModel Delegate -

extension AdvertAppertmentViewController: AdvertAppertmentViewModel.Delegate {
    
}


//MARK: -> AllAdvertRequirements
extension AdvertAppertmentViewController: AllAdvertRequirementsController {
    var presentable: (any AdvertPresentable)? {
        return viewModel
    }
}



// MARK: - Creator -
extension AdvertAppertmentViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "AdvertAppertmentViewController"
        }
    }
    
    class func create(categorys: [String]) -> AdvertAppertmentViewController {
        let vc: AdvertAppertmentViewController = AdvertAppertmentViewController.instantiateFromNib()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        let viewModel: AdvertAppertmentViewModel = AdvertAppertmentViewModel(categorys: categorys)
        vc.viewModel = viewModel
        viewModel.delegate = vc
        return vc
    }
}

