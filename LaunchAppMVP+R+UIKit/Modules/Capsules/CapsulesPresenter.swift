//
//  CapsulesPresenter.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 12.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

protocol CapsulesPresenterProtocol: AnyObject {
    init(
        view: CapsulesViewControllerProtocol,
        router: RouterProtocol
    )
    
    func setView()
    func loadCapsules()
    func routeToDetails(with capsuleID: UUID?)
}

class CapsulesPresenter {
    
    // MARK: - Services
    
    @Inject var spaceXDataService: SpaceXDataService

    // MARK: - Properties
    
    weak var view: CapsulesViewControllerProtocol?
    var router: RouterProtocol
    private var capsulesArray: [CapsuleCellViewModel] = []
    
    // MARK: - Construction
    
    required init(
        view: CapsulesViewControllerProtocol,
        router: RouterProtocol
    ) {
        self.view = view
        self.router = router
    }
}

// MARK: - CapsulesPresenterProtocol

extension CapsulesPresenter: CapsulesPresenterProtocol {
    func setView() {
        let viewModel = configureViewModel()
        self.view?.setView(with: viewModel)
    }
    
    func loadCapsules() {
        spaceXDataService.getCapsulesList { [weak self] result in
            guard let self = self else { return }
            self.view?.showLoader()
            switch result {
            case .success(let response):
                guard let capsules = response else { return }
                self.configureCapsulesArray(with: capsules)
                self.setView()
                self.view?.hideLoader()
            case .failure(let error):
                self.view?.hideLoader()
                debugPrint(error)
            }
        }
    }
    
    func routeToDetails(with capsuleID: UUID?) {
        
    }
}

// MARK: - Helper Functions

extension CapsulesPresenter {
    func configureViewModel() -> CapsulesViewModel {
        return CapsulesViewModel(
            navigationTitle: "Capsules",
            capsules: capsulesArray
        )
    }
    
    func configureCapsulesArray(with response: [CapsuleMo]) {
        var capsules: [CapsuleCellViewModel] = []
        
        capsules = response.map { model in
            let statusButtonColor: UIColor = model.status == "active" ? .green : .red
            let serial = model.capsuleSerial ?? "no serial"
            
            return CapsuleCellViewModel(
                statusButtonColor: statusButtonColor,
                capsuleName: serial,
                capsuleEmoji: "🛰"
            )
        }
        
        capsulesArray = capsules
    }
}
