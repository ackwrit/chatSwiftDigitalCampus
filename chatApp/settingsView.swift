//
//  settingsView.swift
//  chatApp
//
//  Created by Djino Dissingar on 25/04/2022.
//

import SwiftUI

struct settingsView: View {
    @StateObject var userVm : UserViewModel
    @State var nom : String = ""
    @State var prenom : String = ""
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
                        Text(userVm.user?.fullName ?? "")
                    }
                    .frame(height:40)
                    Avatar(size: 80)
                        .padding(.horizontal)
                }
                
                Divider()
                List {
                    Section("INFOS") {
                       

                        // Changement de nom
                        HStack{
                            TextField(userVm.user?.lastName ?? "", text: $nom)
                                .textFieldStyle(.roundedBorder)
                            Spacer()
                            Button {
                                if(nom != ""){
                                    let dict :[String:Any] = [LASTNAME : nom]
                                    FirebaseManager.shared.UpdateUserFirebase(uid:userVm.user?.id ?? "", datas: dict)
                                    self.nom = ""
                                    
                                }
                                
                                
                                
                            } label: {
                                Image(systemName: "plus")
                            }

                            
                        }
                       
                        //Changement de prénom
                        HStack {
                            TextField(userVm.user?.name ?? "", text: $prenom)
                                .textFieldStyle(.roundedBorder)
                            Spacer()
                            Button {
                                if(prenom != ""){
                                    let dict :[String:Any] = [NAME : prenom]
                                    FirebaseManager.shared.UpdateUserFirebase(uid:userVm.user?.id ?? "", datas: dict)
                                    self.prenom = ""
                                    
                                }

                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                      
                    }
                    Section("APP_SETTINGS") {
                        settingsRow(imageName: "paperplane", title: "Envoi", color: .purple
                        )
                        settingsRow(imageName: "bell", title: "Notifications", color: .red)
                        settingsRow(imageName: "shield", title: "Confidentialité", color: .green)
                    }
                    Section("SETTINGS") {
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
        settingsView(userVm: UserViewModel.init(id: FirebaseManager.shared.myId()))
    }
}
