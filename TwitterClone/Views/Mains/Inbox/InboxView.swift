//
//  InboxView.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import SwiftUI

struct InboxView: View {
    @EnvironmentObject var twitterVM: TwitterViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            CustomNavigationViewView(user: UserModel.example, navigationTitle: "Messages", isNavigationTitleALogo: false, trailingButton: "gearshape", size: twitterVM.customNavigationView.size, isChanged: $twitterVM.customNavigationView.didTransition)
                .animation(.spring(), value: twitterVM.customNavigationView.didTransition)
            InboxContentView()
        }
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
            .environmentObject(TwitterViewModel())
    }
}
