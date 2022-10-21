//
//  EpisodeStore.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/20/22.
//

import Foundation

class EpisodeStore: ObservableObject {
    
    @Published var episodes: [PodcastEpisode]
    
    init() {
        self.episodes = EpisodeStore.exampleEpisodes
    }
    
    init(episodes: [PodcastEpisode]) {
        self.episodes = episodes
    }
    
    #if DEBUG
    
    static var exampleEpisodes = [
        PodcastEpisode(id: 1, podcastId: 1, title: "Episode 1", postingDate: "07/22/2022".toDate()!),
        PodcastEpisode(id: 2, podcastId: 1, title: "Episode 2", postingDate: "08/22/2022".toDate()!),
        PodcastEpisode(id: 3, podcastId: 1, title: "Episode 3", postingDate: "09/22/2022".toDate()!),
        PodcastEpisode(id: 4, podcastId: 1, title: "Episode 4", postingDate: "10/01/2022".toDate()!),
        PodcastEpisode(id: 5, podcastId: 1, title: "Episode 5", postingDate: "10/20/2022".toDate()!)
    ]
    
    
    static var example = EpisodeStore(
        episodes: exampleEpisodes
    )
    
    #endif
    
}
