//
//  ListStoreRouter.swift
//  StoreTest
//
//  Created by Fernando y Nadia on 2/13/20.
//  Copyright © 2020 VotoResponsable. All rights reserved.
//

import UIKit

protocol ListStoreRouting {
    
    func routeToDetailOfStore(store: StoreEntity) -> Void
}

class ListStoreRouter {
    var viewController: UIViewController
    
    init(view: UIViewController) {
        self.viewController = view
    }
}

extension ListStoreRouter : ListStoreRouting {
    func routeToDetailOfStore(store: StoreEntity) {
        
        let detailOfStoreViewController = StoreDetailModuleBuilder.build(store: store)
        self.viewController.navigationController?.pushViewController(detailOfStoreViewController, animated: true)
    }
}
