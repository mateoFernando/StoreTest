//
//  StoreDetailPresenter.swift
//  StoreTest
//
//  Created by Fernando y Nadia on 2/13/20.
//  Copyright © 2020 VotoResponsable. All rights reserved.
//

import Foundation

protocol StoreDetailPresentation {
    
    func onFetchThumbnail(imageName: String, completion: @escaping (Data) -> Void ) -> Void
}

class StoreDetailPresenter {
    
    weak var view: StoreDetailView?
    var router: StoreDetailRouting
    typealias UseCase = (
        fetchThumbnail: (_ imageName: String, _ completion: @escaping ImageClosure) -> (Void),
        fetchNothing: (_ completion: @escaping StoreClosure) -> (Void)
    )
    var useCase: UseCase?
    
    init(view: StoreDetailView, router: StoreDetailRouting, useCase: StoreDetailPresenter.UseCase
    ) {
        self.router = router
        self.view = view
        self.useCase = useCase
    }
}

extension StoreDetailPresenter: StoreDetailPresentation {
    
    func onFetchThumbnail(imageName: String, completion: @escaping (Data) -> Void) {
        DispatchQueue.main.async {
            self.useCase?.fetchThumbnail(imageName) { data in
                guard let data = data else { return }
                completion(data)
            }
        }
    }
}
