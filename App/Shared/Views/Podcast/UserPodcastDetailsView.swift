//
//  NewPodcastView.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/16/22.
//

import SwiftUI

struct UserPodcastDetailsView: View {
    
    @EnvironmentObject private var userPodcastStore: UserDataStore
    var userPodcast: UserPodcast = UserPodcast()
    @State private var selectedTab: DetailsViewTab = .unplayed
    
    enum DetailsViewTab: String, CaseIterable, Identifiable {
        case unplayed, all, settings
        var id: Self { self }
    }
        
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
                Text("Unplayed")
            }
            else if selectedTab == DetailsViewTab.all {
                Text("All")
            }
            else {
                Text("Settings")
            }
        

            Spacer()
        }
    }
}

struct UserPodcastDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserPodcastDetailsView(userPodcast: UserDataStore.example.podcasts[0])
            .environmentObject(UserDataStore.example)
            .preferredColorScheme(.dark)
    }
}
