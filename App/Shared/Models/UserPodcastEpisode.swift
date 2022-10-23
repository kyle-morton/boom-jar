//
//  UserPodcastEpisode.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/23/22.
//

import Foundation

class UserPodcastEpisode : Identifiable, Codable {
    
    var id: Int
    var userPodcastId: Int
    var episodeId: Int
    var startingSecond: Double
    
    init() {
        id = 0
        userPodcastId = 0
        episodeId = 0
        startingSecond = 10
    }
    
    init(id: Int, userPodcastId: Int, episodeId: Int, startingSecond: Double) {
        self.id = id
        self.userPodcastId = userPodcastId
        self.episodeId = episodeId
        self.startingSecond = startingSecond
    }
    
    
}
