//
//  chatAppApp.swift
//  chatApp
//
//  Created by Djino Dissingar on 19/04/2022.
//

import SwiftUI

@main
struct chatAppApp: App {
    var authentifcation = FirebaseManager.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
