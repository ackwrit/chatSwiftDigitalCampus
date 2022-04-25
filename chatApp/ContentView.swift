//
//  ContentView.swift
//  chatApp
//
//  Created by Djino Dissingar on 19/04/2022.
//

import SwiftUI




struct ContentView: View {
    @StateObject var authVm : AuthViewModel = AuthViewModel.init()
   
    var body: some View {
        if(authVm.isFinished){
            if(authVm.isAuth){
                HomeTabView()
            }
            else{
                LoginView()
            }
        }
        else{
            Text("En attente de connexion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
