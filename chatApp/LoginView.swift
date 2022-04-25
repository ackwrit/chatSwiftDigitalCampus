//
//  LoginView.swift
//  chatApp
//
//  Created by Djino Dissingar on 25/04/2022.
//

import SwiftUI

struct LoginView: View {
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
                    
                    Picker("ACCOUNT", selection: $tag) {
                        Text("SIGNUP").tag(0)
                        Text("SIGNIN").tag(1)
                    }
                    .pickerStyle(.segmented)
                    VStack{
                        if(tag == 1){
                            TextField("ENTER_NAME", text: $name)
                                .textFieldStyle(.roundedBorder)
                            TextField("ENTER_LASTNAME", text: $lastName)
                                .textFieldStyle(.roundedBorder)
                        }
                        TextField("ENTER_MAIL", text: $mail)
                            .textFieldStyle(.roundedBorder)
                        SecureField("ENTER_PASSWORD", text: $password)
                            .textFieldStyle(.roundedBorder)
                        Button {
                            if(tag==0){
                                authVm.signIn(mail: mail, password: password)
                            }
                            else{
                                authVm.signUp(name: name, lastName: lastName, mail: mail, password: password)
                            }
                        } label: {
                            Text("VALIDATE")
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


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
