//
//  HttpRouter.swift
//  BelatrixChallenge
//
//  Created by Fer on 20/10/2019.
//  Copyright © 2019 Fer. All rights reserved.
//

import Alamofire

protocol HttpRouter: URLRequestConvertible  {
    
    var baseUrlString : String { get }
    var path : String { get }
    var method : HTTPMethod { get }
    var headers : HTTPHeaders? { get }
    var parameters : Parameters? { get }
    func body() throws -> Data?
    
    func request(usingHttpService service: HttpService) throws -> DataRequest
}


extension HttpRouter {
    
    var parameter: Parameters? { return nil }
    
    func body() throws -> Data? { return nil }
    
    func asURLRequest() throws -> URLRequest {
        
        var url = try baseUrlString.asURL()
        if path != "" {
            url.appendPathComponent(path)
        }
        
        var request = try URLRequest(url: url, method: method, headers: headers)
        request.httpBody = try body()
        request = try URLEncoding.default.encode(request, with: parameters)
        return request
    }
    
    func request(usingHttpService service: HttpService) throws -> DataRequest {
        
        return try service.request(asURLRequest())
    }
    
}
