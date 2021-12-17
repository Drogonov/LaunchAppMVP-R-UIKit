//
//  SettingsViewController.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 17.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SettingsViewControllerProtocol: AnyObject {
    func setView(with viewModel: SettingsViewModel)
}

class SettingsViewController: BaseViewController {
    
    // MARK: - Properties
    
    var presenter: SettingsPresenterProtocol?
    private var settingsView = SettingsView()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

// MARK: - Configure UI

extension SettingsViewController {
    private func configureUI() {
        presenter?.setView()
        configureSettingsView()
    }
    
    private func configureNavigationBar(navigationTitle: String) {
        setNavigationBarTitle(with: navigationTitle)
    }
    
    private func configureSettingsView() {
        addUIViewToViewController(settingsView)
    }
    
    private func configureView(with viewModel: SettingsViewModel) {
        settingsView.set(model: viewModel)
    }
}

// MARK: - BrewViewProtocol

extension SettingsViewController: SettingsViewControllerProtocol {
    func setView(with viewModel: SettingsViewModel) {
        configureNavigationBar(navigationTitle: viewModel.navigationTitle)
        configureView(with: viewModel)
    }
}
