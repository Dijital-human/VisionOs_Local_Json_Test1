//
//  Local_Api_Json_OneApp.swift
//  Local_Api_Json_One
//
//  Created by Famil Mustafayev on 25.06.24.
//

import SwiftUI

@main
struct Local_Api_Json_OneApp: App {
    var body: some Scene {
        WindowGroup {
            PersonView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
