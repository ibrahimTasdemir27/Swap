//
//  AdvertViewController.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import UIKit


final class AdvertViewController: BaseViewController {
    
    var viewModel: AdvertViewModel!
    
    override func provideViewModel() -> BaseViewModel? {
        return viewModel
    }
    
    //MARK: -> UI Components
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var selectedCategoryContentTitleLabel: UILabel!
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareViews()
        
    }
    
    private func prepareViews() {
        AdvertTableViewCell.registerSelf(tableView: tableView)
        selectedCategoryContentTitleLabel.text = viewModel.selectedContents.count == 1 ? viewModel.selectedContents.first! + " >" : viewModel.selectedContents.joined(separator: " > ")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//#if DEBUG
//        let vc = AdvertAutoFirstStepViewController.create(categorys: viewModel.selectedContents)
//        navigationController?.pushViewController(vc, animated: true)
//#endif
    }
    
    // MARK: - IBActions
    @IBAction func tappedBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}



// MARK: - ViewModel Delegate -

extension AdvertViewController: AdvertViewModelDelegate {
    func redirectAdvertAuto() {
        let vc = AdvertAutoFirstStepViewController.create(categorys: viewModel.selectedContents)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func redirectAdvertHouse(for type: HouseType) {
        let vc = AdvertHouseViewController.create(categorys: viewModel.selectedContents, type: type)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func redirectAdvertApartment() {
        let vc = AdvertAppertmentViewController.create(categorys: viewModel.selectedContents)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func redirectAdvertResidence() {
        let vc = AdvertResidenceViewController.create(categorys: viewModel.selectedContents)
        navigationController?.pushViewController(vc, animated: true)
    }

    
    func redirectAdvertLand() {
        let vc = AdvertLandViewController.create(categorys: viewModel.selectedContents)
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: -> AdvertTableViewCell Delegate
extension AdvertViewController: AdvertTableViewCell.Delegate {
    func didSelectCategoryElement(key: String, for indexPath: IndexPath) {
        if let subContent = viewModel.categoryContent[key] as? [String: Any] {
            //Emlak -> Araba -> Renault -> Clio -> 1.9 -> #Finalize
            let vc = AdvertViewController.create(with: subContent, selectedContents: viewModel.selectedContents + [key])
            navigationController?.pushViewController(vc, animated: true)
        } else {
            //Finish
            guard let value = viewModel.categoryContent[key] as? Finalizer else {
                return
            }
            
            viewModel.finalizeCategory(value, with: key)
        }
    }
}


//MARK: -> UITableView Delegate & DataSource
extension AdvertViewController: UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categoryContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AdvertTableViewCell.className, for: indexPath) as! AdvertTableViewCell
        cell.delegate = self
        cell.bind(description: viewModel.categoryContent.keys.sorted()[indexPath.row], for: indexPath)
        return cell
    }
}


// MARK: - Creator -
extension AdvertViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "AdvertViewController"
        }
    }
    
    class func create(with content: [String: Any], selectedContents: [String] = []) -> AdvertViewController {
        let vc: AdvertViewController = AdvertViewController.instantiateFromNib()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        let viewModel: AdvertViewModel = AdvertViewModel(categoryContent: content, selectedContents: selectedContents)
        vc.viewModel = viewModel
        viewModel.delegate = vc
        return vc
    }
}


/*
 Diyelim araç seçiyor ?
 Aracın ilk olarak markasını seçicek ?
 Ardından Modeli seçicek ?
 Ardından Motor tipini seçicek ?
 
 
 Her ev tipi için bir ekran tasarlasam ?
 Residence için bir tane
 Gecekondu için ayrı bir tane
 Normal için ayrı bir tane
 
 Şu an bir normal için
 bir de site içi evler için tasarlamam lazım
 Tamam
 
 */
