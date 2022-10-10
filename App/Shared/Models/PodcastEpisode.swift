//
//  PodcastEpiosde.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/9/22.
//

import Foundation

struct PodcastEpisode : Identifiable {
    var id : Int
    var podcastId: Int
    var title: String
    var postingDate: Date
}
