//
//  InboxTipMessage.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 27/10/22.
//

import SwiftUI

struct InboxTipMessage: View {
    var body: some View {
        Text("Drop a line, share Tweets and more with private conversations between you and others on Twitter.")
            .fontWeight(.medium)
            .font(.subheadline)
            .foregroundColor(.gray)
            .padding(.leading)
    }
}

struct InboxTipMessage_Previews: PreviewProvider {
    static var previews: some View {
        InboxTipMessage()
    }
}
