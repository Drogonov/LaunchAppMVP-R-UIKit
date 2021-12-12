//
//  Router.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 12.12.2021.
//

import Foundation
import UIKit

protocol RouterProtocol {
    var window: UIWindow? { get set }
    
    func initialMainTabBar()
    func popToRoot()
    func popViewController()
    
    func showDetailLaunch(with vc: UIViewController)
    func showDetailCapsules(with vc: UIViewController)
    
    init(
        window: UIWindow?,
        launchesBuilder: LaunchesBuilderProtocol,
        capsulesBuilder: CapsulesBuilderProtocol
    )
}
