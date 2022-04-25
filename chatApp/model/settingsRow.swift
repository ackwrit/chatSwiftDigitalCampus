//
//  settingsRow.swift
//  chatApp
//
//  Created by Djino Dissingar on 25/04/2022.
//

import SwiftUI

struct settingsRow: View {
    var imageName : String
    var title : String
    var color : Color
    var body: some View {
        NavigationLink {
            Text(title)
        } label: {
            HStack {
                Image(systemName: imageName)
                    .foregroundColor(.secondary)
                    .padding(3)
                    .background(color)
                    .cornerRadius(25)
                Text(title)
                    .italic()
                    .bold()
            Spacer()
            }
            .padding(2)
        }

    }
}

struct settingsRow_Previews: PreviewProvider {
    static var previews: some View {
        settingsRow(imageName: "message.fill", title: "Message", color: .red)
    }
}
