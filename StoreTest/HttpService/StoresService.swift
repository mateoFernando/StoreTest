//
//  StoresService.swift
//  StoreTest
//
//  Created by Fernando y Nadia on 2/13/20.
//  Copyright © 2020 VotoResponsable. All rights reserved.
//

import Alamofire


class StoresService {
    private lazy var httpService = StoreHttpService()
    static let shared : StoresService = StoresService()
}

extension StoresService : StoresAPI {
    
    func fetchStores(completion: @escaping StoreClosure) {
        
        do {
            try StoreHttpRouter
                .fetchStores
                .request(usingHttpService: httpService)
                .responseJSON { (result) in
                    
                    let stores = StoresService.parseMovies(result: result)
                    completion(stores)
            }
        } catch  {
            print("Something went grong while fetching popular movies = \(error)")
        }
    }
}

extension StoresService {

    private static func parseMovies(result: DataResponse<Any>) -> [StoreEntity] {
        
        guard [200,201].contains(result.response?.statusCode), let data = result.data else { return [] }
        
        do {
            return try JSONDecoder().decode(Array<StoreEntity>.self, from: data)
        } catch  {
            print("Something went grong parsing movies = \(error)")
        }
        return []
    }
}

extension StoresService : ImagesAPI {

    func fetchThumbnail(imageName: String, completion: @escaping ImageClosure) {
        
        do {
            try StoreHttpRouter
                .downloadThumbnail(imageURL: imageName)
                .request(usingHttpService: httpService)
                .responseData(completionHandler: { (result) in
                    completion(result.data)
                })
        } catch  {
            print("Something went grong while fetching image! = \(error)")
        }
    }
    
    func fetchImage(imageName: String, completion: @escaping ImageClosure) {
        
        print("Hola Skeletito")
    }
    
    
}
