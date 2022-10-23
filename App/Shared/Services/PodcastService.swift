//
//  EpisodeService.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/23/22.
//

import Foundation

struct PodcastService {
    
    static func search(searchTerm: String) -> [Podcast] {
        
        if searchTerm.isEmpty {
            return []
        } else {
            return examplePodcasts.filter { $0.name.contains(searchTerm)
                || $0.network.contains(searchTerm)}
        }
    }
    
    #if DEBUG
    
    static var examplePodcasts = [
        Podcast(id: 1, name: "Podcast A", network: "Gimlet", logoUrl: "https://picsum.photos/60/60", fullLogoUrl: "https://picsum.photos/300/300"),
        Podcast(id: 2, name: "Podcast B", network: "Wondery", logoUrl: "https://picsum.photos/60/60", fullLogoUrl: "https://picsum.photos/300/300"),
        Podcast(id: 3, name: "Podcast C", network: "Earwolf", logoUrl: "https://picsum.photos/60/60", fullLogoUrl: "https://picsum.photos/300/300"),
        Podcast(id: 4, name: "Podcast D", network: "Wondery", logoUrl: "https://picsum.photos/60/60", fullLogoUrl: "https://picsum.photos/300/300"),
        Podcast(id: 5, name: "Podcast E", network: "NPR", logoUrl: "https://picsum.photos/60/60", fullLogoUrl: "https://picsum.photos/300/300"),
        Podcast(id: 6, name: "Podcast F", network: "Gimlet", logoUrl: "https://picsum.photos/60/60", fullLogoUrl: "https://picsum.photos/300/300"),
        Podcast(id: 7, name: "Podcast G", network: "Wondery", logoUrl: "https://picsum.photos/60/60", fullLogoUrl: "https://picsum.photos/300/300"),
        Podcast(id: 8, name: "Podcast H", network: "Earwolf", logoUrl: "https://picsum.photos/60/60", fullLogoUrl: "https://picsum.photos/300/300"),
        Podcast(id: 9, name: "Podcast I", network: "Wondery", logoUrl: "https://picsum.photos/60/60", fullLogoUrl: "https://picsum.photos/300/300"),
        Podcast(id: 10, name: "Podcast J", network: "NPR", logoUrl: "https://picsum.photos/60/60", fullLogoUrl: "https://picsum.photos/300/300")
    ]
    
    #endif
    
    
}
