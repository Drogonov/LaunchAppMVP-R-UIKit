//
//  MainViewController.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 10.12.2021.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
        loadData()
    }
    
    func loadData() {
        AF.request(APIRouter.login(username:"michael",password:"123")
                    .responseDecodable { (response: DataResponse<LoginResponse, AFError>) in
            switch response.result {
            case .success(let response): break
                //You can handle 'response' when request success (response as LoginResponse)
            case .failure(let error):
                break
            }
        })
    }
}

struct LoginResponse : Codable {
   
    let token : String?
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
    }
}
