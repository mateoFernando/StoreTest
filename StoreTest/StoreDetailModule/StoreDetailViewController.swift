//
//  StoreDetailViewController.swift
//  StoreTest
//
//  Created by Fernando y Nadia on 2/13/20.
//  Copyright © 2020 VotoResponsable. All rights reserved.
//

import UIKit

protocol StoreDetailView: class {
}


class StoreDetailViewController: UIViewController {

    var presenter: StoreDetailPresentation!
    var store: StoreEntity!
    
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        address.text = store.address
        phoneNumber.text = store.phone
        
        DispatchQueue.global(qos: .background).async {
            self.presenter.onFetchThumbnail(imageName: self.store.storeLogoURL!, completion: { data in
                self.logo.image = UIImage(data: data)
            })
        }
    }
}

extension StoreDetailViewController : StoreDetailView {
    
}
