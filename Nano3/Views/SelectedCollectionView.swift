//
//  SelectedCollectionView.swift
//  Nano3
//
//  Created by João Pedro Vieira Santos on 28/09/23.
//

import SwiftUI

struct SelectedCollectionView: View {
    
    var name = "Pop"
    var albuns: [AlbumItem] = []
    
    @EnvironmentObject var collectionManager: CollectionManager
    
    @State var currentAlbumArr: [AlbumItem] = [AlbumItem]()
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            ScrollView (showsIndicators: false) {
                
                HStack {
                    Text("Your Albuns")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    NavigationLink {
                       SearchModal()
                    } label: {
                        HStack {
                            Text("Add")
                            Image(systemName: "plus")
                        }
                        .foregroundColor(.blue)
                    }
                }
                .padding()
                
                LazyVGrid(columns: columns) {
                    ForEach(0..<currentAlbumArr.count, id: \.self) { i in
                        AlbumCard(rating: currentAlbumArr[i].rating, albumName: currentAlbumArr[i].name, imageUrl: currentAlbumArr[i].imageUrl, artist: currentAlbumArr[i].artist, cardIndex: i)
                    }
                    AlbumCard(rating: 0.0, artist: "artista", cardIndex: 0)
                }
                .padding()
                Spacer()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            collectionManager.currentColletion = name
            currentAlbumArr = collectionManager.collections[collectionManager.currentColletion]!.albuns
        }
//        .toolbar {
//            ToolbarItem(placement: .navigationBarTrailing) {
//                NavigationLink {
//                   SearchModal()
//                } label: {
//                    HStack {
//                        Text("Add")
//                        Image(systemName: "plus")
//                    }
//                    .foregroundColor(.blue)
//                }
//            }
//        }
    }
}

#Preview {
    NavigationStack {
        SelectedCollectionView()
            .environmentObject(CollectionManager())
    }
}
