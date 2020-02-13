//
//  ListStorePresenter.swift
//  StoreTest
//
//  Created by Fernando y Nadia on 2/13/20.
//  Copyright © 2020 VotoResponsable. All rights reserved.
//

import Foundation

protocol ListStorePresentation {
    
    func onDetailOfStoreSelection(candidate: StoreEntity) -> Void
    func fetchStores(completion: @escaping StoreClosure) -> (Void)
}

class ListStorePresenter {
    
    weak var view: ListStoreView?
    var interactor: ListStoreUseCase
    var router: ListStoreRouting
    typealias UseCase = (
        fetchStores: (_ completion: @escaping StoreClosure) -> (Void),
        fetchNothing: (_ completion: @escaping StoreClosure) -> (Void)
    )
    var useCase: UseCase?
    
    init(view: ListStoreView, interactor: ListStoreUseCase, router: ListStoreRouting, useCase: ListStorePresenter.UseCase
    ) {
        self.interactor = interactor
        self.router = router
        self.view = view
        self.useCase = useCase
    }
    
    
}

extension ListStorePresenter: ListStorePresentation {
    func onDetailOfStoreSelection(candidate: StoreEntity) {
        
        self.router.routeToDetailOfStore(store: candidate)
    }
    
    func fetchStores(completion: @escaping StoreClosure) {
        DispatchQueue.main.async {
            
            self.useCase?.fetchStores(){ stores in
                completion(stores)
            }
        }
    }
}
