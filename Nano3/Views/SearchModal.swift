//
//  SeachModal.swift
//  Nano3
//
//  Created by João Pedro Vieira Santos on 25/09/23.
//

import SwiftUI
import MusicKit


struct SearchModal: View {
    
    @State var searchText = ""
    @State var songs: [MusicItem] = [MusicItem]()
    
    @State var showNewModal = false
    
    // Clicked card Info
    
    @State var cardAlbumName = ""
    @State var cardSongName = ""
    @State var cardArtist = ""
    @State var cardImageUrl = URL(string: "")
    @State var cardRating = 0.0
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func searchMusic(term: String){
        
         // Request permission
        Task {
            let status = await MusicAuthorization.request()
            
            switch status {
            case .authorized:
                do {
                    let request = MusicCatalogSearchRequest(term: term, types: [Song.self])
                    let result = try await request.response()
                    self.songs = result.songs.map({
                        return .init(name: $0.title, artist: $0.artistName, albumTitle: $0.albumTitle, genreNames: $0.genreNames, imageUrl: $0.artwork?.url(width: 1000, height: 1000))
                    })
                    print(String(describing: songs))
                } catch {
                    print(String(describing: error))
                }
            default:
                break
            }
        }
    }
    
    var body: some View {
        VStack {
            ZStack {
                
                // Bruh
                Text(cardAlbumName).opacity(0)
                    .foregroundStyle(.red)
                Text(cardSongName).opacity(0)
                Text(cardArtist).opacity(0)
                AsyncImage(url: cardImageUrl) { Image in
                    Image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Color.gray
                }
                .frame(maxWidth: 50, maxHeight: 50).opacity(0)
                
                
                List {
                    if searchText != "" {
                        ForEach(songs) { song in
                            SearchCard(
                                albumName: song.albumTitle ?? "", name: song.name, artist: song.artist, imageUrl: song.imageUrl, showNewModal: $showNewModal,
                                
                                cardAlbumName: $cardAlbumName,
                                cardSongName: $cardSongName,
                                cardArtist: $cardArtist,
                                cardImageUrl: $cardImageUrl
                            )
                        }
                    }
//                    
//                    SearchCard(albumName: "teste", name: "teste", artist: "teste", imageUrl: URL(string: ""), showNewModal: $showNewModal,
//                               cardAlbumName: $cardAlbumName,
//                               cardSongName: $cardSongName,
//                               cardArtist: $cardArtist,
//                               cardImageUrl: $cardImageUrl
//                    )
//                    SearchCard(albumName: "teste2", name: "teste2", artist: "teste2", imageUrl: URL(string: ""), showNewModal: $showNewModal,
//                               cardAlbumName: $cardAlbumName,
//                               cardSongName: $cardSongName,
//                               cardArtist: $cardArtist,
//                               cardImageUrl: $cardImageUrl
//                    )
                }
            }
        }
        .onChange(of: showNewModal, perform: { newValue in
            if newValue == false {
                presentationMode.wrappedValue.dismiss()
            }
        })
        .navigationTitle("Search")
        .searchable(text: $searchText)
        .onChange(of: searchText) { newValue in
            print(newValue)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                searchMusic(term: newValue)
            }
        }
        .sheet(isPresented: $showNewModal, content: {
            NewAlbumModal(albumName: cardAlbumName, name: cardSongName, artist: cardArtist, imageUrl: cardImageUrl, rating: cardRating, showNewModal: $showNewModal)
                .presentationDetents([.height(500)])
        })
    }
}


struct SearchModal_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SearchModal()
        }
    }
}
