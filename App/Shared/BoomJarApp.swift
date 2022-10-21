//
//  BoomJarApp.swift
//  Shared
//
//  Created by Kyle Morton on 10/9/22.
//

import SwiftUI

@main
struct BoomJarApp: App {
    
    @StateObject var userPodcastStore = UserDataStore()
    @StateObject var podcastStore = PodcastStore()
    @StateObject var episodeStore = EpisodeStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            HomeView() {
                // Save Action
                Task {
                    do {
                        try await userPodcastStore.save(userPodcasts: userPodcastStore.podcasts);
                    }
                    catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.");
                    }
                }
            }
            .task {
                do {
                    userPodcastStore.podcasts = try await userPodcastStore.load();
                }
                catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "BoomJar will load sample data and continue.");
                }
            }
            .sheet(item: $errorWrapper, onDismiss: {
                userPodcastStore.podcasts = UserDataStore.example.podcasts;
            }) { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
            .environmentObject(podcastStore)
            .environmentObject(userPodcastStore)
            .environmentObject(episodeStore)
        }
    }
}
