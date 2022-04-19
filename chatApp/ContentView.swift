//
//  ContentView.swift
//  chatApp
//
//  Created by Djino Dissingar on 19/04/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authVm = AuthViewModel.init()
    @State var tag : Int = 0
    @State var mail : String = ""
    @State var name : String = ""
    @State var lastName : String = ""
    @State var password : String = ""
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Picker("Choix de compte", selection: $tag) {
                        Text("Connexion").tag(0)
                        Text("Inscription").tag(1)
                    }
                    .pickerStyle(.segmented)
                    VStack{
                        if(tag == 1){
                            TextField("Entrer votre prénom", text: $name)
                                .textFieldStyle(.roundedBorder)
                            TextField("Entrer votre nom", text: $lastName)
                                .textFieldStyle(.roundedBorder)
                        }
                    TextField("Entrer votre mail", text: $mail)
                            .textFieldStyle(.roundedBorder)
                        SecureField("Entrer votre mot de passe", text: $password)
                            .textFieldStyle(.roundedBorder)
                        Button {
                            if(tag==0){
                                authVm.signIn(mail: mail, password: password)
                            }
                            else{
                                authVm.signUp(name: name, lastName: lastName, mail: mail, password: password)
                            }
                        } label: {
                            Text("Valider")
                        }
                        .padding()
                        .background(Color.indigo)
                        .foregroundColor(Color.white)
                        .cornerRadius(15)
                    

                    }
                }
                .padding()
            }
            
            .animation(.easeIn,value: tag)
            .navigationTitle("Mon App Chat")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
