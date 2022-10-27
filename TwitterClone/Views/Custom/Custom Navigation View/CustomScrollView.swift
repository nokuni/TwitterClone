//
//  CustomScrollView.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import SwiftUI

struct CustomScrollView<V: View>: View {
    init(user: UserModel, updateScroll: ((CGFloat) -> Void)?, @ViewBuilder view: (UserModel) -> V) {
        self.user = user
        self.updateScroll = updateScroll
        self.view = view(user)
    }
    @State private var offset = CGFloat.zero
    var user: UserModel
    var preferenceKey: some View {
        GeometryReader {
            Color
                .clear
                .preference(key: ViewOffsetKey.self,
                            value: -$0.frame(in: .named("scroll")).origin.y)
        }
    }
    var updateScroll: ((CGFloat) -> Void)?
    var view: V
    var body: some View {
        ScrollView(showsIndicators: false) {
            view
                .background(preferenceKey)
                .onPreferenceChange(ViewOffsetKey.self) {
                    updateScroll?($0)
                }
        }
        .coordinateSpace(name: "scroll")
    }
}

struct CustomScrollView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
        //CustomScrollView(user: UserModel.byDefault)
    }
}
