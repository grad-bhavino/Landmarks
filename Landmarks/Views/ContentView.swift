//
//  ContentView.swift
//  Landmarks
//
//  Created by Bhavin  Oza on 2/21/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab: Tab = .featured
    
    enum Tab {
        case featured, list
        
    }
    var body: some View {
//        LandmarkList()
        TabView(selection: $selectedTab) {
            CategoryHome()
                .tabItem{
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem { 
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
