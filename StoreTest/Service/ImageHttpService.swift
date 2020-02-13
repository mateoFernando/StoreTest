//
//  ImageHttpService.swift
//  BelatrixChallenge
//
//  Created by Fernando y Nadia on 10/23/19.
//  Copyright © 2019 Fer. All rights reserved.
//

import Alamofire
import AlamofireImage

final class ImageHttpService : HttpService {
    
    var sessionManager: SessionManager = SessionManager.default
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        return sessionManager.request(urlRequest).validate(statusCode: 200..<400)
    }
}
