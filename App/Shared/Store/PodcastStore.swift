//
//  PodcastStore.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/9/22.
//

import Foundation

class PodcastStore: ObservableObject {
    
    @Published var podcasts: [Podcast]
    @Published var userPodcasts: [UserPodcast]
    
    init() {
        self.podcasts = []
        self.userPodcasts = []
    }
    
    init(podcasts: [Podcast], userPodcasts: [UserPodcast]) {
        self.podcasts = podcasts
        self.userPodcasts = userPodcasts
    }
    
    #if DEBUG
    
    static var examplePodcasts = [
        Podcast(id: 1, name: "Podcast A", network: "Gimlet", logoUrl: "https://via.placeholder.com/60"),
        Podcast(id: 2, name: "Podcast B", network: "Wondery", logoUrl: "https://via.placeholder.com/60"),
        Podcast(id: 3, name: "Podcast C", network: "Earwolf", logoUrl: "https://via.placeholder.com/60"),
        Podcast(id: 4, name: "Podcast D", network: "Wondery", logoUrl: "https://via.placeholder.com/60"),
        Podcast(id: 5, name: "Podcast E", network: "NPR", logoUrl: "https://via.placeholder.com/60"),
        Podcast(id: 6, name: "Podcast F", network: "Gimlet", logoUrl: "https://via.placeholder.com/60"),
        Podcast(id: 7, name: "Podcast G", network: "Wondery", logoUrl: "https://via.placeholder.com/60"),
        Podcast(id: 8, name: "Podcast H", network: "Earwolf", logoUrl: "https://via.placeholder.com/60"),
        Podcast(id: 9, name: "Podcast I", network: "Wondery", logoUrl: "https://via.placeholder.com/60"),
        Podcast(id: 10, name: "Podcast J", network: "NPR", logoUrl: "https://via.placeholder.com/60")
    ]
    
    
    static var example = PodcastStore(
        podcasts: examplePodcasts,
        userPodcasts: [
            UserPodcast(id: 1, userId: 123, podcast: examplePodcasts[0]),
            UserPodcast(id: 2, userId: 123, podcast: examplePodcasts[2]),
            UserPodcast(id: 3, userId: 123, podcast: examplePodcasts[7]),
            UserPodcast(id: 4, userId: 123, podcast: examplePodcasts[8])
        ]
    )
    
    #endif
    
}
