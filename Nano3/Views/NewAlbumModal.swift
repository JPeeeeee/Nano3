//
//  NewAlbumModal.swift
//  Nano3
//
//  Created by João Pedro Vieira Santos on 29/09/23.
//

import SwiftUI

struct NewAlbumModal: View {
    
    @State var albumName: String
    @State var name: String
    @State var artist: String
    @State var imageUrl: URL?
    @State var rating: CGFloat
    
    @EnvironmentObject var collectionManager: CollectionManager
    
    @Binding var showNewModal: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Add new album...")
                    .fontWeight(.black)
                    .font(.title)
                    .padding(.top)
                    .padding()
                
                Spacer()
            }
            
            AsyncImage(url: imageUrl) { Image in
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray
            }
            .frame(maxWidth: 150, maxHeight: 150)
            
            VStack {
                
                HStack {
                    Text(albumName)
                        .foregroundStyle(.white)
                        .fontWeight(.black)
                        .font(.title2)
                    
                    Spacer()
                }
                .padding(.top)
                .padding(.horizontal)
                
                HStack {
                    Text(artist)
                        .foregroundStyle(.gray)
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            
            VStack {
                Text("Rate the album:")
                
                Slider(value: $rating, in: 0...10)
                    .padding(.horizontal)
                
                HStack {
                    ForEach(0..<Int(rating / 2), id: \.self) {_ in
                        Image(systemName: "star.fill")
                    }
                    
                    if rating.truncatingRemainder(dividingBy: 1) > 0 {
                        Image(systemName: "star.leadinghalf.filled")
                        
                        ForEach(0..<4-Int(rating / 2), id: \.self) { _ in
                            Image(systemName: "star")
                        }
                    } else {
                        ForEach(0..<5-Int(rating / 2), id: \.self) { _ in
                            Image(systemName: "star")
                        }
                    }
                }
                
                Spacer()
                
                Button {
                    
                    print(collectionManager.currentColletion)
                    if !collectionManager.collections[collectionManager.currentColletion]!.albuns.contains(where: {
                        $0.name == name
                    }) {
                        collectionManager.collections[collectionManager.currentColletion]?.albuns.append(AlbumItem(name: albumName, genres: [], imageUrl: imageUrl, artist: artist, rating: rating))
                    }
                    
                    print(String(describing: collectionManager.collections))
                    
                    showNewModal = false
                } label: {
                    Text("Add")
                        .padding()
                        .foregroundStyle(.black)
                        .background(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
    
    #Preview {
        NavigationStack {
            SearchModal(showNewModal: true, cardAlbumName: "teste", cardSongName: "teste", cardArtist: "teste", cardImageUrl: URL(string: ""))
        }
    }
}
