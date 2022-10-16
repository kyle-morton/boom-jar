//
//  UserPodcastStore.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/15/22.
//

import Foundation
import SwiftUI

class UserPodcastStore: ObservableObject {
    
    @Published var podcasts: [UserPodcast]
    
    init() {
        self.podcasts = []
    }
    
    init(podcasts: [UserPodcast]) {
        self.podcasts = podcasts
    }
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("boomjar.data");
    }
    
    /// wrapper async function for the legacy DispatchQueue version
    static func load() async throws -> [UserPodcast] {
        try await withCheckedThrowingContinuation { continuation in
            load { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error);
                case .success(let userPodcasts):
                    continuation.resume(returning: userPodcasts);
                }
                
            }
        }
    }
    
    static func load(completion: @escaping (Result<[UserPodcast], Error>)->Void) {
        
        /// dispQueue is where you schedule tasks, these are FIFO, background is lowest priority
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL();
                
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]));
                    }
                    return;
                }
                
                /// You perform the longer-running tasks of opening the file and decoding its contents on a background queue. When those tasks complete, you switch back to the main queue.
                
                let userPodcasts = try JSONDecoder().decode([UserPodcast].self, from: file.availableData);
                DispatchQueue.main.async {
                    completion(.success(userPodcasts));
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
    static func save(userPodcasts: [UserPodcast]) async throws -> Int {
        try await withCheckedThrowingContinuation { continuation in
            save(userPodcasts:userPodcasts) { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error);
                case .success(let userPodcasts):
                    continuation.resume(returning: userPodcasts);
                }
                
            }
        }
    }
    
    static func save(userPodcasts: [UserPodcast], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(userPodcasts);
                let outfile = try fileURL();
                try data.write(to: outfile);
                DispatchQueue.main.async {
                    completion(.success(userPodcasts.count));
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
       
    static var example = UserPodcastStore(
        podcasts: [
            UserPodcast(id: 1, userId: 123, podcast: PodcastStore.examplePodcasts[0]),
            UserPodcast(id: 2, userId: 123, podcast: PodcastStore.examplePodcasts[2]),
            UserPodcast(id: 3, userId: 123, podcast: PodcastStore.examplePodcasts[7]),
            UserPodcast(id: 4, userId: 123, podcast: PodcastStore.examplePodcasts[8])
        ]
    )
    
    #endif
    
}
