//
//  NewPodcastView.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/16/22.
//

import SwiftUI

struct UserPodcastDetailsView: View {
    var userPodcast: UserPodcast = UserPodcast()
        
    var body: some View {
        VStack {
            HStack {
                PodcastLogo(podcast: userPodcast.podcast, isFullSize: false)
                VStack {
                    Text(userPodcast.podcast.name)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                    Text(userPodcast.podcast.network)
                        .font(.subheadline)
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct UserPodcastDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserPodcastDetailsView(userPodcast: UserPodcastStore.example.podcasts[0])
            .preferredColorScheme(.dark)
    }
}