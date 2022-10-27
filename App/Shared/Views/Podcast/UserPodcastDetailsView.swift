//
//  NewPodcastView.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/16/22.
//

import SwiftUI

struct UserPodcastDetailsView: View {
    
    @EnvironmentObject private var userDataStore: UserDataStore
    @State private var selectedTab: DetailsViewTab = .unplayed
    @State var episodeSearchTerm = ""
    var userPodcast: UserPodcast = UserPodcast()
    
    enum DetailsViewTab: String, CaseIterable, Identifiable {
        case unplayed, all, settings
        var id: Self { self }
    }
    
    var allResults: [PodcastEpisode] {
        return EpisodeService.search(podcastId: self.userPodcast.podcastId, searchTerm: self.episodeSearchTerm, onlyUnplayed: false, userDataStore: self.userDataStore);
    }
    
    var unplayedResults: [PodcastEpisode] {
        let result = EpisodeService.search(podcastId: self.userPodcast.podcastId, searchTerm: self.episodeSearchTerm, onlyUnplayed: true, userDataStore: self.userDataStore)
        return result
    }
    
    var body: some View {
        VStack {
            SearchBar(searchTerm: $episodeSearchTerm)
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
            HStack {
                Text("Lorem ipsum dolor sit amet, per cu possit nostro. Ea per enim volumus reprimique. Te gubergren delicatissimi nec, inermis explicari constituto id vel. Cu mea choro eloquentiam, numquam torquatos consectetuer in est.")
                    .font(.subheadline)
            }

            VStack {
                Picker("Flavor", selection: $selectedTab) {
                    Text("Unplayed").tag(DetailsViewTab.unplayed)
                    Text("All").tag(DetailsViewTab.all)
                    Text("Settings").tag(DetailsViewTab.settings)
                }
                .textCase(.uppercase)
                .pickerStyle(.segmented)
            }
            if selectedTab == DetailsViewTab.unplayed {
                List {
                    ForEach(unplayedResults) { episode in
                        EpisodeRow(episode: episode)
                            .background(
                                NavigationLink("", destination: NowPlayingView(episode: episode)).opacity(0)
                            )
//                        Text("Episode: " + episode.id + " " + episode.title)
//                        PodcastRow(podcast: userPodcast.podcast, hasNewEpisodes: true)
//                            .background( NavigationLink("", destination: UserPodcastDetailsView(userPodcast: userPodcast)).opacity(0)
//                            )
                    }
                }
                .listStyle(.grouped)
            }
            else if selectedTab == DetailsViewTab.all {
                List {
                    ForEach(allResults) { episode in
                        EpisodeRow(episode: episode)
                            .background(
                                NavigationLink("", destination: NowPlayingView(episode: episode)).opacity(0)
                            )
//                        Text("Episode: " + episode.id + " " + episode.title)
//                        PodcastRow(podcast: userPodcast.podcast, hasNewEpisodes: true)
//                            .background( NavigationLink("", destination: UserPodcastDetailsView(userPodcast: userPodcast)).opacity(0)
//                            )
                    }
                }
                .listStyle(.grouped)
            }
            else {
                Text("Settings")
            }
        

            Spacer()
        }
        .onAppear {
//            let unplayed = EpisodeService.search(podcastId: self.userPodcast.podcastId, searchTerm: "", onlyUnplayed: true, userDataStore: self.userDataStore)
//            print("Unplayed Results: ")
//            self.unplayedResults = unplayed
        }
        .navigationTitle(userPodcast.podcast.name)
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

struct UserPodcastDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserPodcastDetailsView(userPodcast: UserDataStore.example.podcasts[0])
            .environmentObject(UserDataStore.example)
            .preferredColorScheme(.dark)
    }
}
