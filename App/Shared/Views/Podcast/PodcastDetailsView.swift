//
//  PodcastDetailsView.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/9/22.
//

import SwiftUI

struct PodcastDetailsView: View {
    
    var podcast: Podcast = Podcast()
    
    var body: some View {
        VStack {
            Text(podcast.name)

            Text(podcast.network)
        }
    }
}

struct PodcastDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PodcastDetailsView(podcast: PodcastStore.example.podcasts[0])
    }
}
