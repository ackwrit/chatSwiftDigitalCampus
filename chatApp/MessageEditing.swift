//
//  MessageEditing.swift
//  chatApp
//
//  Created by Djino Dissingar on 10/05/2022.
//

import SwiftUI

struct MessageEditing: View {
    @StateObject var messageVm : MessageViewModel
    @FocusState var shouldFocus : Bool
    @State var mess : String = ""
    var body: some View {
        HStack {
            TextEditor(text: $messageVm.text)
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke()
                    
                    
                )
                .focused($shouldFocus)
                .frame(height: 40)
            Button {
                //Envoyer message
                messageVm.sendMessageWithModelMessage()
                
            } label: {
                Image(systemName: "paperplane")
            }
        }
        .padding()
        .onChange(of: messageVm.text) { newValue in
            if (newValue == ""){
                self.shouldFocus = false
            }
        }
    }
}



