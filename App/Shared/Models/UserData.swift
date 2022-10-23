//
//  UserData.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/23/22.
//

import Foundation

struct UserData : Codable {
    
    var podcasts: [UserPodcast]
    var episodes: [UserPodcastEpisode]
    
    init() {
        podcasts = []
        episodes = []
    }
    
    init(podcasts: [UserPodcast], episodes: [UserPodcastEpisode]) {
        self.podcasts = podcasts
        self.episodes = episodes
    }
    
}
