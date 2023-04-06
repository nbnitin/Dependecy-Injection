//
//  UserModel.swift
//  DependencyInjectionDemo
//
//  Created by Nitin Bhatia on 01/04/23.
//

import Foundation


struct UserModel : Decodable {
    let id : Int?
    let name, username, email, phone, website : String?
    let address : Address?
    let company : Company?
}


struct Address : Decodable {
    let street, suite, city, zipcode : String?
    let geo : Geo?
}


struct Geo : Decodable {
    let lat, lng : String?
}

struct Company : Decodable {
    let name, catchPhrase, bs : String?
}
