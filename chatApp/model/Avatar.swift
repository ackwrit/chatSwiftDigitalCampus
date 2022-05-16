//
//  Avatar.swift
//  chatApp
//
//  Created by Djino Dissingar on 25/04/2022.
//

import SwiftUI

struct Avatar: View {
    var user : AppUser?
    @State var showActionSheet = false
    @State var showSheet = false
    @State var isCamera = false
    var size : CGFloat
    var body: some View {
        Button {
            
                self.showActionSheet = true
            
         
        } label: {
            RemplcamentAvatar(size: size)
        }
        .sheet(isPresented: $showSheet, content: {
            if(UIImagePickerController.isSourceTypeAvailable(.camera) && self.isCamera){
                ImagePickerRepresentable { img in
                    print("J'aime une image")
                }
               
            }
            else {
                
                
                PHPPickerRepresentable { img in
                    print("J'ai une image")
                }
                
            }
        })
        .confirmationDialog("CHANGE_IMAGE", isPresented: $showActionSheet) {
            Button {
                print("Caméra")
                self.isCamera = true
               
                    self.showSheet = true
               
            } label: {
                Text("CAMERA")
            }
            Button {
                print("Librarie")
                self.isCamera = false
                
                    self.showSheet = true
               
            } label: {
                Text("LIB")
            }

        }
        
    }
    
    
    func isMe() -> Bool {
        if let u = user {
            let id = FirebaseManager.shared.myId()
           
            return u.id == id
            
        }
        else{
            return false
        }
        
      
        
        
    }
   
}



struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(size: 40)
    }
}
