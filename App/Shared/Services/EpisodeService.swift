//
//  PodcastService.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/23/22.
//

import Foundation

struct EpisodeService {
    
    static func search(podcastId: Int, searchTerm: String, onlyUnplayed: Bool) -> [PodcastEpisode] {
        
        let filteredEpisodes = exampleEpisodes;
        
//        if (onlyUnplayed) {
//            filteredEpisodes = filteredEpisodes.filter { $0 }
//        }
        
        if searchTerm.isEmpty {
            return filteredEpisodes
        } else {
            return filteredEpisodes.filter { $0.title.contains(searchTerm)}
        }
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
