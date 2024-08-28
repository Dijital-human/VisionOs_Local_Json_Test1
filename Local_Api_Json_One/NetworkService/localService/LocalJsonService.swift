//
//  LocalJsonService.swift
//  Local_Api_Json_One
//
//  Created by Famil Mustafayev on 25.06.24.
//

import Foundation

class LocalJsonService:Codable, NetworkProtocol{
    func DownloadData<T>(fromUrl: String) async -> T? where T : Decodable, T : Encodable {
        do{
            guard let url = Bundle.main.url(forResource: fromUrl, withExtension: "json") else { throw NetworkError.badUrl}
            guard let data = try? Data(contentsOf: url) else { throw NetworkError.BadData}
            let decodeData = try? JSONDecoder().decode(T.self, from: data)
            return decodeData
        }catch{
            print("Bad Data")
        }
        return nil
    }
    
    var type: String = "LocalJsonService"

}
