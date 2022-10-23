//
//  PodcastDetailsView.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/9/22.
//

import SwiftUI

struct PodcastDetailsView: View {
    
    @EnvironmentObject private var userDataStore: UserDataStore
    var podcast: Podcast = Podcast()
    
    func ToggleFollow() {
        if (isSubscribed()) {
            userDataStore.unsubscribe(podcastId: podcast.id)
        }
        else {
            _ = userDataStore.subscribe(podcast: podcast)
        }
    }
    
    var body: some View {
        VStack {
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
            }
            ZStack {
                Rectangle()
                    .foregroundColor((Color("LightBlue")))
                Button(action: ToggleFollow) {
                    Text(isSubscribed() ? "Unfollow" : "Follow")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
            }
            .frame(width: 100, height: 40, alignment: .leading)
            .cornerRadius(10)
            Spacer()
        }
    }
    
    func isSubscribed() -> Bool {
        return userDataStore.isSubscribed(podcastId: podcast.id)
    }
}

struct PodcastDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PodcastDetailsView(podcast: PodcastService.examplePodcasts[0])
            .environmentObject(UserDataStore.example)
            .preferredColorScheme(.dark)
    }
}
