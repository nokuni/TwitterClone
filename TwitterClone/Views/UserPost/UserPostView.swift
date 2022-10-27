//
//  UserPostView.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import SwiftUI

struct UserPostView: View {
    var user: UserModel
    var post: UserPost
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(alignment: .top) {
                ShowThisThreadLeaderView(image: user.image)
                VStack(alignment: .leading) {
                    PostHeaderView(user: user)
                    UserCommentView(comment: post.message)
                    UserContentView(content: post.content)
                    //UserPostViewsView(views: post.views)
                    HStack {
                        UserPostIndicatorView(amount: post.comments.count, indicator: .comment)
                        UserPostIndicatorView(amount: post.retweets, indicator: .retweet)
                        UserPostIndicatorView(amount: post.likes, indicator: .like)
                    }
                }
            }
        }
        .overlay(
            Button(action: {
                
            }) {
                Text("Show this thread")
            }
                .frame(width: UIScreen.main.bounds.width * 0.55, height: UIScreen.main.bounds.height * 0.58, alignment: .bottomLeading)
                .padding(.bottom)
        )
        .padding()
    }
}

struct UserPostView_Previews: PreviewProvider {
    static var previews: some View {
        UserPostView(user: UserModel.example, post: UserModel.example.posts[0])
    }
}
