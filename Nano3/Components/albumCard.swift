//
//  AlbumCard.swift
//  Nano3
//
//  Created by João Pedro Vieira Santos on 29/09/23.
//

import SwiftUI

struct AlbumCard: View {
    
    @State var navigationIsActive = false
    
    @EnvironmentObject var collectionManager: CollectionManager
    
    
    @State var rating: CGFloat
    var albumName = "Yefdsajkfhasdjkfhdajskfhadsjk"
    var imageUrl = URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/0c/06/05/0c060581-6242-6a2a-a677-20170f2cf8da/886447710180.jpg/1000x1000bb.jpg")
    var artist: String
    var cardIndex: Int
    
    var body: some View {
            
        VStack {
            AsyncImage(url: imageUrl) { Image in
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray
                    .frame(maxWidth: 200, maxHeight: 200)
            }
            
            VStack (alignment: .leading){
                HStack {
                    Text(albumName)
                        .foregroundColor(.black)
                        .fontWeight(.black)
                        .padding(.horizontal)
                        .padding(.bottom, 8)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
                
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
                .padding(.horizontal)
                .foregroundStyle(.black)
                .font(.caption)
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.white)
        .cornerRadius(10)
        .onTapGesture {
            navigationIsActive.toggle()
        }
        .onAppear {
            navigationIsActive = false
        }
        .contextMenu(ContextMenu(menuItems: {
            Button (role: .destructive){
                collectionManager.collections[collectionManager.currentColletion]!.albuns.remove(at: cardIndex)
            } label: {
                Text("Delete")
            }

        }))
        
        NavigationLink("", destination: AlbumDetailView(rating: $rating, albumName: albumName, imageUrl: imageUrl, artist: artist), isActive: $navigationIsActive)
    }
}

#Preview {
    NavigationStack {
        SelectedCollectionView()
            .environmentObject(CollectionManager())
    }
}
