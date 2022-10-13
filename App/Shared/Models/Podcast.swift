//
//  Podcast.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/9/22.
//

import Foundation

struct Podcast : Identifiable, Codable {
    var id: Int
    var name: String
    var network: String
    var logoUrl: String
    var subscribed: Bool
    
    
    init(id: Int, name: String, network: String, logoUrl: String, subscribed: Bool = false) {
        self.id = id
        self.name = name
        self.network = network
        self.logoUrl = logoUrl
        self.subscribed = subscribed
    }
    
    init() {
        self.id = 0
        self.name = ""
        self.network = ""
        self.logoUrl = ""
        self.subscribed = false
    }
    
    
}
