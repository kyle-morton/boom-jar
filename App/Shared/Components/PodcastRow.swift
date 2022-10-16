//
//  PodcastRowView.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/9/22.
//

import SwiftUI

struct PodcastRow: View {
    
    var podcast: Podcast = Podcast()
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: podcast.logoUrl))
                .frame(width: 60, height: 60)
            VStack {
                Text(podcast.name)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                Text(podcast.network)
                    .font(.subheadline)
            }
            Spacer()
            Image(systemName: "circle.fill")
                .foregroundColor(.blue)
                .font(.footnote)
                .padding()
        }
//        .padding()
        
    }
}

struct PodcastRowView_Previews: PreviewProvider {
    static var previews: some View {
        PodcastRow(podcast: PodcastStore.example.podcasts[0])
            .preferredColorScheme(.dark)
    }
}
