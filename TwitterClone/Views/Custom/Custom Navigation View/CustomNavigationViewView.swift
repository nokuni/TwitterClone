//
//  CustomNavigationViewView.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import SwiftUI

struct CustomNavigationViewView: View {
    var user: UserModel
    var navigationTitle: String
    var isNavigationTitleALogo: Bool
    var trailingButton: String
    var size: CGFloat
    @Binding var isChanged: Bool
    @Namespace var namespace
    var body: some View {
        VStack(alignment: .leading) {
            if !isChanged {
                VStack(spacing: 10) {
                    HStack {
                        Image(user.image)
                            .resizable()
                            .clipShape(Circle())
                            .scaledToFit()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        if isNavigationTitleALogo {
                            Image(navigationTitle)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .frame(width: UIScreen.main.bounds.height * 0.04, height: UIScreen.main.bounds.height * 0.04)
                        } else {
                            Text(navigationTitle)
                                .fontWeight(.bold)
                                .font(.title3)
                        }
                        Image(systemName: trailingButton)
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.height * 0.03, height: UIScreen.main.bounds.height * 0.03)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing)
                    }
                    .matchedGeometryEffect(id: "image", in: namespace)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.04)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: size, alignment: .bottom)
        .background(Color.white)
    }
}

struct CustomNavigationViewView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationViewView(user: UserModel.example, navigationTitle: "logo", isNavigationTitleALogo: true, trailingButton: "sparkles", size: 0, isChanged: .constant(false))
    }
}
