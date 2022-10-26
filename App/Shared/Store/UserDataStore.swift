//
//  UserPodcastStore.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/15/22.
//

import Foundation
import SwiftUI

class UserDataStore: ObservableObject {
    
    @Published var podcasts: [UserPodcast]
    @Published var podcastEpisodes: [UserPodcastEpisode]
    
    init() {
        self.podcasts = []
        self.podcastEpisodes = []
    }
    
    init(podcasts: [UserPodcast], episodes: [UserPodcastEpisode]) {
        self.podcasts = podcasts
        self.podcastEpisodes = episodes
    }
        
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("boomjar-user.data");
    }
    
    public func subscribe(podcast: Podcast) -> UserPodcast {

        let newUserPodcast = UserPodcast(id: podcasts.count, userId: 123, podcast: podcast)
        podcasts.append(newUserPodcast)
        
        return newUserPodcast
    }
    
    public func unsubscribe(podcastId: Int)  {
        podcasts = podcasts.filter{ $0.podcastId != podcastId }
    }
    
    public func isSubscribed(podcastId: Int) -> Bool {
        return podcasts.contains{ $0.podcastId == podcastId}
    }
    
    public func hasPlayedEpisode(episodeId: Int) -> Bool {
        return podcastEpisodes.contains { $0.episodeId == episodeId }
    }
    
    
    
    //     LOAD/UNLOAD
    
    /// wrapper async function for the legacy DispatchQueue version
    func load() async throws -> UserData {
        try await withCheckedThrowingContinuation { continuation in
            load { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error);
                case .success(let userData):
                    continuation.resume(returning: userData);
                }
                
            }
        }
    }
    
    func load(completion: @escaping (Result<UserData, Error>)->Void) {
        
        /// dispQueue is where you schedule tasks, these are FIFO, background is lowest priority
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try UserDataStore.fileURL();
                
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success(UserData()));
                    }
                    return;
                }
                
                /// You perform the longer-running tasks of opening the file and decoding its contents on a background queue. When those tasks complete, you switch back to the main queue.
                let userData = try JSONDecoder().decode(UserData.self, from: file.availableData);
                DispatchQueue.main.async {
                    completion(.success(userData));
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(.failure(error));
                }
            }
        }
    };
    
    /// discardable result -> disables compiler warnings if client doesn't store FNs return value
    @discardableResult
    func save() async throws -> Int {
        try await withCheckedThrowingContinuation { continuation in
            save() { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error);
                case .success(let userPodcasts):
                    continuation.resume(returning: userPodcasts);
                }
                
            }
        }
    }
    
    func save(completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let userData = UserData(podcasts: self.podcasts, episodes: self.podcastEpisodes)
                let data = try JSONEncoder().encode(userData);
                let outfile = try UserDataStore.fileURL();
                try data.write(to: outfile);
                DispatchQueue.main.async {
                    completion(.success(userData.podcasts.count));
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(.failure(error));
                }
            }
        };
    }
    
    #if DEBUG
       
    static var example = UserDataStore(
        podcasts: [
            UserPodcast(id: 1, userId: 123, podcast: PodcastService.examplePodcasts[0]),
            UserPodcast(id: 2, userId: 123, podcast: PodcastService.examplePodcasts[2]),
            UserPodcast(id: 3, userId: 123, podcast: PodcastService.examplePodcasts[7]),
            UserPodcast(id: 4, userId: 123, podcast: PodcastService.examplePodcasts[8])
        ],
        episodes: [
            UserPodcastEpisode(id: 1, userPodcastId: 1, episodeId: 15, startingSecond: 15),
            UserPodcastEpisode(id: 2, userPodcastId: 1, episodeId: 81, startingSecond: 55),
            UserPodcastEpisode(id: 3, userPodcastId: 1, episodeId: 90, startingSecond: 25),
            UserPodcastEpisode(id: 4, userPodcastId: 1, episodeId: 2, startingSecond: 1)
        ]
    )
    
    #endif
    
}
