//
//  AdvertLandViewController.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 26.07.2024.
//

import UIKit


final class AdvertLandViewController: BaseViewController, AlertPresentable, FormFieldAllRequirementsUnwrapper {
    
    var viewModel: AdvertLandViewModel!
    override func provideViewModel() -> BaseViewModel? {
        return viewModel
    }
    
    //MARK: -> UI Components
    @IBOutlet weak var advertHeadingField: ONFormField!
    @IBOutlet weak var advertDescriptionField: ONFormField!
    @IBOutlet weak var sqft: ONFormField!
    @IBOutlet weak var islandNo: ONFormField!
    @IBOutlet weak var parcelNo: ONFormField!
    @IBOutlet weak var sectionNo: ONFormField!
    
    
    @IBOutlet weak var zoneState: OFFormField!
    @IBOutlet weak var kaks: OFFormField!
    @IBOutlet weak var sizeLimit: OFFormField!
    @IBOutlet weak var perfloor: OFFormField!
    @IBOutlet weak var landRegister: OFFormField!
    
    lazy var allFields: [BaseFormRequirements] = [
        advertHeadingField, advertDescriptionField, zoneState, perfloor, landRegister
    ]
    
    lazy var numericFields: [BaseFormRequirements] = [
        sqft
    ]
    
    
    
    /*
     Şimdi hem integer olabilir,
     hem de optional olabilir,
     
     */
    
//    let zoneState: ZoneState
//    let sqft: Int
//    let islandNo: Int
//    let parcelNo: Int
//    let sectionNo: Int
//    let kaks: KAKS
//    let sizeLimit: SizeLimitBuilding
//    let perfloor: Bool
//    let landRegister: LandRegisterStatus
    
    
    
    
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareViews()
    }
    
    private func prepareViews() {
        zoneState.formTypeEnum = .zonestate
        zoneState.changedFormElement = { [weak self] value in
            if let value = value as? ZoneState {
                self?.viewModel.zoneState = value
            }
        }
        kaks.formTypeEnum = .kaks
        kaks.changedFormElement = { [weak self] value in
            if let value = value as? KAKS {
                self?.viewModel.kaks = value
            }
        }
        sizeLimit.formTypeEnum = .sizelimit
        sizeLimit.changedFormElement = { [weak self] value in
            if let value = value as? SizeLimitBuilding {
                self?.viewModel.sizeLimit = value
            }
        }
        perfloor.formTypeEnum = .yesno(raw: "perfloor")
        perfloor.changedFormElement = { [weak self] value in
            if let value = value as? Bool {
                self?.viewModel.perfloor = value
            }
        }
        landRegister.formTypeEnum = .landregister
        landRegister.changedFormElement = { [weak self] value in
            if let value = value as? LandRegisterStatus {
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
        
        viewModel.advertHeadingField = advertHeadingField.safeText()
        viewModel.advertDescriptionField = advertDescriptionField.safeText()
        viewModel.sqft = Int(sqft.safeText() ?? "")
        viewModel.islandNo = Int(islandNo.safeText() ?? "")
        viewModel.parcelNo = Int(parcelNo.safeText() ?? "")
        viewModel.sectionNo = sectionNo.safeText()
        
        viewModel.setupBasicInfo()
    }

}



// MARK: - ViewModel Delegate -

extension AdvertLandViewController: AdvertLandViewModel.Delegate {
    func basicsInfoRequirementsSuccess() {
        previewAdress()
    }
    
    func createAdvertLandProductSuccess(_ product: LandProduct, with images: [UIImage]) {
        let vc = AdvertPreviewViewController.create(for: product, with: images)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


//MARK: -> AdressViewController Delegate
extension AdvertLandViewController: AdressViewController.Delegate, AdressPreviewer {
    func readyAdressContent(_ adress: AdressViewModel.Adress) {
        viewModel.address = adress
        previewGallery()
    }
}


//MARK: -> RequestGalleryViewController Delegate
extension AdvertLandViewController: RequestGalleryViewController.Delegate, GalleryPreviewer {
    func didFinishSelectImage(with images: [UIImage]) {
        viewModel.pickImageSuccess(images)
    }
}


// MARK: - Creator -
extension AdvertLandViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "AdvertLandViewController"
        }
    }
    
    class func create(categorys: [String]) -> AdvertLandViewController {
        let vc: AdvertLandViewController = AdvertLandViewController.instantiateFromNib()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        let viewModel: AdvertLandViewModel = AdvertLandViewModel(category: categorys)
        vc.viewModel = viewModel
        viewModel.delegate = vc
        return vc
    }
}

