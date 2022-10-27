//
//  InboxWelcomeMessage.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 27/10/22.
//

import SwiftUI

struct InboxWelcomeMessage: View {
    var body: some View {
        Text("Welcome to your \n inbox!")
            .fontWeight(.heavy)
            .font(.largeTitle)
            .padding(.top)
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct InboxWelcomeMessage_Previews: PreviewProvider {
    static var previews: some View {
        InboxWelcomeMessage()
    }
}
