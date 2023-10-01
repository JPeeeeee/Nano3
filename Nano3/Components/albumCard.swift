//
//  AlbumCard.swift
//  Nano3
//
//  Created by João Pedro Vieira Santos on 29/09/23.
//

import SwiftUI

struct AlbumCard: View {
    
    @State var rating: CGFloat
    var albumName = "Yefdsajkfhasdjkfhdajskfhadsjk"
    var imageUrl = URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/76/1b/36/761b368d-a267-4a99-9689-f5daf9bb1325/18UMGIM26291.rgb.jpg/75x75bb.jpg")
    
    var body: some View {
        
        NavigationLink {
            AlbumDetailView(rating: $rating, albumName: albumName)
        } label: {
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
            .padding(.top)
        }
    }
}

#Preview {
    NavigationStack {
        SelectedCollectionView()
            .environmentObject(CollectionManager())
    }
}
