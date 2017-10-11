//
//  Router.swift
//  FoodKingdom
//
//  Created by specktro on 3/10/17.
//  Copyright © 2017 specktro corp. All rights reserved.
//

import Alamofire

public protocol Router {
    var baseURL: String { get }
    var endPoint: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
    var authField: String? { get }
}

public protocol Routable: Router, URLRequestConvertible {}

public extension Routable {
    var parameters: Parameters? {
        return nil
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var authField: String? {
        return nil
    }
    
    func asURLRequest() throws -> URLRequest {
        var url = try baseURL.asURL()
        url.appendPathComponent(endPoint)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        if let hFields = headers {
            for (header, value) in hFields {
                urlRequest.setValue(value, forHTTPHeaderField: header)
            }
        }
        
        if let auth = authField {
            urlRequest.setValue(auth, forHTTPHeaderField: "Authorization")
        }
        
        switch method {
        case .post, .put:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        default:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
}
