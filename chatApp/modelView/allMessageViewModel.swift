//
//  allMessageViewModel.swift
//  chatApp
//
//  Created by Djino Dissingar on 15/05/2022.
//

import Foundation
import Firebase

class allMessageViewModel : ObservableObject {
    @Published var messages : [Message] = []
    var manager = FirebaseManager.shared
    
    init(){
        getAllMessages()
    }
    
    func getAllMessages(){
        manager.messageRef.addSnapshotListener(allMessageListener)
    }
    
    func allMessageListener(query : QuerySnapshot?,error: Error?){
        let myId = manager.myId()
        let toId =
        self.messages = []
        if let error = error {
            print(error.localizedDescription)
        }
        if let doc = query?.documents {
            doc.forEach { snap in
                let id = snap.documentID
                let dict = snap.data()
                
                let newMessage = Message(id: id, data: dict)
                self.messages.append(newMessage)
            }
        }
    }
    
}
