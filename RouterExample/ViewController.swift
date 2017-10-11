//
//  ViewController.swift
//  RouterExample
//
//  Created by specktro on 10/10/17.
//  Copyright © 2017 specktro. All rights reserved.
//

import UIKit
import Alamofire
import Router

enum UserRouter: Routable {
    var baseURL: String {
        return Bundle.main.object(forInfoDictionaryKey: "base_url") as! String
    }
    
    case register(Parameters)
    case login(Parameters)
    
    var endPoint: String {
        switch self {
        case .register:
            return "/accounts/signup"
        case .login:
            return "/accounts/signin"
        }
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    var parameters: Parameters? {
        switch self {
        case .register(let params),
             .login(let params):
            return params
        }
    }
}

class TestAPI {
    static let shared = TestAPI()
    
    private init() {}
    
    public func register() {
        let params: Parameters = ["email": "speck.legna@gmail.com", "password": "p455w0rD"]
        Alamofire.request(UserRouter.register(params)).validate().responseJSON { response in
            if response.result.isSuccess {
                if let JSON = response.result.value as? [String: Any] {
                    debugPrint(JSON)
                }
                else if let JSON = response.result.value as? [[String: Any]] {
                    debugPrint(JSON)
                }
                else {
                    debugPrint("Invalid JSON")
                }
            }
            else {
                if let error = response.result.error {
                    debugPrint(error.localizedDescription)
                }
                
                if let messageData = response.data {
                    do {
                        let errorJSON = try JSONSerialization.jsonObject(with: messageData, options: .allowFragments) as? [String: Any]
                        debugPrint(errorJSON!)
                    }
                    catch let error as NSError {
                        debugPrint(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    func login() {
        let params: Parameters = ["email": "speck.legna@gmail.com", "password": "p455w0rD"]
        Alamofire.request(UserRouter.login(params)).validate().responseJSON { response in
            if response.result.isSuccess {
                if let JSON = response.result.value as? [String: Any] {
                    debugPrint(JSON)
                }
                else if let JSON = response.result.value as? [[String: Any]] {
                    debugPrint(JSON)
                }
                else {
                    debugPrint("Invalid JSON")
                }
            }
            else {
                if let error = response.result.error {
                    debugPrint(error.localizedDescription)
                }
                
                if let messageData = response.data {
                    do {
                        let errorJSON = try JSONSerialization.jsonObject(with: messageData, options: .allowFragments) as? [String: Any]
                        debugPrint(errorJSON!)
                    }
                    catch let error as NSError {
                        debugPrint(error.localizedDescription)
                    }
                }
            }
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        TestAPI.shared.login()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

