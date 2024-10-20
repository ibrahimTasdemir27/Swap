//
//  AddTextViewController.swift
//  HaydiGram
//
//  Created by İbrahim Taşdemir on 24.08.2024.
//

import UIKit


final class AddTextViewController: UIViewController {
    
    var viewModel: AddTextViewModel!
    var onFinishAddText: ((String) -> Void)? = nil
    var isLight: Bool? = nil
    var previewText: String? = nil
    
    //MARK: -> UI Components
    @IBOutlet weak var addedTField: BaseTField!
    
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareViews()
    }
    
    private func prepareViews() {
        addedTField.text = previewText
        addedTField.attributedPlaceholder = NSAttributedString(
            string: addedTField.placeholder ?? "",
            attributes: [
                .foregroundColor: UIColor.systemGray6
            ])
    }
    
    
    
    // MARK: - IBActions
    @IBAction func tappedCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func tapepdFinishAddTextButton(_ sender: Any) {
        guard let text = addedTField.text?.trimmed() else {
            dismiss(animated: true)
            return
        }
        
        onFinishAddText?(text)
        dismiss(animated: true)
    }
}



// MARK: - ViewModel Delegate -

extension AddTextViewController:
    AddTextViewModel.Delegate {
    
}



// MARK: - Creator -
extension AddTextViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "AddTextViewController"
        }
    }
    
    class func create(previewText: String? = nil, onFinishAddText: @escaping(String) -> Void) -> AddTextViewController {
        let vc: AddTextViewController = AddTextViewController.instantiateFromNib()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        let viewModel: AddTextViewModel = AddTextViewModel()
        vc.viewModel = viewModel
        viewModel.delegate = vc
        vc.previewText = previewText
        vc.onFinishAddText = onFinishAddText
        return vc
    }
}

