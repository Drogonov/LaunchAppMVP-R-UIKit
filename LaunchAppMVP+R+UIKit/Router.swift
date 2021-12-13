//
//  Router.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 12.12.2021.
//

import Foundation
import UIKit

protocol RouterProtocol {
    
    init(
        tabBarController: MainTabBarController,
        mainTabBarBuilder: MainTabBarBuilderProtocol
    )
    
    func initialMainTabBar()
    func showDetailLaunch(with vc: UIViewController)
    func showDetailCapsules(with vc: UIViewController)
}

import UIKit

class Router {
    
    // MARK: - Properties
    
    var tabBarController: MainTabBarController
    var mainTabBarBuilder: MainTabBarBuilderProtocol
    
    // MARK: - Construction
    
    required init(
        tabBarController: MainTabBarController,
        mainTabBarBuilder: MainTabBarBuilderProtocol
    ) {
        self.tabBarController = tabBarController
        self.mainTabBarBuilder = mainTabBarBuilder
    }
    
}

extension Router: RouterProtocol {
    func initialMainTabBar() {
        let launchesController = mainTabBarBuilder.launchesBuilder.createLaunchesModule(router: self)
        let capsulesController = mainTabBarBuilder.capsulesBuilder.createCapsulesModule(router: self)
        
        let vcArray: [(vc: UIViewController, tabBarItemType: TabBarItemType)] = [
            (vc: launchesController, tabBarItemType: .launches),
            (vc: capsulesController, tabBarItemType: .capsules)
        ]
        
        tabBarController.configureTabBar(with: vcArray)
    }
        
    func showDetailLaunch(with vc: UIViewController) {
//        let detailViewController = mainTabBarBuilder.launchesBuilder.createDetailLaunchModule(router: self)
//        guard let navController = tabBarController.getNavController(with: vc) else { return }
//        navController.pushViewController(detailViewController, animated: true)
    }
    
    func showDetailCapsules(with vc: UIViewController) {
//        let detailViewController = mainTabBarBuilder.capsulesBuilder.createDetailCapsuleModule(router: self)
//        guard let navController = tabBarController.getNavController(with: vc) else { return }
//        navController.pushViewController(detailViewController, animated: true)
    }
}
