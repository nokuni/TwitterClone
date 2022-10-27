//
//  InboxContentView.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 27/10/22.
//

import SwiftUI

struct InboxContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                InboxWelcomeMessage()
                InboxTipMessage()
                InboxWriteMessageButton()
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}
struct InboxContentView_Previews: PreviewProvider {
    static var previews: some View {
        InboxContentView()
    }
}
