//
//  SearchBar.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/13/22.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchTerm: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor((Color("LightGrey")))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search ..", text: $searchTerm)
            }
            .foregroundColor(.gray)
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(10)
//        .padding()
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchTerm: .constant(""))
    }
}
