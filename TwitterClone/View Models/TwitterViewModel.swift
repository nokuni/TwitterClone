//
//  TwitterViewModel.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import SwiftUI

struct CustomNavigationView {
    @FiniteSize var size
    var minimumSize: CGFloat = UIScreen.main.bounds.width * 0.05
    var didTransition: Bool = false
}

class TwitterViewModel: ObservableObject {
    
    init() {
        loadPosts()
    }
    
    @Published var user = UserModel.all[0]
    @Published var users = UserModel.all
    @Published var customNavigationView = CustomNavigationView()
    
    func updateScroll(scrollValue: CGFloat) {
        let maxSize: CGFloat = UIScreen.main.bounds.width * 0.15
        let isZeroOrLess = scrollValue <= 0.0
        let updatedSize = maxSize - scrollValue
        
        if !isZeroOrLess {
            if !customNavigationView.didTransition {
                customNavigationView.size = updatedSize
                if customNavigationView.size == customNavigationView.minimumSize {
                    animateInfos(scrollValue)
                }
            }
            if customNavigationView.didTransition {
                customNavigationView.size = updatedSize
                if customNavigationView.size > customNavigationView.minimumSize {
                    animateInfos(scrollValue)
                }
            }
        }
    }
    func animateInfos(_ scrollValue: CGFloat) {
        customNavigationView.didTransition.toggle()
    }
    
    func loadPosts() {
        let post = UserPost(message: "This is a plceholder message", content: "photo", views: 0, comments: [], retweets: 0, likes: 0)
        user.posts.append(post)
        for index in users.indices {
            users[index].posts.append(post)
        }
    }
}
