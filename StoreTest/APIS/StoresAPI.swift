//
//  StoresAPI.swift
//  StoreTest
//
//  Created by Fernando y Nadia on 2/13/20.
//  Copyright © 2020 VotoResponsable. All rights reserved.
//

typealias StoreClosure = ([StoreEntity]) -> (Void)

protocol StoresAPI {
    
    func fetchStores(completion: @escaping StoreClosure) -> (Void)
}
