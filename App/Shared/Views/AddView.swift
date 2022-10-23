//
//  SearchView.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/13/22.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject private var userDataStore: UserDataStore
    
    @State var searchTerm = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            SearchBar(searchTerm: $searchTerm)
            if searchResults.count > 0 {
                List {
                    ForEach(searchResults) { podcast in
                        PodcastRow(podcast: podcast, hasNewEpisodes: false)
                            .background( NavigationLink("", destination: PodcastDetailsView(podcast: podcast)).opacity(0)
                            )
                    }
                }
                .listStyle(.grouped)
            }
            else {
                Text("No results found...")
                    .padding()
            }
            Spacer()
        }
//        .toolbar {
//            ToolbarItemGroup(placement: .navigationBarTrailing) {
//                Button {
//                    print("Edit button was tapped")
//                } label: {
//                    Image(systemName: "text.badge.plus")
//                }
//            }
//        }
        .navigationTitle("Add Podcast")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var searchResults: [Podcast] {
        return PodcastService.search(searchTerm: searchTerm)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
            .preferredColorScheme(.dark)
            .environmentObject(UserDataStore.example)
    }
}
