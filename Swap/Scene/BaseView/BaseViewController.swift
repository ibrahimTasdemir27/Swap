//
//  BaseViewController.swift
//  WallpaperCreator
//
//  Created by İbrahim Taşdemir on 16.07.2023.
//

import UIKit
import NVActivityIndicatorView


class BaseViewController: UIViewController {
    
    
    private var viewModel: BaseViewModel!
    
    private var effectViewCount: Int = 0
    
    private let successView = LoadingWithSuccessView.shared.successView()
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.3)
        return view
    }()
    
    private lazy var progressView = NVActivityIndicatorView(frame: .zero)
    
    private var workItem: DispatchWorkItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let baseVM = provideViewModel() else { return }
        viewModel = baseVM
        viewModel.baseVMDelegate = self
        viewModel.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewWillDisappear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
    
    func provideViewModel() -> BaseViewModel? {
        return nil
    }
    
    func addLoadingElements() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.alpha = 1
        view.addSubview(backView)
        
        progressView = NVActivityIndicatorView(frame: .zero, type: .ballSpinFadeLoader, color: .white, padding: 20)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        backView.addSubview(progressView)
        
        progressView.startAnimating()
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: view.topAnchor),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            progressView.widthAnchor.constraint(equalToConstant: 90),
            progressView.heightAnchor.constraint(equalToConstant: 90),
            progressView.centerXAnchor.constraint(equalTo: self.backView.centerXAnchor),
            progressView.centerYAnchor.constraint(equalTo: self.backView.centerYAnchor)
        ])
//        progressView.backgroundColor = .systemGray4
        progressView.layer.cornerRadius = 8
    }
    
    func disableLoadingElements() {
        progressView.stopAnimating()
        backView.removeFromSuperview()
        progressView.removeFromSuperview()
    }
    
}

extension BaseViewController: BaseViewModelDelegate {
    
    func contentWillLoad() {
        effectViewCount += 1
        guard effectViewCount == 1 else {
            return
        }
      addLoadingElements()
    }
    
    func contentDidLoad() {
        effectViewCount -= 1
        
        guard effectViewCount == 0 else {
            return
        }
        disableLoadingElements()
    }
    
    func readyForContent() {
        
    }
    
}

extension BaseViewController {
    
    private func configureSuccessView() {
        view.addSubview(successView)
        
        NSLayoutConstraint.activate([
            successView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            successView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
    }
    
    func contentWillLoadWithSuccess(withCompletion completion: (() -> Void)?) {
        workItem?.cancel()

        let newWorkItem = DispatchWorkItem { [weak self] in
            self?.configureSuccessView()
            self?.successView.alpha = 1
            UIView.animate(withDuration: 1.453) { [weak self] in
                self?.successView.alpha = 0
            } completion: { [weak self] value in
                completion?()
                self?.successView.removeFromSuperview()
            }
        }

        workItem = newWorkItem

        DispatchQueue.main.async(execute: newWorkItem)
    }
}
