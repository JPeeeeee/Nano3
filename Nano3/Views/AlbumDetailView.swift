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
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var rating: CGFloat
    var albumName: String
    var imageUrl: URL?
    var artist: String
    
    var body: some View {
        
        
        VStack {
            ScrollView {
                AsyncImage(url: imageUrl) { Image in
                    Image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray
                }
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 2)
                .cornerRadius(16)
                .ignoresSafeArea()
                
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
                    
                    HStack {
                        ForEach(0..<Int(rating / 2), id: \.self) {_ in
                            Image(systemName: "star.fill")
                                .font(.title3)
                        }
                        
                        if rating.truncatingRemainder(dividingBy: 1) > 0 {
                            Image(systemName: "star.leadinghalf.filled")
                                .font(.title3)
                            
                            ForEach(0..<4-Int(rating / 2), id: \.self) { _ in
                                Image(systemName: "star")
                                    .font(.title3)
                            }
                        } else {
                            ForEach(0..<5-Int(rating / 2), id: \.self) { _ in
                                Image(systemName: "star")
                                    .font(.title3)
                            }
                        }
                    }
                    .padding()
                    
                    Slider(value: $rating, in: 0...10)
                        .padding(.horizontal, 32)
                }
            }
        
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                VStack {
                    Text("Done")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
    }
}

#Preview {
    AlbumDetailView(rating: .constant(3.5), albumName: "Ye", artist: "artista")
}
