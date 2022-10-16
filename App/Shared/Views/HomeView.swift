//
//  HomeView.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/10/22.
//

import SwiftUI

struct HomeView: View {
       
    @Binding var userPodcasts: [UserPodcast]
    @State var searchTerm = ""
    @State var showSettingsView = false
    @State var showDownloadsView = false
    @State var showSearchView = false
    
    @Environment(\.scenePhase) private var scenePhase;
    let saveAction: ()->Void;
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                SearchBar(searchTerm: $searchTerm)
                
                List {
                    ForEach(searchResults) { userPodcast in
                        PodcastRow(podcast: userPodcast.podcast)
                            .background( NavigationLink("", destination: UserPodcastDetailsView(userPodcast: userPodcast)).opacity(0)
                            )
                    }
                }
                .listStyle(.grouped)
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
                        showSearchView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
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
                NavigationLink(destination: AddView(), isActive: $showSearchView) {
                  EmptyView()
                }
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive {
                    saveAction();
                }
            }
        }
    }
    
    var searchResults: [UserPodcast] {
        if searchTerm.isEmpty {
            return userPodcasts
        } else {
            return userPodcasts.filter { $0.podcast.name.contains(searchTerm)
                || $0.podcast.network.contains(searchTerm)}
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userPodcasts: .constant(UserPodcastStore.example.podcasts), saveAction: {})
            .preferredColorScheme(.dark)
    }
}
