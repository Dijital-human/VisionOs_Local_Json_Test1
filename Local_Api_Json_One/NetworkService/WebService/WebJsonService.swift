//
//  WebJsonService.swift
//  Local_Api_Json_One
//
//  Created by Famil Mustafayev on 25.06.24.
//

import Foundation

class WebJsonService: Codable, NetworkProtocol{
    func DownloadData<T>(fromUrl: String) async -> T? where T : Decodable, T : Encodable {
        do{
            guard let url = URL(string: fromUrl) else {throw NetworkError.badUrl }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
            guard response.statusCode > 199 && response.statusCode < 300 else { throw NetworkError.badResponse }
            guard let decodeData = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.BadData }
            return decodeData
            
        }catch NetworkError.badUrl{
            print("Bad Url")
        }catch NetworkError.badResponse{
            print("Bad Response")
        }catch{
            print("Bad Data")
        }
        return nil
    }
    
    var type: String = "WebJsonService"
    
    
}
