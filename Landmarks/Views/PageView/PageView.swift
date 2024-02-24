//
//  PageView.swift
//  Landmarks
//
//  Created by Bhavin  Oza on 2/23/24.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    @State private var currentPage = 0
    var pages: [Page]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(currentPage: $currentPage, pages: pages)
                .aspectRatio(3 / 2, contentMode: .fit)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}


#Preview {
    PageView(pages: ModelData().featured.map { FeatureCard(landmark: $0) })
}
