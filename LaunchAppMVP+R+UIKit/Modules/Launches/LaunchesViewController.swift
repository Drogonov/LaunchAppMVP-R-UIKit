//
//  LaunchesViewController.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 12.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LaunchesViewControllerProtocol: AnyObject {
    func setView(with viewModel: LaunchesViewModel)
    
}

class LaunchesViewController: BaseViewController {
    
    // MARK: - Properties
    
    var presenter: LaunchesPresenterProtocol?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

// MARK: - Configure UI

extension LaunchesViewController {
    private func configureUI() {
        presenter?.setView()
    }
    
    private func configureView(with viewModel: LaunchesViewModel) {
        let view = LaunchesView(
            buttonText: viewModel.buttonText,
            buttonTapped: {
                self.presenter?.buttonTapped()
            }
        )
        addMainViewToViewController(view)
    }
}

// MARK: - BrewViewProtocol

extension LaunchesViewController: LaunchesViewControllerProtocol {
    func setView(with viewModel: LaunchesViewModel) {
        setNavigationBarTitle(with: viewModel.navigationTitle)
        configureView(with: viewModel)
    }
}
