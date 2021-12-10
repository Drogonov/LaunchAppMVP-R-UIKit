//
//  DataFetcher.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 10.12.2021.
//

import Foundation
import Alamofire

struct Constants {
    static let baseURL: String = "https://api.spacexdata.com/v3"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case string = "String"
    
}

enum ContentType: String {
    case json = "Application/json"
    case formEncode = "application/x-www-form-urlencoded"
}

enum RequestParams {
    case body(_:Parameters)
    case url(_:Parameters)
}

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams { get }
}

enum APIRouter: APIConfiguration {
    
    case login(username:String, password:String)
    case getUserDetails
    case capsule
  
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .getUserDetails:
            return .get
        case .capsule:
            return .get
        }
    }
    // MARK: - Parameters
     var parameters: RequestParams {
        switch self {
        case .login(let username, let password):
            return .body(["username":username,"password":password])
        case .getUserDetails:
            return .body([:])
        case .capsule:
            return .body([:])
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .login:
            return "/loginEndpoint"
        case .getUserDetails:
            return "/userDetailEndpoint"
        case .capsule:
            return "/capsule"
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        switch parameters {
            
        case .body(let params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            
        case .url(let params):
                let queryParams = params.map { pair  in
                    return URLQueryItem(name: pair.key, value: "\(pair.value)")
                }
                var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
                components?.queryItems = queryParams
                urlRequest.url = components?.url
        }
            return urlRequest
    }
}

struct Capsule: Codable {
    var capsule_serial: String = ""
}

struct CapsuleResponse: Codable {
    let capsuleArray: [Capsule]
    
    enum CodingKeys: String, CodingKey {
        case capsuleArray = ""
    }
}
