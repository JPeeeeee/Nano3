//
//  SelectedCollectionView.swift
//  Nano3
//
//  Created by João Pedro Vieira Santos on 28/09/23.
//

import SwiftUI

struct SelectedCollectionView: View {
    
    var name = "Pop"
    var albuns: Set<AlbumItem> = Set<AlbumItem>()
    
    @EnvironmentObject var collectionManager: CollectionManager
    
    @State var currentAlbumArr: Set<AlbumItem> = Set<AlbumItem>()
    
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
                    ForEach(currentAlbumArr.sorted(by: <), id: \.self) { element in
                        AlbumCard(rating: element.rating, albumName: element.name, imageUrl: element.imageUrl, artist: element.artist)
                    }
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
        .onChange(of: collectionManager.collections[collectionManager.currentColletion]?.albuns) { newValue in
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
