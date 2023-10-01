//
//  CollectionCard.swift
//  Nano3
//
//  Created by João Pedro Vieira Santos on 25/09/23.
//

import SwiftUI

struct CollectionCard: View {
    var genre = ""
    
    var collectionItem: CollectionItem = CollectionItem(name: "Hip Hop", albuns: [])
    var backgroundColor: Color = .gray
    
    var body: some View {
        NavigationLink {
            SelectedCollectionView(name: collectionItem.name, albuns: collectionItem.albuns)
        } label: {
            ZStack {
                
                Rectangle()
                    .fill(backgroundColor)
                    .frame(maxWidth: 200, maxHeight: 250)
            
                
                Text(collectionItem.name)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .fontWeight(.black)
                    .padding(.vertical, 32)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: 200, minHeight: 200)
            .cornerRadius(10)
        }
        
    }
}

struct CollectionCard_Previews: PreviewProvider {
    static var previews: some View {
        CollectionCard(backgroundColor: .gray)
    }
}
