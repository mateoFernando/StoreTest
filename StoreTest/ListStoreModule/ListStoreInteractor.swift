//
//  ListStoreInteractor.swift
//  StoreTest
//
//  Created by Fernando y Nadia on 2/13/20.
//  Copyright © 2020 VotoResponsable. All rights reserved.
//


protocol ListStoreUseCase {
}

class ListStoreInteractor {
    
    var service : StoresAPI

    init(service: StoresAPI) {
        self.service = service
    }
    
}

extension ListStoreInteractor : ListStoreUseCase {
    
    func fetchStores(completion: @escaping StoreClosure) -> (Void) {    
        self.service.fetchStores(completion: completion)
    }
    
    func fetchNothing(completion: @escaping StoreClosure) -> (Void) {
    }
}
