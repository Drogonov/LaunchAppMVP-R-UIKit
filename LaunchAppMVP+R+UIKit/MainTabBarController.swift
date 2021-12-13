//
//  MainViewController.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 10.12.2021.
//

import UIKit

enum TabBarItemType {
    case launches
    case capsules
    
    var type: UITabBarItem {
        switch self {
        case .launches:
            return UITabBarItem(
                title: "Launches",
                image: UIImage(systemName: "capslock")!,
                selectedImage: UIImage(systemName: "capslock.fill")!
            )
            
        case .capsules:
            return UITabBarItem(
                title: "Capsules",
                image: UIImage(systemName: "bolt.car")!,
                selectedImage: UIImage(systemName: "bolt.car.fill")!
            )
        }
    }
}

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        configureUI()
    }
    
    // MARK: - External Functions
    
    func configureTabBar(with vcArray: [(vc: UIViewController, tabBarItemType: TabBarItemType)]) {
        viewControllers = vcArray.map { item in
            item.vc.tabBarItem = item.tabBarItemType.type
            let nav = embedToNav(item.vc)
            
            return nav
        }
        selectedIndex = 0
    }
    
    func getNavController<T: UIViewController>(with viewController: T) -> UINavigationController? {
        guard let index = getIndexOfEmbedeWithNavVC(with: viewController),
              let nav = viewControllers?[index] as? UINavigationController else { return nil }
        
        return nav
    }
    
    // MARK: - Configure UI
    
    private func configureUI() {
        tabBar.unselectedItemTintColor = .gray
        tabBar.tintColor = .label
    }
        
    // MARK: - Helper Functions
    
    private func embedToNav(_ viewController: UIViewController) -> UINavigationController {
        return UINavigationController(rootViewController: viewController)
    }
    
    private func getIndexOfEmbedeWithNavVC(with viewController: UIViewController) -> Int? {
        viewControllers?.firstIndex(where: {
            isControllersTypeEqual(firstController: $0, secondController: viewController)
        })
    }
    
    private func isControllersTypeEqual(firstController: UIViewController, secondController: UIViewController) -> Bool {
        guard let firstVC = extractLastViewControllerIfItIsNav(viewController: firstController),
              let secondVC = extractLastViewControllerIfItIsNav(viewController: secondController) else { return false }
        
        return type(of: firstVC) == type(of: secondVC)
    }
    
    private func extractLastViewControllerIfItIsNav(viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? UINavigationController else {
            return viewController
        }
        
        return vc.viewControllers.last
    }
}
