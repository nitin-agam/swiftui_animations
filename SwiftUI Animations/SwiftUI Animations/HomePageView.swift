//
//  ContentView.swift
//  SwiftUI Animations
//
//  Created by Nitin Aggarwal on 15/12/22.
//

import SwiftUI

struct HomePageView: View {
    
    var body: some View {
        NavigationView(content: {
            List(animationArray) { animation in
                Text(animation.title)
                    .padding(.vertical, 8)
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("SwiftUI Animations")
        })
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
