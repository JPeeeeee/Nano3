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
                LazyVGrid(columns: columns) {
                    ForEach(0..<currentAlbumArr.count, id: \.self) { i in
                        AlbumCard(rating: currentAlbumArr[i].rating, albumName: currentAlbumArr[i].name, imageUrl: currentAlbumArr[i].imageUrl)
                    }
                    
                }
                .padding()
                Spacer()
            }
        }
        .navigationTitle("Your albuns")
        .onAppear {
            collectionManager.currentColletion = name
            currentAlbumArr = collectionManager.collections[collectionManager.currentColletion]!.albuns
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                   SearchModal()
                } label: {
                    HStack {
                        Text("Search")
                        Image(systemName: "plus")
                    }
                    .foregroundColor(.blue)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SelectedCollectionView()
            .environmentObject(CollectionManager())
    }
}
