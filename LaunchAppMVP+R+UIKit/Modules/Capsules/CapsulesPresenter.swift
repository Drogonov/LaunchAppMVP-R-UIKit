//
//  CapsulesPresenter.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 12.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol CapsulesPresenterProtocol: AnyObject {
    init(
        view: CapsulesViewControllerProtocol,
        router: RouterProtocol,
        model: CapsulesModel
    )
    func setView()
    func buttonTapped()
}

class CapsulesPresenter {
    
    // MARK: - Services
    
    // MARK: - Properties
    
    weak var view: CapsulesViewControllerProtocol?
    var router: RouterProtocol
    var model: CapsulesModel
    
    // MARK: - Construction
    
    required init(
        view: CapsulesViewControllerProtocol,
        router: RouterProtocol,
        model: CapsulesModel
    ) {
        self.view = view
        self.router = router
        self.model = model
    }
}

// MARK: - CapsulesPresenterProtocol

extension CapsulesPresenter: CapsulesPresenterProtocol {
    func setView() {
        let viewModel = configureViewModel()
        self.view?.setView(with: viewModel)
    }
    
    func buttonTapped() {
        debugPrint("buttonTapped")
    }
}

// MARK: - Helper Functions

extension CapsulesPresenter {
    func configureViewModel() -> CapsulesViewModel {
        return CapsulesViewModel(
            navigationTitle: "navigationTitle",
            buttonText: "buttonText"
        )
    }
}
