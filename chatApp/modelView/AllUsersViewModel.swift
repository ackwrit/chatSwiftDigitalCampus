//
//  AllUsersViewModel.swift
//  chatApp
//
//  Created by Djino Dissingar on 26/04/2022.
//

import Foundation
import Firebase

class AllUsersViewModel : ObservableObject {
    @Published var users : [AppUser] = []
    var manager = FirebaseManager.shared
    
    
    init() {
        fecthAllUsers()
    }
    
    
    func fecthAllUsers(){
        self.manager.userRef.addSnapshotListener(result)
        
    }
    
    
    func result(query : QuerySnapshot? , error : Error?){
        self.users = []
        DispatchQueue.main.async {
            if let error = error {
                print(error.localizedDescription)
            }
            if let all = query?.documents{
                let myId = self.manager.myId()
                all.forEach { snapshot in
                    let id = snapshot.documentID
                    let dict = snapshot.data()
                    let user  = AppUser(id: id, dict: dict)
                    if(myId != id){
                        self.users.append(user)
                    }
                    
                    
                }
            }
        }
    }
    
}
