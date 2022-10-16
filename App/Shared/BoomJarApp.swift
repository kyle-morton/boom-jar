//
//  BoomJarApp.swift
//  Shared
//
//  Created by Kyle Morton on 10/9/22.
//

import SwiftUI

@main
struct BoomJarApp: App {
    
    @StateObject private var userPodcastStore = UserPodcastStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            HomeView(userPodcasts: $userPodcastStore.podcasts) {
                // Save Action
                Task {
                    do {
                        try await UserPodcastStore.save(userPodcasts: userPodcastStore.podcasts);
                    }
                    catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.");
                    }
                }
            }
            .task {
                do {
                    userPodcastStore.podcasts = try await UserPodcastStore.load();
                }
                catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "BoomJar will load sample data and continue.");
                }
            }
            .sheet(item: $errorWrapper, onDismiss: {
                userPodcastStore.podcasts = UserPodcastStore.example.podcasts;
            }) { wrapper in
                ErrorView(errorWrapper: wrapper)
            };
        }
    }
}
