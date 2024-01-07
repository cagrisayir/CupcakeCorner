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
        VStack {
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            
            List(results, id: \.trackId) { item in
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.headline)
                    Text(item.collectionName)
                }
            }
            .task {
                await loadData()
        }
        }
    }

    func loadData() async {
        // 1. Creating the URL we want to read
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        // 2. Fetching the data for that URL
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // 3. Decoding the result of that data into a Response struct
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
        
        
    }
}

#Preview {
    ContentView()
}
