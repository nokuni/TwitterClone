//
//  HomeView.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var twitterVM: TwitterViewModel
    var body: some View {
        VStack {
            CustomNavigationViewView(user: UserModel.example, navigationTitle: "logo", isNavigationTitleALogo: true, trailingButton: "sparkles", size: twitterVM.customNavigationView.size, isChanged: $twitterVM.customNavigationView.didTransition)
                .animation(.spring(), value: twitterVM.customNavigationView.didTransition)
            CustomScrollView(user: UserModel.example, updateScroll: twitterVM.updateScroll) { user in
                HomeScrollableContentView(twitterVM: twitterVM)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(TwitterViewModel())
    }
}
