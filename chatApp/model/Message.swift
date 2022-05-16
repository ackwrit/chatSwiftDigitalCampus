//
//  Message.swift
//  chatApp
//
//  Created by Djino Dissingar on 10/05/2022.
//

import Foundation

struct Message : Identifiable {
    var id : String
    var expediteur : String
    var destinataire : String
    var text : String
    var envoi : Double
    
    init(id : String, data:[String:Any]){
        self.id = id
        self.expediteur = data[EXPEDITEUR] as? String ?? ""
        self.destinataire = data[DESTINATAIRE] as? String ?? ""
        self.text = data[TEXT] as? String ?? ""
        self.envoi = data[ENVOI] as? Double ?? 0.0
        
        
    }
}
