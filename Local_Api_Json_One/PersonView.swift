//
//  PersonView.swift
//  Local_Api_Json_One
//
//  Created by Famil Mustafayev on 25.06.24.
//

import SwiftUI

struct PersonView: View {
    @State var text: String = ""
    @ObservedObject var jsonProvider: JSONProvider = JSONProvider()
    var body: some View {
        VStack {
            
            TextField("Placeholder", text: $text)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(15)
                .padding(.horizontal)
                

            Text("Hello, world! \(jsonProvider.personContainer.person?.name ?? "")")
                .padding()
            
            Button(action: {
                jsonProvider.personContainer.person?.name = text
                jsonProvider.writeToFile(location: jsonProvider.subUrl!)
            }) {
                Text("Button")
            }
        }
        .onAppear {
            Task{
                jsonProvider.getData()
            }
        }
    }
}
#Preview(windowStyle: .automatic) {
    PersonView()
}
