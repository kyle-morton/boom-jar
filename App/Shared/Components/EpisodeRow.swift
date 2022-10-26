//
//  EpisodeRow.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/20/22.
//

import SwiftUI

struct EpisodeRow: View {
    
    var episode: PodcastEpisode = PodcastEpisode()
    
    var body: some View {
        HStack {
            VStack (alignment:.leading){
                Text(episode.title)
                Text(episode.postingDate.formatted())
                 .font(.subheadline)
            }
            Spacer()
            Image(systemName: "chevron.down.circle")
                .foregroundColor(Color("LightBlue"))
                .font(.footnote)
                .padding()
        }
        .padding()
    }

struct EpisodeRow_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeRow(episode: EpisodeService.exampleEpisodes[0])
            .preferredColorScheme(.dark)
    }
}
    
}
