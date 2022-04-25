//
//  RemplcamentAvatar.swift
//  chatApp
//
//  Created by Djino Dissingar on 25/04/2022.
//

import SwiftUI

struct RemplcamentAvatar: View {
    var size : CGFloat
    var body: some View {
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .foregroundColor(.secondary)
            .frame(width: size, height: size, alignment: .center)
            .background(.secondary)
            .clipShape(Circle())
    }
}

struct RemplcamentAvatar_Previews: PreviewProvider {
    static var previews: some View {
        RemplcamentAvatar(size: 150)
    }
}
