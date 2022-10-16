//
//  PodcastDetailsView.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/9/22.
//

import SwiftUI

struct PodcastDetailsView: View {
    
    var podcast: Podcast = Podcast()
    
    func ToggleFollow() {
        
    }
    
    var body: some View {
        VStack {
            HStack {
                PodcastLogo(podcast: podcast, isFullSize: false)
                VStack {
                    Text(podcast.name)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                    Text(podcast.network)
                        .font(.subheadline)
                }
                Spacer()
            }
            ZStack {
                Rectangle()
                    .foregroundColor((Color("LightBlue")))
                Button(action: ToggleFollow) {
                    Text("Follow")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
            }
            .frame(width: 100, height: 40, alignment: .leading)
            .cornerRadius(10)
            Spacer()
        }
    }
}

struct PodcastDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PodcastDetailsView(podcast: PodcastStore.example.podcasts[0])
            .preferredColorScheme(.dark)
    }
}
