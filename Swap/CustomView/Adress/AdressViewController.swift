//
//  AdressViewController.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import UIKit


final class AdressViewController: UIViewController, AlertPresentable {
    
    protocol Delegate: AnyObject {
        func readyAdressContent(_ adress: AdressViewModel.Adress)
    }
    
    var viewModel: AdressViewModel!
    
    var delegate: Delegate? = nil
    
    
    //MARK: -> UI Components
    @IBOutlet private weak var countryLabel: OFFormField!
    @IBOutlet private weak var cityLabel: OFFormField!
    @IBOutlet private weak var townLabel: OFFormField!
    @IBOutlet private weak var districtLabel: ONFormField!
    @IBOutlet private weak var quarterLabel: ONFormField!
    
    lazy var allFields: [BaseFormRequirements] = [countryLabel, cityLabel, townLabel, districtLabel, quarterLabel]
    
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareViews()
    }
    
    private func prepareViews() {
        cityLabel.formTypeEnum = .city
        cityLabel.changedFormElement = { [weak self] value in
            if let value = value as? String {
                self?.townLabel.formTypeEnum = .town(city: value)
                self?.viewModel.city = value
            }
        }
        townLabel.formTypeEnum = .town(city: "")
        townLabel.changedFormElement = { [weak self] value in
            if let value = value as? String {
                self?.viewModel.town = value
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func tappedContinueButton(_ sender: Any) {
        guard let country = countryLabel.safeText(),
              let city = cityLabel.safeText(),
              let town = townLabel.safeText(),
              let district = districtLabel.safeText(),
              let quarter = quarterLabel.safeText() else {
            
            allFields.forEach { $0.falseFormat() }
            showAlert(with: "Lütfen tüm alanları doğru bir şekilde doldurun.") { [weak self] in
                self?.allFields.forEach({ $0.reset() })
            }
            
            return
        }
        
        viewModel.setupAdress(country: country, city: city, town: town, district: district, quarter: quarter)
    }
    
}



// MARK: - ViewModel Delegate -
extension AdressViewController: AdressViewModel.Delegate {
    func readyAdressContent(_ adress: AdressViewModel.Adress) {
        delegate?.readyAdressContent(adress)
    }
    
    
}


// MARK: - Creator -
extension AdressViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "AdressViewController"
        }
    }
    
    class func create() -> AdressViewController {
        let vc: AdressViewController = AdressViewController.instantiateFromNib()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        let viewModel: AdressViewModel = AdressViewModel()
        vc.viewModel = viewModel
        viewModel.delegate = vc
        return vc
    }
}

