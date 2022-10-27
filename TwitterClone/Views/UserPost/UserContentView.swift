//
//  UserContentView.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import SwiftUI

struct UserContentView: View {
    var content: String
    var body: some View {
        Image(content)
            .resizable()
            .cornerRadius(8)
            .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.4)
    }
}

struct UserContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserContentView(content: "photo")
    }
}
