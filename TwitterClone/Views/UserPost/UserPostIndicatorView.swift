//
//  UserPostCommentsView.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import SwiftUI

enum UserPostIndicator {
    case comment, retweet, like
    var symbol: String {
        switch self {
        case .comment:
            return "bubble.left"
        case .retweet:
            return "arrow.rectanglepath"
        case .like:
            return "heart"
        }
    }
}

struct UserPostIndicatorView: View {
    var amount: Int
    var indicator: UserPostIndicator
    var body: some View {
        HStack {
            Image(systemName: indicator.symbol)
            Text("\(amount)")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct UserPostCommentsView_Previews: PreviewProvider {
    static var previews: some View {
        UserPostIndicatorView(amount: 0, indicator: .comment)
    }
}
