//
//  ContactListView.swift
//  chatApp
//
//  Created by Djino Dissingar on 26/04/2022.
//

import SwiftUI

struct ContactListView: View {
    @StateObject var allUsersVm : AllUsersViewModel
    
    var body: some View {
        NavigationView{
            List{
                ForEach(allUsersVm.users){ user in
                    ContactViewRow(user: user)
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Contacts")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        

    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView(allUsersVm: AllUsersViewModel())
    }
}
