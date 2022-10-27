//
//  NowPlayingView.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/26/22.
//

import SwiftUI

struct NowPlayingView: View {
    
    var episode: PodcastEpisode
    
    var body: some View {
        Text("Now Playing ---> \(episode.title)")
    }
}

struct NowPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingView(episode: EpisodeService.exampleEpisodes[0])
    }
}
