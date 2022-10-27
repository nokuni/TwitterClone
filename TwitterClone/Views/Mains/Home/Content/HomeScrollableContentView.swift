//
//  HomeScrollableContentView.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import SwiftUI

struct HomeScrollableContentView: View {
    @ObservedObject var twitterVM: TwitterViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(twitterVM.users, id: \.id) { user in
                UserPostView(user: user, post: twitterVM.user.posts[0])
            }
        }
    }
}

struct HomeScrollableContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScrollableContentView(twitterVM: TwitterViewModel())
    }
}
