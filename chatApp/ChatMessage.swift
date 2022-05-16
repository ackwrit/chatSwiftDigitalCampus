//
//  ChatMessage.swift
//  chatApp
//
//  Created by Djino Dissingar on 10/05/2022.
//

import SwiftUI

struct ChatMessage: View {
    var scrollId = "ScrollId"
    @StateObject var MessageVM : MessageViewModel
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
        .navigationTitle(MessageVM.dest!.fullName)
        .safeAreaInset(edge: .bottom) {
            MessageEditing(messageVm: MessageVM)
        }
        
    }



}


