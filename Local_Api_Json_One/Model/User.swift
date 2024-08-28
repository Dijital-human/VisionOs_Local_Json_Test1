//
//  User.swift
//  Local_Api_Json_One
//
//  Created by Famil Mustafayev on 25.06.24.
//

import Foundation

class User: Codable, Identifiable{
    let userId: Int
    let id:     Int
    var title:  String
    let body:   String
}

