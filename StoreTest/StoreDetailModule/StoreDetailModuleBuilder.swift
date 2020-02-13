//
//  StoreDetailModuleBuilder.swift
//  StoreTest
//
//  Created by Fernando y Nadia on 2/13/20.
//  Copyright © 2020 VotoResponsable. All rights reserved.
//

import UIKit

class StoreDetailModuleBuilder {
    
    static func build(store: StoreEntity ) -> UIViewController {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "StoreDetailViewController") as! StoreDetailViewController
        view.store = store
        let imageInteractor = ImageInteractor(service: StoresService.shared)
        let router = StoreDetailRouter(view:view)
        let presenter = StoreDetailPresenter(view: view, router: router, useCase:(
            fetchNothing: imageInteractor.fetchNothing,
            fetchThumbnail: imageInteractor.fetchThumbnail
            )
        )
        view.presenter = presenter
        return view
    }
}
