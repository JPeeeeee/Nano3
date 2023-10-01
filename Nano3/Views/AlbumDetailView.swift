//
//  AlbumDetailView.swift
//  Nano3
//
//  Created by João Pedro Vieira Santos on 29/09/23.
//

import SwiftUI

extension Double {
    func truncate(places : Int)-> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}

struct AlbumDetailView: View {
    
    @Binding var rating: CGFloat
    var albumName: String
    var imageUrl: URL?
    
    var body: some View {
        VStack {
            AsyncImage(url: imageUrl) { Image in
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray
            }
            .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 2)
            .cornerRadius(16)
            .ignoresSafeArea()
            
            VStack {
                Text(albumName)
                
                VStack {
                    Text("Rate the album:")
                    
                    Slider(value: $rating, in: 0...10)
                    
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
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
        }
        .statusBarHidden()
    }
}

#Preview {
    AlbumDetailView(rating: .constant(3.5), albumName: "Ye")
}
