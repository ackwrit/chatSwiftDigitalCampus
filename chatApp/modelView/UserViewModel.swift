//
//  UserViewModel.swift
//  chatApp
//
//  Created by Djino Dissingar on 25/04/2022.
//

import Foundation
import Firebase

class UserViewModel : ObservableObject{
    @Published var user : AppUser?
    var manager  = FirebaseManager.shared
    
    
    
    //Initialisation
    init(id : String){
        getUserWithId(id: id)
        
    }
    
    
    
    //Récuperer l'utilisateur
    
    func getUserWithId(id : String){
        manager.userRef.document(id).addSnapshotListener(resultat)
    }
    
    
    func resultat(snapshot : DocumentSnapshot? , error : Error?){
        DispatchQueue.main.async {
            guard let snap = snapshot else {return }
            let id  = snap.documentID
            let datas = snap.data() ?? [:]
            let newUser = AppUser(id: id, dict: datas)
            self.user = newUser
            
        }
    }
    
}
