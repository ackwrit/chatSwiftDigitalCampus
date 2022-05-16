//
//  HomeTabView.swift
//  chatApp
//
//  Created by Djino Dissingar on 25/04/2022.
//

import SwiftUI

struct HomeTabView: View {
    @StateObject var userVm : UserViewModel = UserViewModel.init(id: FirebaseManager.shared.myId())
    @StateObject var all = AllUsersViewModel()
    
    @State var index : Int = 0
    var body: some View {
        TabView(selection: $index) {
            Text("Message récents").tabItem {
                Text("Message")
                Image(systemName: "message.fill")
            }.tag(0)
            ContactListView(allUsersVm: all).tabItem {
                Text("Contacts")
                Image(systemName: "person.circle.fill")
            }.tag(1)
            
            settingsView(userVm: userVm).tabItem {
                Text("SETTINGS")
                Image(systemName: "gear")
            }.tag(2)
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
