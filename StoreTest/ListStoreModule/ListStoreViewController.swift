//
//  ListStoreViewController.swift
//  StoreTest
//
//  Created by Fernando y Nadia on 2/13/20.
//  Copyright © 2020 VotoResponsable. All rights reserved.
//

import UIKit

protocol ListStoreView: class {
}

class ListStoreViewController: UIViewController {

    var presenter: ListStorePresentation!
    var listOfStores : [StoreEntity] = []
    @IBOutlet var stores: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.fetchStores { stores in
            self.listOfStores = stores
            self.stores.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.listOfStores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let store = listOfStores[indexPath.row]
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = store.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let store = listOfStores[indexPath.row]
        self.presenter.onDetailOfStoreSelection(candidate: store)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
}

extension ListStoreViewController : ListStoreView {
    
}
