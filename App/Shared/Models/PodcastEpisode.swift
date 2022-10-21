//
//  PodcastEpiosde.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/9/22.
//

import Foundation

struct PodcastEpisode : Identifiable, Codable {
   
    var id : Int
    var podcastId: Int
    var title: String
    var postingDate: Date

    init(id: Int, podcastId: Int, title: String, postingDate: Date) {
        self.id = id
        self.podcastId = podcastId
        self.title = title
        self.postingDate = postingDate
    }
    
    init() {
        self.id = 0
        self.podcastId = 0
        self.title = ""
        self.postingDate = Date()
    }
    
}
