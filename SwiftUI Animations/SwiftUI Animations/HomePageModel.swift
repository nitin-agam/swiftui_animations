//
//  HomePageModel.swift
//  SwiftUI Animations
//
//  Created by Nitin Aggarwal on 15/12/22.
//

import SwiftUI

enum AnimationType {
    case scrollableHeader
}

struct Animation: Identifiable {
    let id = UUID()
    let title: String
    let type: AnimationType
}

let animationArray: [Animation] = [
    Animation(title: "Scrollable Header", type: .scrollableHeader)
]
