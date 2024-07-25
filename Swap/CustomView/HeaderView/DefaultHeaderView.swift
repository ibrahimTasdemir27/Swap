//
//  DefaultHeaderView.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 20.07.2024.
//

import UIKit

@IBDesignable
class DefaultHeaderView: UIView {
    
    @objc protocol Delegate: AnyObject {
        @objc optional func tappedHeaderTitleLabelButton(_ sender: UIButton)
        @objc optional func tappedFooterTitleLabelButton(_ sender: UIButton)
    }
    
    weak var delegate: Delegate? = nil
    
    let headerTitleLabelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("#TakasLa", for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = .init(name: "Montserrat-ExtraBold", size: 25)
        button.setTitleColor(.primary, for: .normal)
        return button
    }()
    
    let footerTitleLabelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("@İlan Ver", for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = .init(name: "Montserrat-SemiBold", size: 18)
        button.setTitleColor(.primaryGray, for: .normal)
        return button
    }()
    
    
    @IBInspectable var headerString: String = "#TakasLa" {
        didSet {
            headerTitleLabelButton.setTitle(headerString, for: .normal)
        }
    }
    
    @IBInspectable var footerString: String = "@İlan Ver" {
        didSet {
            footerTitleLabelButton.setTitle(footerString, for: .normal)
        }
    }
    
    private func commonInıt() {
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInıt()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInıt()
    }
    
    
    private func configure() {
        let statusBarHeight =
            UIApplication.shared.connectedScenes
            .filter {$0.activationState == .foregroundActive }
            .map {$0 as? UIWindowScene }
            .compactMap { $0 }
            .first?.windows
            .filter({ $0.isKeyWindow }).first?
            .windowScene?.statusBarManager?.statusBarFrame.height ?? 55
        
        
        let spaceView = generateSpaceView()
        
        let spaceView2 = generateSpaceView()
        
        
        
        let horizontalStackView = UIStackView(arrangedSubviews: [headerTitleLabelButton, spaceView2, footerTitleLabelButton])
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
            
            spaceView.heightAnchor.constraint(equalToConstant: statusBarHeight),
            spaceView.leftAnchor.constraint(equalTo: stackContent.leftAnchor),
            spaceView.rightAnchor.constraint(equalTo: stackContent.rightAnchor),
            
            horizontalStackView.leftAnchor.constraint(equalTo: stackContent.leftAnchor, constant: 10),
            horizontalStackView.rightAnchor.constraint(equalTo: stackContent.rightAnchor, constant: -10),
        ])
        
        addButtonActions()
    }
    
    private func addButtonActions() {
        guard delegate != nil else {
            return
        }
        headerTitleLabelButton.addTarget(self, action: #selector(delegate?.tappedHeaderTitleLabelButton(_:)), for: .touchUpInside)
        footerTitleLabelButton.addTarget(self, action: #selector(delegate?.tappedFooterTitleLabelButton(_:)), for: .touchUpInside)
    }
    
    
    private func generateSpaceView() -> UIView {
        let spaceView = UIView()
        spaceView.translatesAutoresizingMaskIntoConstraints = false
        spaceView.backgroundColor = .clear
        return spaceView
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInıt()
    }
    
    
}
