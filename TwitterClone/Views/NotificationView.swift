//
//  NotificationView.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import SwiftUI

struct NotificationView: View {
    @EnvironmentObject var twitterVM: TwitterViewModel
    @Namespace var animation
    @State var isOn: Bool = false
    var body: some View {
        VStack {
            CustomNavigationViewView(user: UserModel.example, navigationTitle: "Notifications", isNavigationTitleALogo: false, trailingButton: "gearshape", size: twitterVM.customNavigationView.size, isChanged: $twitterVM.customNavigationView.didTransition)
                .animation(.spring(), value: twitterVM.customNavigationView.didTransition)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.05)
                .overlay(
                    HStack {
                        SegmentedControlElement(label: "All", alignment: .leading, edgeSet: .leading, animation: animation, segmentedNotificationElement: .all, isOn: $isOn)
                        
                        SegmentedControlElement(label: "Mentions", alignment: .trailing, edgeSet: .trailing, animation: animation, segmentedNotificationElement: .mentions, isOn: $isOn)
                    }
                )
                .padding(.top)
            if isOn {
                CustomScrollView(user: UserModel.example, updateScroll: twitterVM.updateScroll) { user in
                    NotificationMenstionsListView(twitterVM: twitterVM)
                }
            }
            Spacer()
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
            .environmentObject(TwitterViewModel())
    }
}

enum SegmentedNotificationElement {
    case all, mentions
}

struct SegmentedControlElement: View {
    var label: String
    var alignment: Alignment
    var edgeSet: Edge.Set
    var animation: Namespace.ID
    var segmentedNotificationElement: SegmentedNotificationElement
    @Binding var isOn: Bool
    var labelColor: Color {
        switch segmentedNotificationElement {
        case .all:
            return !isOn ? Color.primary : Color.secondary
        case .mentions:
            return isOn ? Color.primary : Color.secondary
        }
    }
    var body: some View {
        Button(action: {
            withAnimation {
                switch segmentedNotificationElement {
                case .all:
                    isOn = false
                case .mentions:
                    isOn = true
                }
            }
        }) {
            VStack(alignment: .center) {
                VStack {
                    Text(label)
                        .foregroundColor(labelColor)
                    switch segmentedNotificationElement {
                    case .all:
                        if isOn {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(.clear)
                                .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.005)
                        }
                    case .mentions:
                        if !isOn {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(.clear)
                                .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.005)
                        }
                    }
                }
                switch segmentedNotificationElement {
                case .all:
                    if !isOn {
                        RoundedRectangle(cornerRadius: 8)
                            .matchedGeometryEffect(id: "Cursor", in: animation)
                            .foregroundColor(.accentColor)
                            .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.005)
                    }
                case .mentions:
                    if isOn {
                        RoundedRectangle(cornerRadius: 8)
                            .matchedGeometryEffect(id: "Cursor", in: animation)
                            .foregroundColor(.accentColor)
                            .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.005)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: alignment)
        .padding(edgeSet, 50)
    }
}

struct NotificationMentionsRowView: View {
    var user: UserModel
    var post: UserPost
    let userReplies: [UserModel]
    var userHashtagReplies: String {
        let hashtags = userReplies.map { $0.hashtag }
        var filteredHashtags = [String]()
        if hashtags.count > 2 {
            filteredHashtags = hashtags.dropLast(hashtags.count - 2)
        }
        let result = hashtags.joined(separator: " ")
        let otherRepliesCount = hashtags.count - filteredHashtags.count
        var otherRepliesLabel: String = ""
        if !filteredHashtags.isEmpty {
            otherRepliesLabel = otherRepliesCount == 1 ? " and \(filteredHashtags.last!)" : " and \(otherRepliesCount) others"
        }
        let filteredResult = filteredHashtags.joined(separator: " ") + otherRepliesLabel
        if hashtags.count > 2 {
            return filteredResult
        } else {
            return result
        }
    }
    var body: some View {
        HStack(alignment: .top) {
            Image(user.image)
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.height * 0.06, height: UIScreen.main.bounds.height * 0.06)
            VStack(alignment: .leading, spacing: 5) {
                Text("\(user.username) ")
                +
                Text("\(user.hashtag) ")
                    .foregroundColor(.gray)
                +
                Text(Date.simpleFormat)
                    .foregroundColor(.gray)
                Text("Replying to ")
                    .foregroundColor(.gray)
                +
                Text(userHashtagReplies)
                    .foregroundColor(.accentColor)
                Text(user.posts[0].message)
                    .padding(.vertical, 5)
                HStack {
                    UserPostIndicatorView(amount: post.comments.count, indicator: .comment)
                    UserPostIndicatorView(amount: post.retweets, indicator: .retweet)
                    UserPostIndicatorView(amount: post.likes, indicator: .like)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.2, alignment: .leading)
    }
}

struct NotificationMenstionsListView: View {
    @ObservedObject var twitterVM: TwitterViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            NotificationMentionsRowView(user: twitterVM.user, post: twitterVM.user.posts[0], userReplies: [twitterVM.user])
        }
    }
}
