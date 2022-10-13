//
//  UserPodcast.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/12/22.
//

import Foundation

class UserPodcast : Identifiable, Codable {
    
    var id: Int
    var userId: Int
    var podcastId: Int
    var podcast: Podcast
    
    init() {
        id = 0
        userId = 0
        podcastId = 0
        podcast = Podcast()
    }
    
    init(id: Int, userId: Int, podcast: Podcast) {
        self.id = id
        self.userId = userId
        self.podcastId = podcast.id
        self.podcast = podcast
    }
    
    
}
