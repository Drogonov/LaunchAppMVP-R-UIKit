//
//  CapsulesBuilder.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 12.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CapsulesBuilderProtocol {
    func createCapsulesModule(router: RouterProtocol) -> UIViewController
}

class CapsulesBuilder: CapsulesBuilderProtocol {
    func createCapsulesModule(router: RouterProtocol) -> UIViewController {
        let view = CapsulesViewController()
        let presenter = CapsulesPresenter(
            view: view,
            router: router
        )
        view.presenter = presenter
        return view
    }
}
