//
//  MainTabBarBuilder.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 13.12.2021.
//

import UIKit

protocol MainTabBarBuilderProtocol {
    var launchesBuilder: LaunchesBuilderProtocol { get set }
    var capsulesBuilder: CapsulesBuilderProtocol { get set }
    
    init(
        launchesBuilder: LaunchesBuilderProtocol,
        capsulesBuilder: CapsulesBuilderProtocol
    )
}

class MainTabBarBuilder: MainTabBarBuilderProtocol {
    var launchesBuilder: LaunchesBuilderProtocol
    var capsulesBuilder: CapsulesBuilderProtocol
    
    required init(
        launchesBuilder: LaunchesBuilderProtocol = LaunchesBuilder(),
        capsulesBuilder: CapsulesBuilderProtocol = CapsulesBuilder()
    ) {
        self.launchesBuilder = launchesBuilder
        self.capsulesBuilder = capsulesBuilder
    }
}
