//
//  SearchCard.swift
//  Nano3
//
//  Created by João Pedro Vieira Santos on 26/09/23.
//

import SwiftUI

struct SearchCard: View {
    
    var albumName: String
    var name: String
    var artist: String
    var imageUrl: URL?
    
    @EnvironmentObject var collectionManager: CollectionManager
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var showNewModal: Bool
    
    @Binding var cardAlbumName: String
    @Binding var cardSongName: String
    @Binding var cardArtist: String
    @Binding var cardImageUrl: URL?
    
    var body: some View {
        Button {
            cardAlbumName = albumName
            cardSongName = name
            cardArtist = artist
            cardImageUrl = imageUrl
            
            showNewModal = true
        } label: {
            HStack {
                AsyncImage(url: imageUrl) { Image in
                    Image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Color.gray
                }
                .frame(maxWidth: 50, maxHeight: 50)

                VStack (alignment: .leading){
                    Text(name)
                        .lineLimit(1)
                        .bold()
                    Text(artist)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .foregroundColor(.white)
            .preferredColorScheme(.dark)
        }
        .listRowBackground(Color.clear)
    }
}

#Preview {
    NavigationStack {
        SearchModal()
            .environmentObject(CollectionManager())
    }
}
