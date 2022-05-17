//
//  chatBubble.swift
//  chatApp
//
//  Created by Djino Dissingar on 16/05/2022.
//

import SwiftUI

struct chatBubble: View {
    var message : Message
    let fromColor = Color.teal
    let toColor = Color.blue
    let manager = FirebaseManager.shared
    var body: some View {
        HStack(alignment: .bottom) {
            if(isMe()){
                Spacer(minLength: 50)
            }
            
            VStack {
                Text(message.text)
                    .padding()
                    .background(isMe() ? fromColor : toColor)
                    .foregroundColor(isMe() ? .white : .black)
                    .cornerRadius(20)
                
                    
            }
            if(!isMe()){
                Spacer()
            }
            
        }
    }
    
    
    
    func isMe() -> Bool{
        return message.expediteur == manager.myId()
    }
}


