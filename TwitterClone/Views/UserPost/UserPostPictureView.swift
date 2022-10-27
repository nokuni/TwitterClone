//
//  UserPostPictureView.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import SwiftUI

struct UserPostPictureView: View {
    var image: String
    var body: some View {
        Image(image)
            .resizable()
            .clipShape(Circle())
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.height * 0.075, height: UIScreen.main.bounds.height * 0.075)
    }
}

struct UserPostPictureView_Previews: PreviewProvider {
    static var previews: some View {
        UserPostPictureView(image: UserModel.example.image)
    }
}
