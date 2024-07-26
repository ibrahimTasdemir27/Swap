//
//  AdvertAutoFirstStepViewController.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import UIKit

final class AdvertAutoFirstStepViewController: UIViewController, AlertPresentable, FormFieldRequirementsUnwrapper {
    
    var viewModel: AdvertAutoFirstStepViewModel!

    @IBOutlet weak var advertHeadingField: ONFormField!
    @IBOutlet weak var advertDescriptionField: ONFormField!
    @IBOutlet weak var productStatusField: ONFormField!
    @IBOutlet weak var kilometerField: ONFormField!
    @IBOutlet weak var yearField: ONFormField!
    @IBOutlet weak var powerField: ONFormField!
    
    
    //MARK: -> Selectable UI Components
    @IBOutlet weak var shiftTypeField: OFFormField!
    @IBOutlet weak var caseTypeField: OFFormField!
    @IBOutlet weak var tractionTypeField: OFFormField!
    @IBOutlet weak var fuelTypeField: OFFormField!
    @IBOutlet weak var colorField: OFFormField!
    @IBOutlet weak var guarenteField: OFFormField!
    @IBOutlet weak var seriousDamageField: OFFormField!
    
    lazy var allFields: [BaseFormRequirements] = [ advertHeadingField, advertDescriptionField, productStatusField, kilometerField, yearField, powerField, shiftTypeField, caseTypeField, tractionTypeField, fuelTypeField, colorField, guarenteField, seriousDamageField]
    
  // MARK: - View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.prepareViews()
      
  }
  
  private func prepareViews() {
      shiftTypeField.formTypeEnum = .shiftType
      shiftTypeField.changedFormElement = { [weak self] value in
          if let value = value as? CarShiftType {
              self?.viewModel.shiftTypeField = value
          }
      }
      caseTypeField.formTypeEnum = .caseType
      caseTypeField.changedFormElement = { [weak self] value in
          if let value = value as? CarCaseType {
              self?.viewModel.caseTypeField = value
          }
      }
      tractionTypeField.formTypeEnum = .tractionType
      tractionTypeField.changedFormElement = { [weak self] value in
          if let value = value as? CarTractionType {
              self?.viewModel.tractionTypeField = value
          }
      }
      fuelTypeField.formTypeEnum = .fuelType
      fuelTypeField.changedFormElement = { [weak self] value in
          if let value = value as? CarFuelType {
              self?.viewModel.fuelTypeField = value
          }
      }
      colorField.formTypeEnum = .color
      colorField.changedFormElement = { [weak self] value in
          if let value = value as? ProductColor {
              self?.viewModel.colorField = value
          }
      }
      guarenteField.formTypeEnum = .yesno(raw: "guarenteField")
      guarenteField.changedFormElement = { [weak self] value in
          if let value = value as? Bool {
              self?.viewModel.guarenteField = value
          }
      }
      seriousDamageField.formTypeEnum = .yesno(raw: "seriousDamageField")
      seriousDamageField.changedFormElement = { [weak self] value in
          if let value = value as? Bool {
              self?.viewModel.seriousDamageField = value
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
        
        guard let yearString = yearField.safeText(), let year = Int(yearString) else {
            yearField.falseFormat()
            showAlert(with: "Yıl alanını doldurunuz") { [weak self] in
                self?.yearField.reset()
            }
            return
        }
        
        viewModel.advertHeadingField = advertHeadingField.safeText()
        viewModel.advertDescriptionField = advertDescriptionField.safeText()
        viewModel.productStatusField = .second
        viewModel.kilometerField = kilometerField.safeText()
        viewModel.yearField = year
        viewModel.powerField = powerField.safeText()
        
        viewModel.setupBasicInfo()
        
    }
    
}



// MARK: - ViewModel Delegate -
extension AdvertAutoFirstStepViewController: AdvertAutoFirstStepViewModel.Delegate, AdressPreviewer {
    func basicsInfoRequirementsSuccess() {
        previewAdress()
    }
    
    func createAdvertAutoProductSuccess(_ product: CarProduct, with images: [UIImage]) {
        let vc = AdvertPreviewViewController.create(for: product, with: images)
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: -> RequestGalleryViewController Delegate
extension AdvertAutoFirstStepViewController: RequestGalleryViewController.Delegate, GalleryPreviewer {
    func didFinishSelectImage(with images: [UIImage]) {
        viewModel.pickImageSuccess(images)
        
    }
}


//MARK: -> AdressViewController.Delegate
extension AdvertAutoFirstStepViewController: AdressViewController.Delegate {
    func readyAdressContent(_ adress: AdressViewModel.Adress) {
        viewModel.adress = adress
        previewGallery()
    }
}


// MARK: - Creator -
extension AdvertAutoFirstStepViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "AdvertAutoFirstStepViewController"
        }
    }
    
    class func create(categorys: [String]) -> AdvertAutoFirstStepViewController {
        let vc: AdvertAutoFirstStepViewController = AdvertAutoFirstStepViewController.instantiateFromNib()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        let viewModel: AdvertAutoFirstStepViewModel = AdvertAutoFirstStepViewModel(categorys: categorys)
        vc.viewModel = viewModel
        viewModel.delegate = vc
        return vc
    }
}
