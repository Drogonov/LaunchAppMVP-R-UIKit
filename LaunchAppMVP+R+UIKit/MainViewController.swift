//
//  MainViewController.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 10.12.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
//        loadCapsuleData()
        loadLaunchData()
    }
    
    func loadCapsuleData() {
        let repository = SpaceXDataRepository()
        repository.getCapsulesList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let capsulesResponse):
                debugPrint("capsules fetched")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadLaunchData() {
        let repository = SpaceXDataRepository()
        repository.getLaunchesList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let launchesResponse):
                debugPrint("launches fetched")
            case .failure(let error):
                print(error)
            }
        }
    }
}
