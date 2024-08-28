//
//  ViewModel.swift
//  Local_Api_Json_One
//
//  Created by Famil Mustafayev on 25.06.24.
//

import Foundation

@MainActor class ViewModel: ObservableObject{
    @Published var userData = [User]()
    private var service: NetworkProtocol
    init(service: NetworkProtocol){
        self.service = service
    }
    
    func fetchData() async {
        var resourse = ""
        if service.type == "WebService"{
            resourse =  Constant.WebService.baseWUrl
        }else if service.type == "LocalService"{
            resourse =  Constant.LocalService.baseUrl

        }
        guard let downloadedPosts: [User] = await service.DownloadData(fromUrl: resourse) else {return}
        userData = downloadedPosts
    }
}
