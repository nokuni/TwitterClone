//
//  UserCommentView.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import SwiftUI

struct UserCommentView: View {
    var comment: String
    var body: some View {
        Text(comment)
    }
}

struct UserCommentView_Previews: PreviewProvider {
    static var previews: some View {
        UserCommentView(comment: "")
    }
}
