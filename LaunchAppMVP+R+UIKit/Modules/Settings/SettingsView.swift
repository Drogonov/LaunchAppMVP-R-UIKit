//
//  SettingsView.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 17.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

class SettingsView: UIView {
    
    // MARK: - Properties
    
    private var model = SettingsViewModel()
    
    private var textView = UITextView()
    private var confirmButton = UIButton()
    
    // MARK: - Construction
    
    init() {
        super.init(frame: .zero)
        set(model: model)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func confitmButtonTapped() {
        debugPrint("confirm button tapped")
    }
    
    // MARK: - Methods
    
    func set(model: SettingsViewModel) {
        textView.text = model.text
        confirmButton.setTitle(model.buttonText, for: .normal)
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
        confirmButton.layer.cornerRadius = 10
        confirmButton.titleLabel?.textColor = UIColor.label
        confirmButton.addTarget(self, action: #selector(confitmButtonTapped), for: .touchUpInside)
        
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
