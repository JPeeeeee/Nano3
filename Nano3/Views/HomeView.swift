//
//  HomeView.swift
//  Nano3
//
//  Created by João Pedro Vieira Santos on 25/09/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var showModal = false
    @State var startAnimation = true
    
    @EnvironmentObject var collectionManager: CollectionManager
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private let colors = [
        "yellow",
        "pink",
        "darkOrange",
        "orange",
        "darkYellow"
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView (showsIndicators: false) {
                VStack {
                    HStack {
                        Text("Welcome!")
                            .font(.title)
                            .fontWeight(.black)
                        Spacer()
                    }
                    
                    LazyVGrid(columns: columns) {
                        
                        ForEach(Array(collectionManager.collections.keys.enumerated()), id: \.element) { i, value in
                            CollectionCard(collectionItem: collectionManager.collections[value] ?? CollectionItem(name: "Fodase", albuns: []), backgroundColor: Color(colors[i % 5]))
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .padding(.horizontal, 8)
            }
            .frame(maxWidth: .infinity)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                           NewCollectionView()
                        } label: {
                            HStack {
                                Text("New collection")
                                Image(systemName: "plus")
                            }
                            .foregroundColor(.blue)
                        }
                    
                }
            }
        }
        .preferredColorScheme(.dark)
        .overlay {
//            if startAnimation {
//                SplashView()
//            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                startAnimation = false
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CollectionManager())
    }
}
