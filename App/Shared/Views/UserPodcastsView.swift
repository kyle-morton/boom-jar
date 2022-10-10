//
//  UserPodcastsView.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/9/22.
//

import SwiftUI

struct UserPodcastsView: View {
    
    @EnvironmentObject private var podcastStore: PodcastStore
    @State var searchTerm = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults) { podcast in
                    PodcastRowView(podcast: podcast)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        print("Settings")
                    } label: {
                        Image(systemName: "asterisk.circle")
                    }
                    Button {
                        print("Edit button was tapped")
                    } label: {
                        Image(systemName: "square.and.arrow.down")
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        print("Edit button was tapped")
                    } label: {
                        Image(systemName: "text.badge.plus")
                    }
                    Button {
                        print("Edit button was tapped")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .searchable(text: $searchTerm)
        }
    }
    
    var searchResults: [Podcast] {
        if searchTerm.isEmpty {
            return podcastStore.podcasts
        } else {
            return podcastStore.podcasts.filter { $0.name.contains(searchTerm)
                || $0.network.contains(searchTerm)}
        }
    }
}

struct UserPodcastsView_Previews: PreviewProvider {
    static var previews: some View {
        UserPodcastsView()
            .environmentObject(PodcastStore.example)
    }
}
