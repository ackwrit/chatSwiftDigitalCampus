//
//  ChatMessage.swift
//  chatApp
//
//  Created by Djino Dissingar on 10/05/2022.
//

import SwiftUI

struct ChatMessage: View {
    var scrollId = "ScrollId"
    @StateObject var MessageVM = MessageViewModel()
    var dest: AppUser
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollViewReader { proxy in
                    //Afficher les messages
                    VStack {
                        ForEach(MessageVM.messages) { mess in
                            Text(mess.text)
                        }
                    }
                    HStack {
                        Spacer()
                    }
                    .id(scrollId)
                }
            }
           
        }
        .navigationTitle(dest.fullName)
        .safeAreaInset(edge: .bottom) {
            MessageEditing(messageVm: MessageVM, destinataire: dest)
        }
        
    }



}

struct ChatMessage_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessage(dest: AppUser(id: "", dict: [:]))
    }
}
