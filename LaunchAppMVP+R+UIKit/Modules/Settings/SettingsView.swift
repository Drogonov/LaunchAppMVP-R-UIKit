//
//  SettingsView.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 17.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

protocol SettingsViewDelegate: AnyObject {
    func confirmButtonTapped()
}

class SettingsView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: SettingsViewDelegate?
    
    private var model = SettingsViewModel()
    
    private let textView = UITextView()
    private let confirmButton = UIButton(type: .system)
    
    // MARK: - Construction
    
    init() {
        super.init(frame: .zero)
        set(model: model)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func confitmButtonTapped() {
        delegate?.confirmButtonTapped()
    }
    
    // MARK: - Methods
    
    func set(model: SettingsViewModel) {
        textView.text = model.text
        confirmButton.setTitle(model.buttonText, for: .normal)
        configureUI()
    }
}

// MARK: - Configure UI

extension SettingsView {
    private func configureUI() {
        configureTextView()
        configureButton()
    }
    
    private func configureTextView() {
        textView.font = .systemFont(ofSize: 16)
        
        addSubview(textView)
        textView.anchor(
            top: self.topAnchor,
            leading: self.leftAnchor,
            bottom: self.bottomAnchor,
            trailing: self.rightAnchor,
            paddingLeft: Constant.textPaddingHorizontal,
            paddingBottom: Constant.buttonHeight,
            paddingRight: Constant.textPaddingHorizontal
        )
    }
    
    private func configureButton() {
        confirmButton.backgroundColor = UIColor.accentColor
        confirmButton.setTitleColor(UIColor.label, for: .normal)
        confirmButton.layer.cornerRadius = 10
        confirmButton.addTarget(self, action: #selector(confitmButtonTapped), for: .touchUpInside)
        confirmButton.sizeToFit()
        
        addSubview(confirmButton)
        confirmButton.anchor(
            top: textView.bottomAnchor,
            leading: self.leftAnchor,
            bottom: self.bottomAnchor,
            trailing: self.rightAnchor,
            paddingLeft: Constant.buttonPaddingHorizontal,
            paddingRight: Constant.buttonPaddingHorizontal
        )
    }
}

// MARK: - Constants

extension SettingsView {
    private enum Constant {
        static let buttonHeight: CGFloat = 40
        static let buttonPaddingHorizontal: CGFloat = 80
        static let textPaddingHorizontal: CGFloat = 16
    }
}
