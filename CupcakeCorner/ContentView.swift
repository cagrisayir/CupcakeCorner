//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Omer Cagri Sayir on 1.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var results = [Result]()
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
    }
}

#Preview {
    ContentView()
}
