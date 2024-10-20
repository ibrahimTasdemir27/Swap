//
//  DefaultHeaderView.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import UIKit

class InteractableHeaderView: UIView {
    
    @objc protocol Delegate: AnyObject {
        @objc optional func tappedHeaderTitleLabelButton(_ sender: UIButton)
        @objc optional func tappedHeaderCancelButton(_ sender: UIButton)
        @objc optional func tappedHeaderContinueButton(_ sender: UIButton)
    }
    
    weak var delegate: Delegate? = nil
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let configSymbol = UIImage.SymbolConfiguration(pointSize: 20, weight: .semibold)
        button.setImage(.init(systemName: "arrow.backward", withConfiguration: configSymbol), for: .normal)
        button.contentHorizontalAlignment = .left
        button.tintColor = .black
        return button
    }()
    
    
    let headerTitleLabelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Yeni Gönderi", for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = .init(name: "Montserrat-Bold", size: 14)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let configSymbol = UIImage.SymbolConfiguration(pointSize: 20, weight: .semibold)
        button.setImage(.init(systemName: "checkmark", withConfiguration: configSymbol), for: .normal)
        button.contentHorizontalAlignment = .left
        button.tintColor = .systemBlue
        return button
    }()
    
    
    @IBInspectable var headerString: String = "Yeni Gönderi" {
        didSet {
            headerTitleLabelButton.setTitle(headerString, for: .normal)
        }
    }
    
    @IBInspectable var rightButtonActive: Bool = true {
        didSet {
            continueButton.isHidden = !rightButtonActive
        }
    }
    
    
    private func commonInıt() {
        configure()
        addButtonActions()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInıt()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInıt()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInıt()
    }
    
    private func configure() {
        let spaceView = generateSpaceView()
        
        let spaceView2 = generateSpaceView()
        
        
        
        let horizontalStackView = UIStackView(arrangedSubviews: [backButton, spaceView2, headerTitleLabelButton, continueButton])
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.axis = .horizontal
        
        
        let stackContent = UIStackView(arrangedSubviews: [spaceView, horizontalStackView])
        stackContent.translatesAutoresizingMaskIntoConstraints = false
        stackContent.axis = .vertical
        stackContent.alignment = .center
        
        
        translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackContent)
        NSLayoutConstraint.activate([
            stackContent.topAnchor.constraint(equalTo: topAnchor),
            stackContent.leftAnchor.constraint(equalTo: leftAnchor),
            stackContent.rightAnchor.constraint(equalTo: rightAnchor),
            stackContent.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            horizontalStackView.leftAnchor.constraint(equalTo: stackContent.leftAnchor, constant: 10),
            horizontalStackView.rightAnchor.constraint(equalTo: stackContent.rightAnchor, constant: -10),
            
            backButton.heightAnchor.constraint(equalToConstant: 55),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            
            spaceView2.widthAnchor.constraint(equalToConstant: 10),
            
            continueButton.heightAnchor.constraint(equalToConstant: 55),
            continueButton.widthAnchor.constraint(equalToConstant: 40),
            
            
            headerTitleLabelButton.heightAnchor.constraint(equalToConstant: 55),
            
        ])
    }
    
    func registerDelegate(_ delegate: Delegate) {
        self.delegate = delegate
        
    }
    
    private func addButtonActions() {
        backButton.addTarget(self, action: #selector(tappedHeaderCancelButton(_:)), for: .touchUpInside)
        headerTitleLabelButton.addTarget(self, action: #selector(tappedHeaderTitleLabelButton(_:)), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(tappedHeaderContinueButton(_:)), for: .touchUpInside)
    }
    
    @objc func tappedHeaderCancelButton(_ sender: UIButton) {
        if delegate == nil, let vc = findViewController() {
            if vc.navigationController != nil { vc.navigationController?.popViewController(animated: true) }
            else { vc.dismiss(animated: true) }
            return
        }
        delegate?.tappedHeaderCancelButton?(sender)
    }
    
    @objc func tappedHeaderContinueButton(_ sender: UIButton) {
        delegate?.tappedHeaderContinueButton?(sender)
    }
    
    @objc func tappedHeaderTitleLabelButton(_ sender: UIButton) {
        delegate?.tappedHeaderTitleLabelButton?(sender)
    }
    
    
    private func generateSpaceView() -> UIView {
        let spaceView = UIView()
        spaceView.translatesAutoresizingMaskIntoConstraints = false
        spaceView.backgroundColor = .clear
        return spaceView
    }
    
    
    
}
