//
//  SelectFormViewController.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import UIKit


final class SelectFormViewController: BaseViewController {
    
    protocol Delegate: AnyObject {
        func didSelectFormElement(_ formType: FormTypeEnum, for value: Any?)
    }

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: SelectFormViewModel!
    
    weak var delegate: SelectFormViewController.Delegate?
    
    var defaultElement: String?
    
    override func provideViewModel() -> BaseViewModel? {
        return viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViews()
    }
    
    private func prepareViews() {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let defaultElement = defaultElement { selectElement(for: defaultElement) }
    }
    
    @IBAction func tappedCancelButton(_ sender: Any) {
        dismiss(animated: false)
    }
    
    private func selectElement(for element: String) {
        if let index = viewModel.keys.firstIndex(of: element) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        }
    }
    

}


//MARK: -> viewModel Delegate
extension SelectFormViewController: SelectFormViewModel.Delegate {
    
}






//MARK: -> tableView Delegate & Datasource
extension SelectFormViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var config = cell.defaultContentConfiguration()
        config.text = viewModel.keys[indexPath.row]
        
        cell.contentConfiguration = config
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectFormElement(viewModel.formType, for: viewModel.formElements[viewModel.keys[indexPath.row]])
        
        dismiss(animated: false)
    }
}



//MARK: -> Create
extension SelectFormViewController: XibNameProvider {
    static var xibName: String {
        return "SelectFormViewController"
    }
    
    class func create(for formType: FormTypeEnum) -> SelectFormViewController {
        let vc: SelectFormViewController = .instantiateFromNib()
        let viewModel = SelectFormViewModel(formType: formType)
        viewModel.delegate = vc
        vc.viewModel = viewModel
        
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        return vc
    }
}
