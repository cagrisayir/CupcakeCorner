//
//  Response.swift
//  CupcakeCorner
//
//  Created by Omer Cagri Sayir on 5.01.2024.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
