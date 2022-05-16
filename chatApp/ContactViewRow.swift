//
//  ContactViewRow.swift
//  chatApp
//
//  Created by Djino Dissingar on 26/04/2022.
//

import SwiftUI

struct ContactViewRow: View {
    var user : AppUser
    var body: some View {
        
        NavigationLink {
            ChatMessage(dest: user)
        } label: {
            HStack(alignment: .center) {
                //Avatar
                Avatar(size: 50)
                
                
                Spacer()
                
                
                // Nom complet
                VStack {
                    Text(user.fullName)
                    Text(user.mail ?? "")
                }
                Spacer()
            }
        }
       

       
    }
}

struct ContactViewRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactViewRow(user : AppUser(id: "", dict: [:]))
    }
}
