//
//  PostHeaderView.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import SwiftUI

struct PostHeaderView: View {
    var user: UserModel
    var body: some View {
        Text("\(user.username) ")
        +
        Text("\(user.hashtag)")
            .foregroundColor(.gray)
    }
}

struct PostHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PostHeaderView(user: UserModel.example)
    }
}
