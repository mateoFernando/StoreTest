//
//  StoreEntity.swift
//  StoreTest
//
//  Created by Fernando y Nadia on 2/13/20.
//  Copyright © 2020 VotoResponsable. All rights reserved.
//

struct StoreEntity : Codable {
    let address : String?
    let city : String?
    let name : String?
    let latitude : String?
    let zipcode : String?
    let storeLogoURL : String?
    let phone : String?
    let longitude : String?
    let storeID : String?
    let state : String?
    
    private enum CodingKeys: String, CodingKey {
        case address
        case city
        case name
        case latitude
        case zipcode
        case storeLogoURL
        case phone
        case longitude
        case storeID
        case state
    }
}
