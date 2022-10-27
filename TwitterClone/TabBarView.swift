//
//  ContentView.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import SwiftUI

struct TabBarView: View {
    init() {
        UITabBar.appearance().isTranslucent = false
    }
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            SpacesView()
                .tabItem {
                    Image(systemName: "waveform.and.mic")
                    Text("Spaces")
                }
            NotificationView()
                .tabItem {
                    Image(systemName: "envelope")
                    Text("Notification")
                }
            InboxView()
                .tabItem {
                    Image(systemName: "bell")
                    Text("Inbox")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(TwitterViewModel())
    }
}
