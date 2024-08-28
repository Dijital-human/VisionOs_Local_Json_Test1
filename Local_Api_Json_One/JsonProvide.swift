//
//  JsonProvide.swift
//  Local_Api_Json_One
//
//  Created by Famil Mustafayev on 25.06.24.
//

import Foundation
class JSONProvider: ObservableObject {
    
    @Published var personContainer: PersonContainer = PersonContainer()
    var fm = FileManager.default
    var fresult: Bool = false
    @Published var subUrl: URL? = URL(string: "")
    var mainUrl: URL? = Bundle.main.url(forResource: "user", withExtension: "json")
    
    func getData() {
        do {
            let documentDirectory = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            subUrl = documentDirectory.appendingPathComponent("user.json")
            loadFile(mainPath: mainUrl!, subPath: subUrl!)
        } catch {
            print(error)
        }
    }
    
    func loadFile(mainPath: URL, subPath: URL){
        if fm.fileExists(atPath: subPath.path){
            decodeData(pathName: subPath)
            
            if ((personContainer.person) != nil) {
                decodeData(pathName: mainPath)
            }
            
        }else{
            decodeData(pathName: mainPath)
        }
    }
    
    func decodeData(pathName: URL){
        do{
            let jsonData = try Data(contentsOf: pathName)
            let decoder = JSONDecoder()
            let personContainer = try decoder.decode(PersonContainer.self, from: jsonData)
            self.personContainer = personContainer
            
        } catch {}
    }
    
    func writeToFile(location: URL) {
        do{
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let JsonData = try encoder.encode(personContainer)
            try JsonData.write(to: location)
        } catch {
            
        }
    }
}
