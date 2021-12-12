//
//  LaunchesPresenter.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 12.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol LaunchesPresenterProtocol: AnyObject {
    init(
        view: LaunchesViewControllerProtocol,
        router: RouterProtocol,
        model: LaunchesModel
    )
    func setView()
    func buttonTapped()
}

class LaunchesPresenter {
    
    // MARK: - Services
    
    // MARK: - Properties
    
    weak var view: LaunchesViewControllerProtocol?
    var router: RouterProtocol
    var model: LaunchesModel
    
    // MARK: - Construction
    
    required init(
        view: LaunchesViewControllerProtocol,
        router: RouterProtocol,
        model: LaunchesModel
    ) {
        self.view = view
        self.router = router
        self.model = model
    }
}

// MARK: - LaunchesPresenterProtocol

extension LaunchesPresenter: LaunchesPresenterProtocol {
    func setView() {
        let viewModel = configureViewModel()
        self.view?.setView(with: viewModel)
    }
    
    func buttonTapped() {
        debugPrint("buttonTapped")
    }
}

// MARK: - Helper Functions

extension LaunchesPresenter {
    func configureViewModel() -> LaunchesViewModel {
        return LaunchesViewModel(
            navigationTitle: "navigationTitle",
            buttonText: "buttonText"
        )
    }
}
