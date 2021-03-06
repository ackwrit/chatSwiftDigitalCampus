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
    var messageRef : CollectionReference {
        return cloudFirestore.collection(MESSAGE)
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
    
    
    //Mise à jour des informations de l'utilisateur
    func UpdateUserFirebase( uid : String , datas:[String:Any]){
        let doc = userRef.document(uid)
        doc.updateData(datas)
        
    }
    
    
    //Se deconnecter de l'application
    func logOut(){
        do {
            try auth.signOut()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func myId() -> String{
        return auth.currentUser?.uid ?? ""
    }
    
    
    func setupPath(exp: String ,dest : String) -> CollectionReference {
        let array = [exp,dest]
        let sortArray = array.sorted(by: {$0<$1})
        let first = sortArray[0]
        let second = sortArray[1]
        let ref = messageRef.document(first).collection(second)
        return ref
        
    }
    
    func sendMessage(exp : String,dest : String ,datas : [String:Any]){
        let newDoc = setupPath(exp: exp, dest: dest).document()
        newDoc.setData(datas)
    }
    
   
}
