//
//  ContentView.swift
//  Local_Api_Json_One
//
//  Created by Famil Mustafayev on 25.06.24.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var vm = ViewModel(service: LocalJsonService())
    @State var title: String = ""
    var body: some View {
        NavigationSplitView {
            List{
                ForEach(vm.userData){user in
                    NavigationLink {
                        VStack{
                            VStack{
                                TextField(text: $title) {
                                    Text("Add title")
                                }.textFieldStyle(.roundedBorder)
                                Button(action: {}, label: {
                                    Text("Save").foregroundStyle(.blue)
                                })
                            }.padding(30)
                            Text("\(user.userId)").padding().overlay(){
                                Circle().stroke(.red)
                            }
                            Text(user.title).foregroundStyle(.red).font(.largeTitle)
                            Text(user.body).font(.title).fontDesign(.serif)
                            
                        }
                    } label: {
                        HStack{
                            Text("\(user.id)").padding().overlay {
                                Circle().stroke(.blue)
                            }
                            Text(user.title).lineLimit(2).font(.headline).fontWidth(.compressed).fontDesign(.serif).fontWeight(.regular)
                        }
                    }

                    
                    
                }
            }
            .onAppear(){
                if vm.userData.isEmpty{
                    Task{
                        await vm.fetchData()
                    }
                }
            }
            .navigationTitle("User")
        } detail: {
            
        }

    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
