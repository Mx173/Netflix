//
//  ContentView.swift
//  netflixApp
//
//  Created by Oleh_Pazynich on 2023/09/06.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().backgroundColor = .black
    }
    
    var body: some View {
        //TO DO: sometimes empty card appear in list
        TabView {
            //Text("Hello, world!")
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.tag(1)
            ComingSoonView()
                .tabItem {
                    Image(systemName: "play.rectangle") //make custom maybe notification red circle
                    Text("Coming Soon")
                }.tag(0)
            DownloadsView()
                .tabItem {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("Downloads")
                }.tag(0)
            HomeView()
                .tabItem {
                    Image(systemName: "equal")
                    Text("More")
                }.tag(0)
            
        }
        .accentColor(.red)
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
