//
//  BoomJarApp.swift
//  Shared
//
//  Created by Kyle Morton on 10/9/22.
//

import SwiftUI

@main
struct BoomJarApp: App {
    
    @StateObject var userDataStore = UserDataStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            HomeView() {
                // Save Action
                Task {
                    do {
                        try await userDataStore.save();
                    }
                    catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.");
                    }
                }
            }
            .task {
                do {
                    let userData = try await userDataStore.load()
                    userDataStore.podcasts = userData.podcasts
                    userDataStore.podcastEpisodes = userData.episodes
                    
//                    NotificationCenter.default.addObserver(forName: UIApplication.willTerminateNotification, object: nil, queue: .main) { _ in
//                        await userPodcastStore.save(userPodcasts: userPodcastStore.podcasts);
//                    }
                }
                catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "BoomJar will load sample data and continue.");
                }
            }
            .sheet(item: $errorWrapper, onDismiss: {
                userDataStore.podcasts = UserDataStore.example.podcasts
                userDataStore.podcastEpisodes = UserDataStore.example.podcastEpisodes
            }) { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
            .environmentObject(userDataStore)
        }
    }
}
