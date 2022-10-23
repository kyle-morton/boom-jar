//
//  PodcastRowView.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/9/22.
//

import SwiftUI

struct PodcastRow: View {
   
    var podcast: Podcast = Podcast()
    var hasNewEpisodes: Bool
    
    var body: some View {
        HStack {
            PodcastLogo(podcast: podcast, isFullSize: false)
            VStack {
                Text(podcast.name)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                Text(podcast.network)
                    .font(.subheadline)
            }
            Spacer()
            
            if (hasNewEpisodes) {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color("LightBlue"))
                    .font(.footnote)
                    .padding()
            }
        }
    }
}

struct PodcastRowView_Previews: PreviewProvider {
    static var previews: some View {
        PodcastRow(podcast: PodcastService.examplePodcasts[0], hasNewEpisodes: true)
            .preferredColorScheme(.dark)
    }
}
