//
//  ShowThisThreadLeaderView.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import SwiftUI

struct ShowThisThreadLeaderView: View {
    var image: String
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.height * 0.075, height: UIScreen.main.bounds.height * 0.075)
            Capsule()
                .foregroundColor(Color(UIColor.systemGray5))
                .frame(width: UIScreen.main.bounds.height * 0.006, height: UIScreen.main.bounds.height * 0.45)
            Image(image)
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.height * 0.05, height: UIScreen.main.bounds.height * 0.05)
        }
    }
}

struct ShowThisThreadLeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ShowThisThreadLeaderView(image: UserModel.example.image)
    }
}
