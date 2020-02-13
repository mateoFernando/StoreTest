//
//  StoreDetailRouter.swift
//  StoreTest
//
//  Created by Fernando y Nadia on 2/13/20.
//  Copyright © 2020 VotoResponsable. All rights reserved.
//

import UIKit

protocol StoreDetailRouting {    
}

class StoreDetailRouter {
    var viewController: UIViewController
    
    init(view: UIViewController) {
        self.viewController = view
    }
}

extension StoreDetailRouter : StoreDetailRouting {
    
}
