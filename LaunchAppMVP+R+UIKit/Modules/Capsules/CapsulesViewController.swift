//
//  CapsulesViewController.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 12.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CapsulesViewControllerProtocol: AnyObject {
    func setView(with viewModel: CapsulesViewModel)
    
}

class CapsulesViewController: BaseViewController {
    
    // MARK: - Properties
    
    var presenter: CapsulesPresenterProtocol?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

// MARK: - Configure UI

extension CapsulesViewController {
    private func configureUI() {
        presenter?.setView()
    }
    
    private func configureView(with viewModel: CapsulesViewModel) {
        let view = CapsulesView(
            buttonText: viewModel.buttonText,
            buttonTapped: {
                self.presenter?.buttonTapped()
            }
        )
        addMainViewToViewController(view)
    }
}

// MARK: - BrewViewProtocol

extension CapsulesViewController: CapsulesViewControllerProtocol {
    func setView(with viewModel: CapsulesViewModel) {
        setNavigationBarTitle(with: viewModel.navigationTitle)
        configureView(with: viewModel)
    }
}
