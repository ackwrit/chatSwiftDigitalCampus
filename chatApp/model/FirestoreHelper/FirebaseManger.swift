//
//  FirebaseManger.swift
//  chatApp
//
//  Created by Djino Dissingar on 19/04/2022.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage

class FirebaseManager {
    
    //Attributs
    static let shared = FirebaseManager()
    var auth : Auth
    var cloudFirestore : Firestore
    var storage : Storage
    
    var userRef : CollectionReference {
        return cloudFirestore.collection(USERS)
    }
    
    
    
    
    
    //Constructeur
    init(){
        FirebaseApp.configure()
        auth = Auth.auth()
        storage = Storage.storage()
        cloudFirestore = Firestore.firestore()
    }
    
    
    //Ajouter nos utilisatuers dans la base donnée
    func createUserFirebase(uid : String, datas : [String:Any]){
        let doc = userRef.document(uid)
        doc.setData(datas)
    }
    
   
}
