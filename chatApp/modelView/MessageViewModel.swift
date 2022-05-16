//
//  MessageViewModel.swift
//  chatApp
//
//  Created by Djino Dissingar on 10/05/2022.
//

import Foundation
import Firebase

class MessageViewModel : ObservableObject{
    @Published var messages : [Message] = []
    @Published var text = ""
    var manager = FirebaseManager.shared
    var dest : AppUser?
    
    init(dest : AppUser?){
        self.dest = dest
    }
    func AllMessage() {
        manager.messageRef.addSnapshotListener(snapshotListener)
    }
    
    func getMessage(){
        _ = manager.myId()
        
    }
    
    
    func snapshotListener(query : QuerySnapshot?, errors : Error?){
        self.messages = []
        DispatchQueue.main.async{
        if let error = errors {
            print(error.localizedDescription)
        }
        if let querys = query {
            let docs = querys.documents
            docs.forEach { snapshot in
                let id = snapshot.documentID
                let data = snapshot.data()
                let newMessage = Message(id: id, data: data)
                self.messages.append(newMessage)
            }
        }
        }
    }
    
    
    func sendMessageWithModelMessage(){
        guard self.text != "" else {return }
        let  dict = createDict(exp: manager.myId(), dest: self.dest!.id)
        manager.sendMessage(exp: manager.myId(), dest: self.dest!.id, datas: dict)
        self.text = ""
        
    }
    
    func createDict(exp : String , dest : String) -> [String : Any]{
        var dict : [String : Any] = [
            DESTINATAIRE : dest,
            EXPEDITEUR : exp,
            ENVOI : Date().timeIntervalSince1970,
         ]
        if(text != ""){
            dict[TEXT] = text
        }
        return dict
    }
   
}
