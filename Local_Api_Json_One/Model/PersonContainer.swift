//
//  Person.swift
//  Local_Api_Json_One
//
//  Created by Famil Mustafayev on 25.06.24.
//

import Foundation

struct PersonContainer: Codable {
    var person: Person?
}

struct Person: Codable {
    var name: String?
}
