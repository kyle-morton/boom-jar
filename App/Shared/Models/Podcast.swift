//
//  Podcast.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/9/22.
//

import Foundation

struct Podcast : Identifiable {
    var id: Int
    var name: String
    var network: String
    var logoUrl: String
    
    init(id: Int, name: String, network: String, logoUrl: String) {
        self.id = id
        self.name = name
        self.network = network
        self.logoUrl = logoUrl
    }
    
    init() {
        self.id = 0
        self.name = ""
        self.network = ""
        self.logoUrl = ""
    }
    
    
}
