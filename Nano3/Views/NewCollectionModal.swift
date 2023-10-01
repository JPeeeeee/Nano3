//
//  NewCollectionModal.swift
//  Nano3
//
//  Created by João Pedro Vieira Santos on 28/09/23.
//

import SwiftUI

struct NewCollectionModal: View {
    
    @Binding var showModal: Bool
    
    @State var collectionName = ""
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Text("Name")
                        .font(.caption)
                        .bold()
                    TextField("teste", text: $collectionName)
                } header: {
                    Text("New Collection")
                }
            }
        }
    }
}

#Preview {
    NewCollectionModal(showModal: .constant(true))
}
