//
//  SpaceXDataAPI.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 10.12.2021.
//

import Foundation
import Moya

struct Constants {
    static let baseUrlString = "https://api.spacexdata.com/v3"
    static let baseURL: URL = {
        URL(string: baseUrlString)!
    }()
}



enum SpaceXDataAPI {
    case getCapsules
    case getLaunches
}

extension SpaceXDataAPI: TargetType {
    var baseURL: URL {
        Constants.baseURL
    }
    
    var path: String {
        switch self {
        case .getCapsules:
            return "/capsules"
        case .getLaunches:
            return "/launches"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCapsules,
             .getLaunches:
            return .get
        }
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        default: return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        nil
    }
}
