//
//  ErrorWrapper.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/15/22.
//

import Foundation

struct ErrorWrapper : Identifiable {
    let id: UUID;
    let error: Error;
    let guidance: String;
    
    internal init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
    
}
