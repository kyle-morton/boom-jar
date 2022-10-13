//
//  HomeView.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/10/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var podcastStore: PodcastStore
    @State var searchTerm = ""
    @State var showSettingsView = false
    @State var showDownloadsView = false
    @State var showAddView = false
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults) { podcast in
                    PodcastRowView(podcast: podcast)
                        .background( NavigationLink("", destination: PodcastDetailsView(podcast: podcast)).opacity(0)
                        )
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        showSettingsView = true
                    } label: {
                        Image(systemName: "asterisk.circle")
                    }
                    Button {
                        showDownloadsView = true
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
                        showAddView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .searchable(text: $searchTerm)
            .background{
                NavigationLink(destination: SettingsView(), isActive: $showSettingsView) {
                  EmptyView()
                }
            }
            .background {
                NavigationLink(destination: DownloadsView(), isActive: $showDownloadsView) {
                  EmptyView()
                }
            }
            .background {
                NavigationLink(destination: AddPodcastView(), isActive: $showAddView) {
                  EmptyView()
                }
            }
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
            .environmentObject(PodcastStore.example)
    }
}
