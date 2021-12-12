//
//  LaunchesBuilder.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 12.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LaunchesBuilderProtocol {
    func createLaunchesModule(router: RouterProtocol, model: LaunchesModel) -> UIViewController
}

class LaunchesBuilder: LaunchesBuilderProtocol {
    func createLaunchesModule(router: RouterProtocol, model: LaunchesModel) -> UIViewController {
        let view = LaunchesViewController()
        let presenter = LaunchesPresenter(
            view: view,
            router: router,
            model: model
        )
        view.presenter = presenter
        return view
    }
}
