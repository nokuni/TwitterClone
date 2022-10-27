//
//  UserPostViewsView.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import SwiftUI

struct UserPostViewsView: View {
    var views: Int
    var body: some View {
        Text("\(views) views")
            .foregroundColor(.gray)
    }
}

struct UserPostViewsView_Previews: PreviewProvider {
    static var previews: some View {
        UserPostViewsView(views: 0)
    }
}
