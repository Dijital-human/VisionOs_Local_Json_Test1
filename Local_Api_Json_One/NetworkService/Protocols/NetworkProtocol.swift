//
//  NetworkProtocol.swift
//  Local_Api_Json_One
//
//  Created by Famil Mustafayev on 25.06.24.
//

import Foundation

protocol NetworkProtocol{
    func DownloadData <T: Codable> (fromUrl: String)async -> T?
    var type: String{ get }
}
