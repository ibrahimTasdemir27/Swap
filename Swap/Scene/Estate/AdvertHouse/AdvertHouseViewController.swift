//
//  AdvertHouseViewController.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 24.07.2024.
//

import UIKit


final class AdvertHouseViewController: AdvertViewControllerType, AlertPresentable, FormFieldAllRequirementsUnwrapper {
    
    var viewModel: AdvertHouseViewModel!
    override func provideViewModel() -> BaseViewModel? {
        return viewModel
    }

    
    //MARK: -> UI Components
    @IBOutlet weak var advertHeadingField: ONFormField!
    @IBOutlet weak var advertDescriptionField: ONFormField!
    @IBOutlet weak var sqftGrand: ONFormField!
    @IBOutlet weak var sqftReal: ONFormField!
    @IBOutlet weak var age: ONFormField!
    @IBOutlet weak var floor: ONFormField!
    @IBOutlet weak var bath: ONFormField!
    
    @IBOutlet weak var room: OFFormField!
    @IBOutlet weak var heating: OFFormField!
    @IBOutlet weak var balcony: OFFormField!
    @IBOutlet weak var lift: OFFormField!
    @IBOutlet weak var furniture: OFFormField!
    @IBOutlet weak var state: OFFormField!
    @IBOutlet weak var landRegister: OFFormField!
    
    lazy var allFields: [BaseFormRequirements] = [
        advertHeadingField, advertDescriptionField, sqftGrand, sqftReal, age, floor, bath, room, heating, balcony, lift,
        furniture, state, landRegister
    ]
    
    lazy var numericFields: [BaseFormRequirements] = [
        sqftGrand, sqftReal, age, floor, bath
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
        viewModel.sqftGrand = Int(sqftGrand.safeText() ?? "")
        viewModel.sqftReal = Int(sqftReal.safeText() ?? "")
        viewModel.age = Int(age.safeText() ?? "")
        viewModel.floor = Int(floor.safeText() ?? "")
        viewModel.bath = Int(bath.safeText() ?? "")
        
        viewModel.setupBasicInfo()
    }
    
}




// MARK: - ViewModel Delegate -
extension AdvertHouseViewController: AdvertHouseViewModel.Delegate {
    
}



// MARK: - AllAdvertRequirements
extension AdvertHouseViewController: AllAdvertRequirementsController {
    var presentable: (any AdvertPresentable)? {
        return viewModel
    }
}





// MARK: - Creator -
extension AdvertHouseViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "AdvertHouseViewController"
        }
    }
    
    class func create(categorys: [String], type: HouseType) -> AdvertHouseViewController {
        let vc: AdvertHouseViewController = AdvertHouseViewController.instantiateFromNib()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        let viewModel: AdvertHouseViewModel = AdvertHouseViewModel(categorys: categorys, type: type)
        vc.viewModel = viewModel
        viewModel.delegate = vc
        return vc
    }
}
