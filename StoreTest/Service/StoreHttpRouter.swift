//
//  MovieHttpRouter.swift
//  BelatrixChallenge
//
//  Created by Fer on 20/10/2019.
//  Copyright © 2019 Fer. All rights reserved.
//

import Alamofire

enum StoreHttpRouter {
    case fetchStores
    case downloadThumbnail(imageURL:String)
}

extension StoreHttpRouter : HttpRouter {
    
    var baseUrlString: String {
        switch self {
        case .fetchStores:
            return "http://sandbox.bottlerocketapps.com/BR_Android_CodingExam_2015_Server/"
        default:
            return ""
        }
    }
    
    var path: String {
        switch (self) {
        case .fetchStores:
            return "stores.json"
        case .downloadThumbnail:
            return ""
        }

    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .fetchStores:
            return [
                "Content-Type" : "application/json; charset=utf-8"
            ]
        default:
            return [
                "Content-Type" : "application/json",
                "trakt-api-version" : "2",
                "trakt-api-key" : "e674d0e14d4c2c5557db80b92120511bdac61bb3bebf228adfb258a7c861d71d"
            ]
        }
        
        
    }
    
    var parameters: Parameters? {
        switch self {
        case .fetchStores:
            return nil
        default:
            return nil
        }
    }
    
    
    
}
