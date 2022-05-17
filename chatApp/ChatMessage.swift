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
                            chatBubble(message: mess)
                            //Text(mess.text)
                            
                                
                        }
                        .padding(EdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 8))
                    }
                    HStack {
                        Spacer()
                    }
                    .id(scrollId)
                    .onReceive(MessageVM.$messages.count()) { output in
                        withAnimation {
                            proxy.scrollTo(scrollId, anchor: .bottom)
                        }
                        
                    }
                }
            }
           
        }
        .navigationTitle(MessageVM.dest!.fullName)
        .safeAreaInset(edge: .bottom) {
            MessageEditing(messageVm: MessageVM)
        }
        
    }



}


