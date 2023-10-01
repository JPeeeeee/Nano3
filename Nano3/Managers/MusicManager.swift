//
//  MusicManager.swift
//  Nano3
//
//  Created by João Pedro Vieira Santos on 25/09/23.
//

import Foundation
import MusicKit

struct MusicItem: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let artist: String
    let albumTitle: String?
    let genreNames: [String]
    let imageUrl: URL?
}

class MusicManager {
//    func searchMusic(term: String) async throws {
//        // Replacing spaces with '+' so the term fits the url we want
//        let termValue = term.replacingOccurrences(of: " ", with: "+")
//
//        // Building the GET url
//        var requestURLComponents = URLComponents()
//        requestURLComponents.scheme = "https"
//        requestURLComponents.host = "api.music.apple.com"
//        requestURLComponents.path = "/v1/me/library/search"
//
//        requestURLComponents.queryItems = [
//            URLQueryItem(name: "term", value: termValue),
//            URLQueryItem(name: "types", value: "library-songs")
//        ]
//
//        guard let url = requestURLComponents.url else { return }
//
//        let request = MusicDataRequest(urlRequest: URLRequest(url: url))
//        let response = try await request.response()
//
//        print(response.data)
//    }
    
    
}
