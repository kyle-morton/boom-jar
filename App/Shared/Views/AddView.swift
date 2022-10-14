//
//  SearchView.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/13/22.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject private var podcastStore: PodcastStore
    
    @State var searchTerm = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            SearchBar(searchTerm: $searchTerm)
            List {
                ForEach(searchResults) { podcast in
                    PodcastRow(podcast: podcast)
                        .background( NavigationLink("", destination: PodcastDetailsView(podcast: podcast)).opacity(0)
                        )
                }
            }
            .listStyle(.grouped)
        }
        .navigationTitle("Add Podcast")
        .navigationBarTitleDisplayMode(.inline)
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

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
            .preferredColorScheme(.dark)
            .environmentObject(PodcastStore.example)
    }
}
