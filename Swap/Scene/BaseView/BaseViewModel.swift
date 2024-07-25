//
//  BaseViewModel.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 19.07.2024.
//

import Foundation

protocol BaseViewModelDelegate: AnyObject {
    func contentWillLoad()
    func contentDidLoad()
    func readyForContent()
    //func pageContentFailedToast(failure: BaseError)
    //func getContentFailure(failure: BaseError)
    func contentWillLoadWithSuccess(withCompletion completion: (() -> Void)?)
}

class BaseViewModel: NSObject {
    
    weak var baseVMDelegate: BaseViewModelDelegate?
    
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    
    func viewDidDisappear() {
        baseVMDelegate?.readyForContent()
    }
    
    @objc func userMustConnectedToInternet() {
        
    }
}
