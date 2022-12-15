//
//  AlbumModel.swift
//  SwiftUI Animations
//
//  Created by Nitin Aggarwal on 15/12/22.
//

import SwiftUI

struct SpotifyAlbum: Identifiable {
    let id = UUID()
    let title: String
    let playCount: String
}

let albumArray: [SpotifyAlbum] = [
    SpotifyAlbum(title: "Anti-Hero", playCount: "358,505,557"),
    SpotifyAlbum(title: "Lavender Haze", playCount: "195,074,711"),
    SpotifyAlbum(title: "Midnight Rain", playCount: "190,328,135"),
    SpotifyAlbum(title: "Snow On The Beach", playCount: "169,822,229"),
    SpotifyAlbum(title: "Maroon", playCount: "163,923,584"),
    SpotifyAlbum(title: "You're On Your Own", playCount: "159,814,800"),
    SpotifyAlbum(title: "Bejeweled", playCount: "147,085,619"),
    SpotifyAlbum(title: "Karma", playCount: "151,050,548"),
    SpotifyAlbum(title: "Don't Blame Me", playCount: "418,196,175"),
    SpotifyAlbum(title: "Would've, Could've, Should've", playCount: "78,216,169")
]
