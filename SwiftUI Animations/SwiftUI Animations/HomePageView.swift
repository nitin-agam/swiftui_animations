//
//  ContentView.swift
//  SwiftUI Animations
//
//  Created by Nitin Aggarwal on 15/12/22.
//

import SwiftUI

struct HomePageView: View {
    
    var body: some View {
        List(animationArray) { animation in
            NavigationLink {
                switch animation.type {
                case .scrollableHeader:
                    GeometryReader { proxy in
                        let safeArea = proxy.safeAreaInsets
                        let size = proxy.size
                        AlbumListView(safeArea: safeArea, size: size)
                            .ignoresSafeArea(.container, edges: .top)
                    }
                    .preferredColorScheme(.dark)
                }
            } label: {
                Text(animation.title)
                    .padding(.vertical, 8)
            }

        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("SwiftUI Animations")
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
