//
//  NewCollectionView.swift
//  Nano3
//
//  Created by João Pedro Vieira Santos on 28/09/23.
//

import SwiftUI

struct NewCollectionView: View {
    
    @State var collectionName = ""
    
    @EnvironmentObject var collectionManager: CollectionManager
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            List {
                Section {
                    TextField("Genre", text: $collectionName)
                }
            }
            .padding(.vertical)
            
            Button {
                collectionManager.collections.updateValue(CollectionItem(name: collectionName, albuns: []), forKey: collectionName)
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Cancel")
                        .padding()
                        .padding(.horizontal)
                        .padding()
                        .foregroundColor(.white)
                    Spacer()
                    Text("Add")
                        .padding()
                        .padding(.horizontal, 32)
                        .background(Color("pink"))
                        .cornerRadius(16)
                        .padding()
                        .foregroundColor(.white)
                }
                
            }
        }
        .navigationTitle("New Collection")
    }
}

#Preview {
    NavigationStack {
        NewCollectionView()
            .environmentObject(CollectionManager())
    }
}
