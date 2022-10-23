//
//  PodcastIcon.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/16/22.
//

import SwiftUI

struct PodcastLogo: View {
    
    var podcast: Podcast = Podcast()
    var isFullSize: Bool = false
    
    var body: some View {
            AsyncImage(url: URL(string: isFullSize ? podcast.fullLogoUrl : podcast.logoUrl))
                .frame(
                    width: isFullSize ? 400 : 60,
                    height: isFullSize ? 400 : 60
                )
    }
}

struct PodcastIcon_Previews: PreviewProvider {
    static var previews: some View {
        PodcastLogo(podcast: PodcastService.examplePodcasts[0], isFullSize: false)
            .preferredColorScheme(.dark)
    }
}
