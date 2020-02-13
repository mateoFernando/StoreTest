//
//  ListStoreModuleBuilder.swift
//  StoreTest
//
//  Created by Fernando y Nadia on 2/13/20.
//  Copyright © 2020 VotoResponsable. All rights reserved.
//
import UIKit
import Foundation

class ListStoreModuleBuilder {
    
    static func build() -> UIViewController {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ListStoreViewController") as! ListStoreViewController
        let interactor = ListStoreInteractor(service: StoresService.shared)
        let router = ListStoreRouter(view:view)
        let presenter = ListStorePresenter(view: view, interactor: interactor, router: router,useCase:(
            fetchStores: interactor.fetchStores,
            fetchNothing: interactor.fetchNothing)
        )
        view.presenter = presenter
        return view
    }

}
