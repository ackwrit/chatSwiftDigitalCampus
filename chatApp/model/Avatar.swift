//
//  Avatar.swift
//  chatApp
//
//  Created by Djino Dissingar on 25/04/2022.
//

import SwiftUI

struct Avatar: View {
    var size : CGFloat
    var body: some View {
        RemplcamentAvatar(size: size)
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(size: 40)
    }
}
