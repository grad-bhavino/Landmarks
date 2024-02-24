//
//  CircleImage.swift
//  Landmarks
//
//  Created by Bhavin  Oza on 2/21/24.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        image
            .clipShape(.circle)
            .overlay {
                Circle().stroke(.white, lineWidth: 4.0)
            }
            .shadow(radius: 7.0)
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
