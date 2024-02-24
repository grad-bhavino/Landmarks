//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Bhavin  Oza on 2/21/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
