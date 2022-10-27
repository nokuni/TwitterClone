//
//  InboxWriteMessageButton.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 27/10/22.
//

import SwiftUI

struct InboxWriteMessageButton: View {
    var body: some View {
        Button(action: {
            
        }) {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: UIScreen.main.bounds.width * 0.55, height: UIScreen.main.bounds.height * 0.065, alignment: .leading)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .overlay(
                    Text("Write a message")
                        .fontWeight(.bold)
                        .font(.title3)
                        .foregroundColor(Color(UIColor.systemBackground))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                )
        }
        .padding(.leading)
        .padding(.top)
    }
}

struct InboxWriteMessageButton_Previews: PreviewProvider {
    static var previews: some View {
        InboxWriteMessageButton()
    }
}
