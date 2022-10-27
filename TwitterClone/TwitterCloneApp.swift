//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import SwiftUI

@main
struct TwitterCloneApp: App {
    @StateObject var twitterVM = TwitterViewModel()
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(twitterVM)
        }
    }
}
