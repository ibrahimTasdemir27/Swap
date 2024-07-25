//
//  LoadingWithSuccessView.swift
//  DevilDashDelivery
//
//  Created by İbrahim Taşdemir on 9.08.2023.
//

import UIKit



final class LoadingWithSuccessView {
    
    static let shared = LoadingWithSuccessView()
    
    lazy var contentViewForSuccess: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 14
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var succcessImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark.diamond.fill")
        imageView.tintColor = .systemGray6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var successLabel: UILabel = {
        let label = UILabel()
        label.text = "Success!"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .systemGray6
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func configureSuccessView() {
        contentViewForSuccess.addSubview(succcessImageView)
        contentViewForSuccess.addSubview(successLabel)
        
        NSLayoutConstraint.activate([
            contentViewForSuccess.heightAnchor.constraint(equalToConstant: 140),
            contentViewForSuccess.widthAnchor.constraint(equalToConstant: 140),
        
            succcessImageView.centerXAnchor.constraint(equalTo: contentViewForSuccess.centerXAnchor),
            succcessImageView.topAnchor.constraint(equalTo: contentViewForSuccess.topAnchor, constant: 15),
            succcessImageView.heightAnchor.constraint(equalToConstant: 80),
            succcessImageView.widthAnchor.constraint(equalToConstant: 80),
            
            successLabel.centerXAnchor.constraint(equalTo: contentViewForSuccess.centerXAnchor),
            successLabel.bottomAnchor.constraint(equalTo: contentViewForSuccess.bottomAnchor, constant: -15)
            
        ])
    }
    
    func successView(with text: String = "Success!") -> UIView {
        configureSuccessView()
        return contentViewForSuccess
    }
    
    deinit {
        print("I'm deinit: LoadingWithSuccessView")
    }
    
}
