//
//  HomePageModel.swift
//  SwiftUI Animations
//
//  Created by Nitin Aggarwal on 15/12/22.
//

import SwiftUI

struct Animation: Identifiable {
    let id = UUID()
    let title: String
}

let animationArray: [Animation] = [
    Animation(title: "Animation 1")
]
