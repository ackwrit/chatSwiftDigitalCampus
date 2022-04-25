//
//  AppUser.swift
//  chatApp
//
//  Created by Djino Dissingar on 25/04/2022.
//

import Foundation

struct AppUser : Identifiable{
    var id : String
    var _name : String?
    var _lastName : String?
    var _imageUrl : String?
    var mail : String?
    
    
    var name : String {
        return _name ?? ""
    }
    
    var lastName : String {
        return  _lastName ?? ""
    }
    
    var imageUrl : String? {
        return _imageUrl
    }
    
    var fullName : String {
        return name + " " + lastName
        
    }
    
    init(id : String , dict :[String:Any]){
        self.id = id
        self._name = dict[NAME] as? String
        self._lastName = dict[LASTNAME] as? String
        self._imageUrl = dict[IMAGE_URL] as? String
        self.mail = dict[MAIL] as? String
    }
    
}
