//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Bhavin  Oza on 2/22/24.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView {
            List {
                //                modelData.featured[0].image
                //                    .resizable()
                //                    .scaledToFill()
                //                    .frame(height: 300)
                //                    .clipped()
                //                    .listRowInsets(EdgeInsets())
                PageView(pages: modelData.featured.map { FeatureCard(landmark: $0) })
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key,
                                items: modelData.categories[key] ?? [])
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile, content: {
                ProfileHost()
                    .environment(modelData)
            })
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
