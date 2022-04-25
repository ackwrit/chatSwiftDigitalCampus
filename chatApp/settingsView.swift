//
//  settingsView.swift
//  chatApp
//
//  Created by Djino Dissingar on 25/04/2022.
//

import SwiftUI

struct settingsView: View {
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment:.bottomLeading){
                    
                    VStack {
                        Image("background_settings")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height:200)
                        .clipped()
                    }
                    HStack {
                        Spacer(minLength: 80)
                        Text("Ici on va indiquer le nom de l'utilisateur")
                    }
                    .frame(height:40)
                    Avatar(size: 80)
                        .padding(.horizontal)
                }
                
                Divider()
                List {
                    Section("Infos") {
                      
                    }
                    Section("Réglages App") {
                        settingsRow(imageName: "paperplane", title: "Envoi", color: .purple
                        )
                        settingsRow(imageName: "bell", title: "Notifications", color: .red)
                        settingsRow(imageName: "shield", title: "Confidentialité", color: .green)
                    }
                    Section("Paramètres") {
                        settingsRow(imageName: "doc", title: "Mentions Légales", color: .gray)
                        settingsRow(imageName: "gear", title: "Paramètres du compte", color: .gray)
                        settingsRow(imageName: "questionMark", title: "Aides", color: .blue)
                        settingsRow(imageName: "lock.shield", title: "Se déconnecter", color: .red)
                        
                    }
                }
                .listStyle(.insetGrouped)
                Spacer()
            
            }.edgesIgnoringSafeArea(.top)
        }
        
        
        
    }
}

struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        settingsView()
    }
}
