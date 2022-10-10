//
//  PodcastStore.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/9/22.
//

import Foundation

class PodcastStore: ObservableObject {
    
    @Published var podcasts: [Podcast]
    
    init() {
        self.podcasts = []
    }
    
    init(podcasts: [Podcast]) {
        self.podcasts = podcasts
    }
    
    #if DEBUG
    
    static var example = PodcastStore(podcasts: [
        Podcast(id: 1, name: "Podcast A", network: "Gimlet", logoUrl: "https://via.placeholder.com/60"),
        Podcast(id: 2, name: "Podcast B", network: "Wondery", logoUrl: "https://via.placeholder.com/60"),
        Podcast(id: 3, name: "Podcast C", network: "Earwolf", logoUrl: "https://via.placeholder.com/60"),
        Podcast(id: 4, name: "Podcast D", network: "Wondery", logoUrl: "https://via.placeholder.com/60"),
        Podcast(id: 5, name: "Podcast E", network: "NPR", logoUrl: "https://via.placeholder.com/60")
    ])
    
    #endif
    
}
