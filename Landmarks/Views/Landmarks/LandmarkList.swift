//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Bhavin  Oza on 2/21/24.
//

import SwiftUI

struct LandmarkList: View {
    
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            //            List(filteredLandmarks) { landmark in
            //                NavigationLink {
            //                    LandmarkDetail(landmark: landmark)
            //                } label: {
            //                    LandmarkRow(landmark: landmark)
            //                }
            //            }
            Toggle(isOn: $showFavoritesOnly) {
                Text("Favorites only")
            }
            .padding()
            
            List {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                            .environment(modelData)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a landmark")
        }
        
    }
}

#Preview {
    LandmarkList()
}
