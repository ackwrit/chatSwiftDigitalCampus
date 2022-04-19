//
//  authViewModel.swift
//  chatApp
//
//  Created by Djino Dissingar on 19/04/2022.
//

import Foundation
import Firebase

class AuthViewModel : ObservableObject {
    //Attributs
    var manager = FirebaseManager.shared
    @Published var isFinished : Bool  = false
    @Published var isAuth : Bool = false
    @Published var showError : Bool = false
    var errorString : String = ""
    var datas : [String: Any] = [:]
    var auth : Auth {
        return manager.auth
    }
    
    
    //Constructeur
    init(){
        observeAuthentification()
    }
    
    
    //Méthode
    func observeAuthentification (){
        auth.addStateDidChangeListener(handleChangeListener)
    }
    
    
    func handleChangeListener(auth : Auth , user : User?){
        self.isFinished = true
        self.isAuth = user != nil
        
    }
    
    func signIn(mail : String , password : String){
        guard checkValue(mail,value : "votre mail") else {return}
        guard checkValue(password, value: "votre mot de passe") else{return }
       
        
        auth.signIn(withEmail: mail, password: password,completion:completionAuth)
                
    }
    
    func completionAuth(result : AuthDataResult?,error : Error?){
        if let error = error {
            self.errorString = error.localizedDescription
            self.showError = true
            return
        }
        if let data = result {
            let user = data.user
            let uid = user.uid
            if(!datas.isEmpty){
                manager.createUserFirebase(uid: uid, datas: datas)
            }
        }
        
    }
    
    func signUp(name : String , lastName : String ,mail : String , password : String){
        guard checkValue(name, value: "votre prénom") else {return }
        guard checkValue(lastName, value: "votre nom") else {return }
        guard checkValue(mail, value: "votre mail") else {return }
        guard checkValue(password, value: "votre mot de passe") else {return }
        datas = [
            "EMAIL": mail,
            "NOM" : lastName,
            "PRENOM" : name
        ]
        auth.createUser(withEmail: mail, password: password,completion: completionAuth)
        //Ajouter dans la base de donnée
        
        
    }
    
    func checkValue( _ str : String , value : String) -> Bool {
        let isNotEmpty = str != ""
        self.errorString = !isNotEmpty ? "" : "Merci d'entrer \(value) pour continuer"
        self.showError = !isNotEmpty
        return isNotEmpty
    }
}
