//
//  CollectionManager.swift
//  Nano3
//
//  Created by João Pedro Vieira Santos on 28/09/23.
//

import Foundation

struct MusicItem: Identifiable, Hashable {
    var id = UUID()
    
    let name: String
    let artist: String
    let albumTitle: String?
    let genreNames: [String]
    let imageUrl: URL?
}

struct AlbumItem: Hashable {
    let name: String
    let genres: [String]
    let imageUrl: URL?
    let artist: String
    var rating: CGFloat
}

struct CollectionItem {
    let name: String
    var albuns: [AlbumItem]
}

class CollectionManager: ObservableObject {
    
    @Published var currentColletion = ""
    
    @Published var collections: [String: CollectionItem] = [
        "Hip Hop": CollectionItem(name: "Hip Hop", albuns: []),
        "Pop": CollectionItem(name: "Pop", albuns: []),
        "Brazilian Funk": CollectionItem(name: "Brazilian Funk", albuns: []),
        "Jazz": CollectionItem(name: "Jazz", albuns: []),
    ]
    
//    func populateCollections() {
//        
//    }
}
